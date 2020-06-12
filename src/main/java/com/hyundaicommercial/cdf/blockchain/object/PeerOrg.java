package com.hyundaicommercial.cdf.blockchain.object;

import java.util.List;

public class PeerOrg {
    private String name;
    private String mspId;
    private String domain;
    private String tlsCAFile;
    private List<PeerConfig> peers;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMspId() {
        return mspId;
    }

    public void setMspId(String mspId) {
        this.mspId = mspId;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getTlsCAFile() {
        return tlsCAFile;
    }

    public void setTlsCAFile(String tlsCAFile) {
        this.tlsCAFile = tlsCAFile;
    }

    public List<PeerConfig> getPeers() {
        return peers;
    }

    public void setPeers(List<PeerConfig> peers) {
        this.peers = peers;
    }
}