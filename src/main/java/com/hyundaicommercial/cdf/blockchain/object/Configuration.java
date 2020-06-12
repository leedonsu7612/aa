package com.hyundaicommercial.cdf.blockchain.object;

import java.util.List;
import java.util.Map;

public class Configuration {
    private int retry;
    private int timeout;
    private Map<String,String> user;
    private Map<String,String> channel;
    private List<PeerOrg> members;
    private List<OrdererOrg> ordererorg;

    public int getRetry() {
        return retry;
    }

    public void setRetry(int retry) {
        this.retry = retry;
    }

    public int getTimeout() {
        return timeout;
    }

    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }

    public Map<String,String> getUser() {
        return user;
    }

    public void setUser(Map<String,String> user) {
        this.user = user;
    }

    public Map<String,String> getChannel() {
        return channel;
    }

    public void setChannel(Map<String,String> channel) {
        this.channel = channel;
    }

    public List<PeerOrg> getMembers() {
        return members;
    }

    public void setMembers(List<PeerOrg> members) {
        this.members = members;
    }

    public List<OrdererOrg> getOrdererorg() {
        return ordererorg;
    }

    public void setOrdererorg(List<OrdererOrg> orderers) {
        this.ordererorg = orderers;
    }
}