package com.hyundaicommercial.cdf.blockchain.object;

import java.io.Serializable;
import java.util.Set;

import org.hyperledger.fabric.sdk.Enrollment;
import org.hyperledger.fabric.sdk.User;

/**
 * Implement Fabric User
 */

public class UserContext implements User, Serializable {

    private static final long serialVersionUID = 123456789L;

    private String name;
    private Set<String> roles;
    private String account;
    private String affiliation;
    private String mspId;
    private Enrollment enrollment;

    public UserContext(String name, String mspId) {
        this.name = name;
        this.mspId = mspId;
    }

    /**
     * @param roles the roles to set
     */
    public void setRoles(Set<String> roles) {
        this.roles = roles;
    }

    /**
     * @param account the account to set
     */
    public void setAccount(String account) {
        this.account = account;
    }

    /**
     * @param affiliation the affiliation to set
     */
    public void setAffiliation(String affiliation) {
        this.affiliation = affiliation;
    }

    /**
     * @param enrollment the enrollment to set
     */
    public void setEnrollment(Enrollment enrollment) {
        this.enrollment = enrollment;
    }

    @Override
	public String getName() {
		return name;
	}

	@Override
	public Set<String> getRoles() {
		return roles;
	}

	@Override
	public String getAccount() {
		return account;
	}

	@Override
	public String getAffiliation() {
		return affiliation;
	}

	@Override
	public String getMspId() {
		return mspId;
	}

	@Override
    public Enrollment getEnrollment() {
		return enrollment;
	}
}