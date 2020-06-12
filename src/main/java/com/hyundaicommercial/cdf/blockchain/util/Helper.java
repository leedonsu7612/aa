package com.hyundaicommercial.cdf.blockchain.util;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.EnumSet;
import java.util.Properties;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Vector;
//import java.util.logging.Logger;
import java.util.Random;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.constructor.Constructor;
import org.hyperledger.fabric.sdk.BlockEvent.TransactionEvent;
import org.hyperledger.fabric.sdk.ChaincodeID;
import org.hyperledger.fabric.sdk.Channel;
import org.hyperledger.fabric.sdk.Channel.PeerOptions;
import org.hyperledger.fabric.sdk.security.CryptoSuite;
import org.hyperledger.fabric.sdk.HFClient;
import org.hyperledger.fabric.sdk.Orderer;
import org.hyperledger.fabric.sdk.Peer;
import org.hyperledger.fabric.sdk.Peer.PeerRole;
import org.hyperledger.fabric.sdk.ProposalResponse;
import org.hyperledger.fabric.sdk.QueryByChaincodeRequest;
import org.hyperledger.fabric.sdk.TransactionProposalRequest;
import org.hyperledger.fabric.sdk.exception.InvalidArgumentException;
import org.hyperledger.fabric.sdk.exception.ProposalException;
import org.hyperledger.fabric.sdk.exception.TransactionException;

import com.hyundaicommercial.cdf.blockchain.object.ChaincodeListener;
import com.hyundaicommercial.cdf.blockchain.object.Configuration;
import com.hyundaicommercial.cdf.blockchain.object.OrdererOrg;
import com.hyundaicommercial.cdf.blockchain.object.PeerConfig;
import com.hyundaicommercial.cdf.blockchain.object.PeerOrg;
import com.hyundaicommercial.cdf.blockchain.object.UserContext;
import com.hyundaicommercial.cdf.blockchain.object.UserEnrollment;

import static org.hyperledger.fabric.sdk.Channel.PeerOptions.createPeerOptions;

public class Helper {
    //private static Logger logger = Logger.getGlobal();
    final static Logger logger = Logger.getLogger(Helper.class);
    private Configuration networkConfig = null;
    private HFClient client = null;
    private Channel channel = null;
    private Map<String, List<Peer>> peers = null;
    private List<String> mspIdList = null;
    private int timeout;
    private Map<String, Properties> ccProps = null;

    Random generator = null;

