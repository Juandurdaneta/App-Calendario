package helpers;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hashing {

	public Hashing() {
		
	}
	
	static public String encriptar(String password) {
		try {
			MessageDigest encriptador = MessageDigest.getInstance("SHA-512");
			
			encriptador.update((password).getBytes());
			
			byte cadena[] = encriptador.digest();
			
			BigInteger valor = new BigInteger(1, cadena);
			
			String nuevaClave = valor.toString(16);
			return nuevaClave;
			
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}
}
