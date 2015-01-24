import java.security.MessageDigest;
import java.security.SecureRandom;
import java.math.BigInteger;

public class PasswordManager {
	public String encrypt(String password){
		String encrypted;
	try{
	MessageDigest sha = MessageDigest.getInstance("SHA-1");
	byte[] pswd=password.getBytes("UTF-8");
	sha.update(pswd);
	byte[] crypt=sha.digest();
	encrypted=new sun.misc.BASE64Encoder().encode(crypt);
	return encrypted;
	}catch(Exception e){
		e.printStackTrace();
		}
	return null;	
}
	public String generate(){
		SecureRandom random = new SecureRandom();
	    return new BigInteger(60, random).toString(32);
	}
}