    public Helper(String configFile) throws IOException {

        // Load config.yaml
        try {
            Yaml yaml = new Yaml(new Constructor(Configuration.class));
            Path path = Paths.get(configFile).toAbsolutePath();
            logger.info(String.format("Load configuration from %s.\n", path));
            InputStream input = new FileInputStream(path.toString());
            this.networkConfig = yaml.load(input);
            input.close();
        } catch (IOException e) {
            logger.error("Failed to load configuration file: " + configFile, e);
            e.printStackTrace();
            throw e;
        }

        // Load properties for chaincode
        this.ccProps = new HashMap<String, Properties>();
        String chaincodeArray[] = {"acntsreceivable", "byrlimit", "extracollection", "setoffcollection"};
        for (String chaincode: chaincodeArray) {
            String resource = "config/" + chaincode + ".properties";
            Properties props = new Properties();

            // Load properties from a file
            try {
                logger.info(String.format("Load chaincode properties: %s", resource));
                Path path = Paths.get(resource);
                InputStream inputStream = new FileInputStream(path.toString());
                props.load(inputStream);
                inputStream.close();
            } catch (IOException e) {
                logger.error("Failed to load properties", e);
                e.printStackTrace();
                throw e;
            }

            this.ccProps.put(chaincode, props);
        }

        this.generator = new Random();

        // Create client instance
        this.client = HFClient.createNewInstance();
        // Set CryptoSuite for client
        try {
            this.client.setCryptoSuite(CryptoSuite.Factory.getCryptoSuite());
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set User
        Map<String,String> userConfig = getUserConfig();
        UserContext user = new UserContext("client", userConfig.get("mspId"));
        UserEnrollment userEnroll = new UserEnrollment(userConfig.get("privKey"), userConfig.get("pubCert"));
        user.setEnrollment(userEnroll);

        try {
            this.client.setUserContext(user);
        } catch (InvalidArgumentException e) {
            e.printStackTrace();
        }
        
        // Get default Channel
        String channelName = getChannelConfig().get("name");
        try {
            this.channel = this.client.newChannel(channelName);
        } catch (InvalidArgumentException e) {
            e.printStackTrace();
        }

        // Add orderers on channel
        for (Orderer orderer: getOrderers()) {
            try {
                this.channel.addOrderer(orderer);
            } catch (InvalidArgumentException e) {
                e.printStackTrace();
            }
        }

        // Set peers
        this.peers = new HashMap<String, List<Peer>>();
        this.mspIdList = new Vector<>();

        for (PeerOrg member: networkConfig.getMembers()) {

            Vector<Peer> peers = new Vector<>();
            String userMspId = client.getUserContext().getMspId();
            String memberMspId = member.getMspId();
            this.mspIdList.add(memberMspId);

            PeerOptions peerOptions = createPeerOptions();
            if (userMspId.equals(memberMspId)) {
                peerOptions = peerOptions.setPeerRoles(EnumSet.of(PeerRole.CHAINCODE_QUERY, PeerRole.ENDORSING_PEER, PeerRole.EVENT_SOURCE));
            } else {
                peerOptions = peerOptions.setPeerRoles(EnumSet.of(PeerRole.ENDORSING_PEER));
            }

            for (PeerConfig peerConfig: member.getPeers()) {
                peerConfig.addDomain(member.getDomain());
                peerConfig.setTlsCAFile(member.getTlsCAFile());

                Properties peerProps = new Properties();
                Peer peer = null;
                String name = peerConfig.getName();
                String ipAddress = peerConfig.getIp();
                int port = peerConfig.getPort();
                String endPoint = peerConfig.isTLSEnabled()? "grpcs://" + ipAddress + ":" + port : "grpc://" + ipAddress + ":" + port;
                peerProps.setProperty("hostnameOverride", name);
                if (peerConfig.isTLSEnabled()) {
                    peerProps.setProperty("pemFile", peerConfig.getTlsCAFile());
                    peerProps.setProperty("negotiationType", "TLS");
                    peerProps.setProperty("sslProvider", "openSSL");
                }

                // Create peer
                try {
                    peer = client.newPeer(name, endPoint, peerProps);
                    channel.addPeer(peer, peerOptions);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                peers.add(peer);
            }

            this.peers.put(memberMspId, peers);
        }

        // Get Timeout
        this.timeout = networkConfig.getTimeout();

        // Initialize channel
        logger.info("Channel is not initialized: " + channel.getName());
        try {
            logger.info("Initializing Channel: " + channel.getName());
            channel.initialize();
        } catch (InvalidArgumentException e) {
            logger.error("Failed to initialize channel. Invalid Argument", e);
            e.printStackTrace();
        } catch (TransactionException e) {
            logger.error("Failed to initialize channel. Transaction Exception", e);
            e.printStackTrace();
        }
    }

    public HFClient getClient() {
        return client;
    }

    private Peer getPeer(String mspId) {

        int size = peers.get(mspId).size();
        return peers.get(mspId).get(generator.nextInt(size));
    }

    public Channel getChannel() {
        return channel;
    }

    private Map<String,String> getUserConfig() {
        return networkConfig.getUser();
    }

    private Map<String,String> getChannelConfig() {
        return networkConfig.getChannel();
    }

    //public int getRetryCount() {
    //    return retryCount;
    //}

    public int getTimeout() {
        return timeout;
    }

    /**
     * Make list of Orderers
     * @param client HFClient
     * @return orderers
     */
    private Vector<Orderer> getOrderers() {
        Vector<Orderer> orderers = new Vector<>();

        List<OrdererOrg> ordererOrgConfig = networkConfig.getOrdererorg();
        for (OrdererOrg ordererConfig: ordererOrgConfig) {
            for (PeerConfig orderConfig: ordererConfig.getOrderers()) {
                orderConfig.addDomain(ordererConfig.getDomain());
                orderConfig.setTlsCAFile(ordererConfig.getTlsCAFile());

                Properties orderProps = new Properties();
                Orderer orderer = null;
                String name = orderConfig.getName();
                String ipAddress = orderConfig.getIp();
                int port = orderConfig.getPort();
                String endPoint = orderConfig.isTLSEnabled()? "grpcs://" + ipAddress + ":" + port : "grpc://" + ipAddress + ":" + port;
                orderProps.setProperty("hostnameOverride", name);
                if (orderConfig.isTLSEnabled()) {
                    orderProps.setProperty("pemFile", orderConfig.getTlsCAFile());
                    orderProps.setProperty("negotiationType", "TLS");
                    orderProps.setProperty("sslProvider", "openSSL");
                }

                try {
                    orderer = client.newOrderer(name, endPoint, orderProps);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                orderers.add(orderer);
            }
        }

        return orderers;
    }

    /**
     * Make list of Peers
     * @param client HFClient
     * @return peers
     */
    /*
    public Vector<PeerWithOptions> getPeers(HFClient client) {
        Vector<PeerWithOptions> peersWithOption = new Vector<>();
        Map<String,String> userConfig = networkConfig.getUser();

        for (PeerOrg member: networkConfig.getMembers()) {
            PeerOptions peerOption = createPeerOptions();
            if (!userConfig.get("mspId").equals(member.getMspId())) {
                peerOption = peerOption.setPeerRoles(EnumSet.complementOf(EnumSet.of(PeerRole.EVENT_SOURCE, PeerRole.LEDGER_QUERY)));
            }

            for (PeerConfig peerConfig: member.getPeers()) {
                peerConfig.addDomain(member.getDomain());
                peerConfig.setTlsCAFile(member.getTlsCAFile());

                Properties peerProps = new Properties();
                Peer peer = null;
                String name = peerConfig.getName();
                String ipAddress = peerConfig.getIp();
                String endPoint = peerConfig.isTLSEnabled()? "grpcs://" + ipAddress + ":7051" : "grpc://" + ipAddress + ":7051";
                peerProps.setProperty("hostnameOverride", name);
                if (peerConfig.isTLSEnabled()) {
                    peerProps.setProperty("pemFile", peerConfig.getTlsCAFile());
                    peerProps.setProperty("negotiationType", "TLS");
                    peerProps.setProperty("sslProvider", "openSSL");
                }

                // Create peer
                try {
                    peer = client.newPeer(name, endPoint, peerProps);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                peersWithOption.add(new PeerWithOptions(peer, peerOption));
            }
        }
        return peersWithOption;
    }
    */

    /*
    public Vector<PeerWithOptions> getEndorsementPeers(HFClient client) {
        Vector<PeerWithOptions> peersWithOptions = new Vector<>();
        Map<String,String> userConfig = networkConfig.getUser();

        for (PeerOrg member: networkConfig.getMembers()) {
            PeerOptions peerOption = createPeerOptions();
            if (!userConfig.get("mspId").equals(member.getMspId())) {
                peerOption = peerOption.setPeerRoles(EnumSet.complementOf(EnumSet.of(PeerRole.EVENT_SOURCE, PeerRole.LEDGER_QUERY)));
            }

            int size = member.getPeers().size();
            PeerConfig peerConfig = member.getPeers().get(generator.nextInt(size));
            peerConfig.addDomain(member.getDomain());
            peerConfig.setTlsCAFile(member.getTlsCAFile());

            Properties peerProps = new Properties();
            Peer peer = null;
            String name = peerConfig.getName();
            String ipAddress = peerConfig.getIp();
            String endPoint = peerConfig.isTLSEnabled()? "grpcs://" + ipAddress + ":7051" : "grpc://" + ipAddress + ":7051";
            peerProps.setProperty("hostnameOverride", name);
            if (peerConfig.isTLSEnabled()) {
                peerProps.setProperty("pemFile", peerConfig.getTlsCAFile());
            }

            try {
                peer = client.newPeer(name, endPoint, peerProps);
            } catch (Exception e) {
                e.printStackTrace();
            }
            PeerWithOptions peerWithOptions = new PeerWithOptions(peer, peerOption);
            peersWithOptions.add(peerWithOptions);
        }

        return peersWithOptions;
    }

    public Peer getQueryPeer(HFClient client) {
        
        Peer peer = null;
        Map<String,String> userConfig = networkConfig.getUser();

        for (PeerOrg member: networkConfig.getMembers()) {
            if (userConfig.get("mspId").equals(member.getMspId())) {
                int size = member.getPeers().size();
                PeerConfig peerConfig = member.getPeers().get(generator.nextInt(size));
                peerConfig.addDomain(member.getDomain());
                peerConfig.setTlsCAFile(member.getTlsCAFile());

                Properties peerProps = new Properties();
                String name = peerConfig.getName();
                String ipAddress = peerConfig.getIp();
                String endPoint = peerConfig.isTLSEnabled()? "grpcs://" + ipAddress + ":7051" : "grpc://" + ipAddress + ":7051";
                peerProps.setProperty("hostnameOverride", name);
                if (peerConfig.isTLSEnabled()) {
                    peerProps.setProperty("pemFile", peerConfig.getTlsCAFile());
                }

                try {
                    peer = client.newPeer(name, endPoint, peerProps);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            }
        }

        return peer;
    }
    */

    /*
    public class PeerWithOptions {
        private Peer peer;
        private PeerOptions peerOptions;

        PeerWithOptions(Peer peer, PeerOptions peerOptions) {
            this.peer = peer;
            this.peerOptions = peerOptions;
        }

        public Peer getPeer() {
            return peer;
        }

        public PeerOptions getPeerOptions() {
            return peerOptions;
        }
    }
    */

    /*
    private Channel refreshChannel(HFClient client, Channel channel, byte[] defaultChannel) throws Exception {
        // Shutdown Channel
        if (channel != null) {
            channel.shutdown(false);
        }

        channel = null;

        try {
            channel = client.deSerializeChannel(defaultChannel);
        } catch (IOException e) {
            logger.error("Failed to deSerialize channel. IO Error");
            e.printStackTrace();
            throw e;
        } catch (ClassNotFoundException e) {
            logger.error("Failed to deSerialize channel. Not Found Class");
            e.printStackTrace();
            throw e;
        } catch (InvalidArgumentException e) {
            logger.error("Failed to deSerialize channel. Invalid Argument");
            e.printStackTrace();
            throw e;
        }

        // Add Peers on channel
        for (PeerWithOptions peerWithOptions: getEndorsementPeers(client)) {
            try {
                channel.addPeer(peerWithOptions.getPeer(), peerWithOptions.getPeerOptions());
            } catch (InvalidArgumentException e) {
                logger.error("Failed to add Peer on channel");
                e.printStackTrace();
                throw e;
            }
        }
        
        // Initialize channel
        if (!channel.isInitialized()) {
            logger.info("Channel is not initialized: " + channel.getName());
            try {
                logger.info("Initializing Channel: " + channel.getName());
                channel.initialize();
            } catch (InvalidArgumentException e) {
                logger.error("Failed to initialize channel. Invalid Argument");
                e.printStackTrace();
                throw e;
            } catch (TransactionException e) {
                logger.error("Failed to initialize channel. Transaction Exception");
                e.printStackTrace();
                throw e;
            }   
        }

        return channel;
    }
    */

    /**
     * Create error message in JSON object
     * @param errMsg String error message
     * @return json String
     */
    public static String makeError(String errMsg) {

        JSONObject result = new JSONObject();
        result.put("STATUS", "2");
        result.put("ERROR_MSG", errMsg);

        return result.toString();
    }

    /**
     * 
     * @param data
     * @return
     */
    public static String makeSuccess(String data) {

        logger.info("data: " + data);
        JSONObject result = new JSONObject();
        result.put("result", data);
        result.put("STATUS", "1");
        result.put("ERROR_MSG", "");

        return result.toString();
    }

    public String queryChaincode(String chaincodeName, String fcnName, String input) {

        Properties props = ccProps.get(chaincodeName);
        /*
        String resource = "config/" + chainc=odeName + ".properties";
        Properties props = new Properties();

        // Get properties
        try {
            logger.info("Get " + resource + " from file.");
            Path path = Paths.get(resource);
            InputStream inputStream = new FileInputStream(path.toString());
            props.load(inputStream);
            inputStream.close();
        } catch (IOException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
            return makeError(e.getMessage());
        }
        */

        // Parse & Sanitize input JSON object
        String inputParams = props.getProperty(fcnName + ".params");
        String[] inputArray = inputParams.split(",");
        
        JSONObject inputJson = new JSONObject(input);
        for (String inputParam: inputArray) {
            if (!inputJson.has(inputParam)) {
                return makeError("Not enough arguments are transferred. Invalid: " + inputParam);
            }
        }

        // Deserialize channel
        /*
        Channel channel = null;
        try {
            channel = client.deSerializeChannel(defaultChannel);
        } catch (Exception e) {
            logger.error("Failed to deSerialize Channel");
            e.printStackTrace();
            return makeError(e.getMessage());
        }

        // Add Peer on channel
        try {
            channel.addPeer(getQueryPeer(client));
        } catch (InvalidArgumentException e) {
            logger.error("Failed to add peer on channel.");
            e.printStackTrace();
            return makeError(e.getMessage());
        }
        */

        // Initialize channel
        if (!channel.isInitialized()) {
            logger.info("Channel is not initialized: " + channel.getName());
            try {
                logger.info("Initializing Channel: " + channel.getName());
                channel.initialize();
            } catch (InvalidArgumentException e) {
                logger.error("Failed to initialize channel.", e);
                e.printStackTrace();
                return makeError(e.getMessage());
            } catch (TransactionException e) {
                logger.error("Failed to initialize channel.", e);
                e.printStackTrace();
                return makeError(e.getMessage());
            }   
        }
        
        // Create Query proposal request
        String method = props.getProperty(fcnName + ".method");
        QueryByChaincodeRequest request = createQueryRequest(client, chaincodeName, method, input);

        Collection<ProposalResponse> responses;
        try {
            String userMspId = client.getUserContext().getMspId();
            Vector<Peer> queryPeer = new Vector<>();
            queryPeer.add(getPeer(userMspId));
            responses = channel.queryByChaincode(request, queryPeer);
        } catch (InvalidArgumentException e) {
            logger.error("Failed to query chaincode. Invalid Argument", e);
            e.printStackTrace();
            return makeError(e.getMessage());
        } catch (ProposalException e) {
            logger.error("Failed to query chaincode. Proposal Exception", e);
            e.printStackTrace();
            return makeError(e.getMessage());
        }

        String result = null;
        for (ProposalResponse response: responses) {
            try {
                result = new String(response.getChaincodeActionResponsePayload());
            } catch (InvalidArgumentException e) {
                logger.error("Failed to get chaincode result.", e);
                e.printStackTrace();
                return makeError(e.getMessage());
            }
        }

        return makeSuccess(result);
    }
    
    /**
     * Invoke chaincode
     * @param chaincodeName
     * @param fcnName
     * @param input
     * @return
     */
    public String invokeChaincode(String chaincodeName, String fcnName, String input) {

        Properties props = ccProps.get(chaincodeName);
        /*
        String resource = "config/" + chaincodeName + ".properties";
        Properties props = new Properties();

        // Get properties
        try {
            logger.info("Get " + resource + " from file.");
            Path path = Paths.get(resource);
            InputStream inputStream = new FileInputStream(path.toString());
            props.load(inputStream);
            inputStream.close();
        } catch (IOException e) {
            logger.error(e.getMessage());
            e.printStackTrace();
            return makeError(e.getMessage());
        }
        */

        // Parse & Sanitize input JSON object
        String inputParams = props.getProperty(fcnName + ".params");
        String[] inputArray = inputParams.split(",");
        
        JSONObject inputJson = new JSONObject(input);
        for (String inputParam: inputArray) {
            if (!inputJson.has(inputParam)) {
                return makeError("Not enough arguments are transferred. Invalid: " + inputParam);
            }
        }

        // Deserialize channel
        /*
        Channel channel = null;
        try {
            channel = client.deSerializeChannel(defaultChannel);
        } catch (Exception e) {
            logger.error("Failed to deSerialize Channel");
            e.printStackTrace();
            return makeError(e.getMessage());
        }

        // Add Peers on channel
        for (PeerWithOptions peerWithOptions: getEndorsementPeers(client)) {
            try {
                channel.addPeer(peerWithOptions.getPeer(), peerWithOptions.getPeerOptions());
            } catch (InvalidArgumentException e) {
                logger.error("Failed to add Peer on channel");
                e.printStackTrace();
                return makeError(e.getMessage());
            }
        }
        */
        
        // Initialize channel
        if (!channel.isInitialized()) {
            logger.info("Channel is not initialized: " + channel.getName());
            try {
                logger.info("Initializing Channel: " + channel.getName());
                channel.initialize();
            } catch (InvalidArgumentException e) {
                logger.error("Failed to initialize channel.", e);
                e.printStackTrace();
                return makeError(e.getMessage());
            } catch (TransactionException e) {
                logger.error("Failed to initialize channel.", e);
                e.printStackTrace();
                return makeError(e.getMessage());
            }   
        }

        // Create Transaction Proposal Request
        String evtName = props.getProperty(fcnName + ".event");
        String method = props.getProperty(fcnName + ".method");

        // Sending Transaction Proposals
        Collection<ProposalResponse> successful = new LinkedList<>();
        Collection<ProposalResponse> proposalResponses = null;

        
        try {
            TransactionProposalRequest proposalRequest = createProposalRequest(client, chaincodeName, method, input);

            Collection<Peer> endorsingPeers = new Vector<>();
            for (String mspId: mspIdList) {
                Peer peer = getPeer(mspId);
                endorsingPeers.add(peer);
                logger.info(String.format("Peer Name: %s\n", peer.getName()));
            }
            logger.info(String.format("Sending Transaction Proposals. Chaincode: %s, Function: %s", chaincodeName, method));
            proposalResponses = channel.sendTransactionProposal(proposalRequest, endorsingPeers);
        } catch (ProposalException e) {
            logger.error("Failed to get endorsement", e);
            e.printStackTrace();
            return makeError(e.getMessage());
        } catch (InvalidArgumentException e) {
            logger.error("Failed to get endorsement", e);
            e.printStackTrace();
            return makeError(e.getMessage());
        }

        // Check all endorsements are GOOD
        boolean allGood = true;
        for (ProposalResponse response: proposalResponses) {
            if (response.isVerified() && response.getStatus() == ProposalResponse.Status.SUCCESS) {
                allGood = allGood && true;
                successful.add(response);
            } else {
                allGood = allGood && false;
                String reason = response.getMessage();
                logger.error(String.format("Proposal is failed. reason: %s", reason));
                return makeError(reason);
            }
        }

        // Register Chaincode Event Listener
        String transactionID = successful.iterator().next().getTransactionID();
        ChaincodeListener chaincodeListener = new ChaincodeListener(transactionID);
        String evtHandle = null;
        
        try {
            logger.info(String.format("Registering chaincode event listener. Chaincode name: %s, Event name: %s, TxID: %s\n", chaincodeName, evtName, transactionID));
            Pattern cidPattern = Pattern.compile("^" + chaincodeName + "$");
            Pattern evtPattern = Pattern.compile("^" + evtName + "$");
            evtHandle = channel.registerChaincodeEventListener(cidPattern, evtPattern, chaincodeListener);
        } catch (InvalidArgumentException e) {
            logger.error("Failed to register chaincode event listener.", e);
            e.printStackTrace();
            return makeError(e.getMessage());
        }

        // Send Transaction to Orderer
        TransactionEvent txEvent;
        try {
            txEvent = channel.sendTransaction(successful).get(timeout, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            logger.error("Excutor is interrupted.", e);
            e.printStackTrace();
            UnregisterEventListener(channel, evtHandle);
            return makeError(e.getMessage());
        } catch (ExecutionException e) {
            logger.error("Failed to execute.", e);
            e.printStackTrace();
            UnregisterEventListener(channel, evtHandle);
            return makeError(e.getMessage());
        } catch (TimeoutException e) {
            logger.error("Failed to execute in time period.", e);
            e.printStackTrace();
            UnregisterEventListener(channel, evtHandle);
            return makeError(e.getMessage());
        }

        // Wait for ALL events are received
        if (txEvent.isValid()) {
            try {
                waitForChaincodeEvent(timeout, channel, chaincodeListener);
                //waitForChaincodeEvent(timeout, channel, receivedEvents);
            } catch (TimeoutException e) {
                logger.error("Timed out while waiting all events are received.", e);
                e.printStackTrace();
                return makeError(e.getMessage());
            } catch (InterruptedException e) {
                logger.error("Interrupted while running..", e);
                e.printStackTrace();
                return makeError(e.getMessage());
            } finally {
                UnregisterEventListener(channel, evtHandle);
            }
        } else {
            String errMsg = String.format("Transaction is invalid. txID: %s, code: %s", txEvent.getTransactionID(), txEvent.getValidationCode());
            logger.error(errMsg);
            UnregisterEventListener(channel, evtHandle);
            return makeError(errMsg);
        }

        // Return Results from Chaincode Event
        //return chaincodeListener.getResults().get(0);
        String result = chaincodeListener.getResults().get(0);
        return makeSuccess(result);
    }

    // Unregister chaincode event listener
    private static void UnregisterEventListener(Channel channel, String eventListenerHandle) {

        try {
            channel.unregisterChaincodeEventListener(eventListenerHandle);
        } catch (InvalidArgumentException e) {
            logger.error("Specified argument is not match.", e);
            e.printStackTrace();
        }        
    }

    // Create Query request
    private static QueryByChaincodeRequest createQueryRequest(HFClient client, String chaincodeName, String method, String inputData) {
        
        logger.info(String.format("Creating Query Proposal. Chaincode: %s, Function: %s", chaincodeName, method));
        QueryByChaincodeRequest request = client.newQueryProposalRequest();
        ChaincodeID cid = ChaincodeID.newBuilder().setName(chaincodeName).build();
        request.setChaincodeID(cid);
        request.setFcn(method);
        request.setArgs(new String[]{inputData});

        return request;
    }

    // Create Proposal request
    private static TransactionProposalRequest createProposalRequest(HFClient client, String chaincodeName, String method, String inputData) {
        // Creating Transaction proposal
        logger.info(String.format("Creating Transaction Proposals. Chaincode: %s, Function: %s", chaincodeName, method));
        TransactionProposalRequest proposalRequest = client.newTransactionProposalRequest();
        ChaincodeID cid = ChaincodeID.newBuilder().setName(chaincodeName).build();
        proposalRequest.setChaincodeID(cid);
        proposalRequest.setFcn(method);
        proposalRequest.setArgs(new String[]{inputData});

        return proposalRequest;
    }

    
    // Wait until all events are received
    private static void waitForChaincodeEvent(int timeout, Channel channel, ChaincodeListener eventListener) 
        throws InterruptedException, TimeoutException {

        int noEventsExpected = channel.getPeers(EnumSet.of(Peer.PeerRole.EVENT_SOURCE)).size();

        for (int i = 0; i < timeout * 10; i++) {
            if ( eventListener.getNOfEvents() == noEventsExpected) {
                System.out.println("All events are received.");
                return;
            } else {
                try {
                    Thread.sleep(100); // Sleep 0.1 sec
                } catch (InterruptedException e) {
                    e.printStackTrace();
                    throw e;
                }
            }
        }
        throw new TimeoutException("Failed to receive tx events in " + timeout + "seconds.");
    }
    

    /*
    private static void waitForChaincodeEvent(int timeout, Channel channel, List<String> events) 
        throws InterruptedException, TimeoutException {

        int noEventsExpected = channel.getPeers(EnumSet.of(Peer.PeerRole.EVENT_SOURCE)).size();

        for (int i = 0; i < timeout * 10; i++) {
            if ( events.size() == noEventsExpected) {
                System.out.println("All events are received.");
                return;
            } else {
                try {
                    Thread.sleep(100); // Sleep 0.1 sec
                } catch (InterruptedException e) {
                    e.printStackTrace();
                    throw e;
                }
            }
        }
        throw new TimeoutException("Failed to receive tx events in " + timeout + "seconds.");
    }
    */
}