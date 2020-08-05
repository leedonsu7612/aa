package com.hyundai;

import com.hyundai.CryptoUtil;

public class CryptoTest {

	public static void main(String[] args) throws Exception {
		String plainText = "Hello, World!";
		String key = "secret key";
		
		System.out.println("MD5 : " + plainText + " - " + CryptoUtil.md5(plainText));
		System.out.println("SHA-256 : " + plainText + " - " + CryptoUtil.sha256(plainText));
		
		String encrypted = CryptoUtil.encryptAES256("Hello, World!", key);
		System.out.println("AES-256 : enc - " + encrypted);
		System.out.println("AES-256 : dec - " + CryptoUtil.decryptAES256(encrypted, key));
	}

}
