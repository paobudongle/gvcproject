package com.common;

import java.nio.ByteBuffer;

public class JwtUtil {


	private String secret;
	private String aesKey;
	private int issueId;
	private JWT jwt;
//    private String jwtStr;


	public JwtUtil(String secret, String aesKey, int issueId) {
		this.secret = secret;
		this.aesKey = aesKey;
		this.issueId = issueId;
		this.jwt = new JWT(secret, aesKey, 10000, issueId);
	}

	public String verify(String jwtStr) {
		ByteBuffer out = ByteBuffer.allocate(2048);

		long now = System.currentTimeMillis();


		String s = jwt.verifyAndDecrypt(jwtStr, now);
		System.out.println(s);
		return s;
	}

	public String createJwt(String resource) {
		String encode = encode(resource);
		return encode;
	}

	public String encode(String resource) {
//        data.
		ByteBuffer buffer = ByteBuffer.wrap(resource.getBytes());
		ByteBuffer out = ByteBuffer.allocate(2048);
		byte sys = 2;
		ByteBuffer bufferResult = jwt.encryptAndSign(sys, buffer, out, System.currentTimeMillis() + 100000);
		String result = BufferToString.getString(bufferResult);

		return result;
	}

}
