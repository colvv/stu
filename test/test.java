import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import sun.misc.BASE64Encoder;

public class test {
	public static String desc(String info) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		BASE64Encoder base64en = new BASE64Encoder();
		// 加密后的字符串
		String newstr = base64en.encode(md5.digest(info.getBytes("utf-8")));
		return newstr;

	}

	public static String byte2hex(byte[] bytes) {
		StringBuilder hs = new StringBuilder();
		for (byte b : bytes)
			hs.append(String.format("%1$02X", b));
		return hs.toString();
	}

	public static String MD5Encode(String strSrc, String key) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(strSrc.getBytes("UTF8"));
			StringBuffer result = new StringBuffer(32);
			byte[] temp;
			temp = md5.digest(key.getBytes("UTF8"));
			for (int i = 0; i < temp.length; i++) {
				result.append(Integer.toHexString((0x000000ff & temp[i]) | 0xffffff00).substring(6));
			}
			return result.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		System.out.println("我去");
		System.out.println(desc("我去kjhkdesc"));
		System.out.println(MD5Encode("我去kjhkdesc", "col_vv"));
		System.out.println(MD5Encode("我去kjhkdesc", "col_vv").length());
		System.out.println(MD5Encode("我去kjhkdesc", ""));
		System.out.println(MD5Encode("我去kjhkdesc", "").length());
	}
}
