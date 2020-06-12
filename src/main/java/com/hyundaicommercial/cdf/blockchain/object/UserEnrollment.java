package com.hyundaicommercial.cdf.blockchain.object;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;

import javax.xml.bind.DatatypeConverter;

import org.hyperledger.fabric.sdk.Enrollment;

public class UserEnrollment implements Enrollment, Serializable {

    private static final long serialVersionUID = 987654321L;

    private PrivateKey key;
    private String cert;

    public UserEnrollment(String key, String cert) {
        // Set Private key for Enrollment
        try {
            this.key = loadPrivateKey(Paths.get(key));
        } catch (Exception e) {
            e.printStackTrace();
            this.key = null;
        }

        try {
            this.cert = new String(Files.readAllBytes(Paths.get(cert)));
        } catch (Exception e) {
            e.printStackTrace();
            this.cert = null;
        }
    }

    @Override
    public PrivateKey getKey() {
        return key;
    }

    @Override
    public String getCert() {
        return cert;
    }

    /***
     * Loading private key file and Transform into PrivateKey
     * @param Path file 
     */
    private static PrivateKey loadPrivateKey(Path file) throws IOException, GeneralSecurityException {
        PrivateKey pkey = null;
        InputStream is = null;

        try {
            is = new FileInputStream(file.toString());
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            StringBuilder builder = new StringBuilder();

            for (String line = br.readLine(); line != null; line = br.readLine()) {
                if (line.startsWith("-----BEGIN")) {
                    continue;
                } else if (line.startsWith("-----END")) {
                    break;
                } else {
                    builder.append(line);
                }
            }
            br.close();

            byte[] encodedKey = DatatypeConverter.parseBase64Binary(builder.toString());
            PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(encodedKey);
            KeyFactory kf = KeyFactory.getInstance("EC");
            pkey = kf.generatePrivate(keySpec);
        } finally {
            is.close();
        }
        return pkey;
    }
}