package com.hyundaicommercial.cdf.blockchain.object;

import java.util.Vector;
//import java.util.logging.Logger;

import org.apache.log4j.Logger;
import org.hyperledger.fabric.sdk.BlockEvent;
import org.hyperledger.fabric.sdk.ChaincodeEvent;
import org.hyperledger.fabric.sdk.ChaincodeEventListener;

import static java.lang.String.format;

public class ChaincodeListener implements ChaincodeEventListener {

    private Vector<String> results;
    private String txId;
    //private static Logger logger = Logger.getGlobal();
    final static Logger logger = Logger.getLogger(ChaincodeListener.class);

    public ChaincodeListener(String txId) {
        this.results = new Vector<>();
        this.txId = txId;
    }

    @Override
    public void received(String handle, BlockEvent blockEvent, ChaincodeEvent chaincodeEvent) {
        String es = blockEvent.getPeer().getName();
        String result = new String(chaincodeEvent.getPayload());
        
        /*
        System.out.println(format("Received chaincode event with handle: %s, chaincode Id: %s, chaincode event name: %s,"
            + " transaction id: %s, event payload: \"%s\", from eventhub: %s",
            handle, chaincodeEvent.getChaincodeId(),
            chaincodeEvent.getEventName(),
            chaincodeEvent.getTxId(),
            result, es));
        */  

        logger.info(format("Get Chaincode Event From %s: Tx ID: %s\n", es, chaincodeEvent.getTxId()));

        if (txId.equals(chaincodeEvent.getTxId())) {
            this.results.add(result);
        }
    }

    public int getNOfEvents() {
        return results.size();
    }

    public Vector<String> getResults() {
        return results;
    }

    public String getTxId() {
        return txId;
    }
}