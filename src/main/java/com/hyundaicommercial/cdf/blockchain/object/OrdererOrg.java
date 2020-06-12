package com.hyundaicommercial.cdf.blockchain.object;

import java.util.List;

public class OrdererOrg {
    private String name;
    private String mspId;
    private String domain;
    private String tlsCAFile;
    private List<PeerConfig> orderers;

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

    public List<PeerConfig> getOrderers() {
        return orderers;
    }

    public void setOrderers(List<PeerConfig> orderers) {
        this.orderers = orderers;
    }
}
