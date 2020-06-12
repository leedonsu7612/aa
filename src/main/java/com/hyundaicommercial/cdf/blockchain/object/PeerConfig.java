package com.hyundaicommercial.cdf.blockchain.object;

public class PeerConfig {
    private String name;
    private String ip;
    private boolean tlsEnabled;
    private String tlsCAFile;
    private int port;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public boolean getTlsEnabled() {
        return tlsEnabled;
    }

    public void setTlsEnabled(boolean tlsEnabled) {
        this.tlsEnabled = tlsEnabled;
    }

    public void addDomain(String domain) {
        this.name = this.name + "." + domain;
    }

    public void setTlsCAFile(String tlsCAFile) {
        this.tlsCAFile = tlsCAFile;
    }

    public String getTlsCAFile() {
        return tlsCAFile;
    }

    public boolean isTLSEnabled() {
        return tlsEnabled;
    }
}