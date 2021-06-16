package controllers;

import helpers.DB;
import helpers.Hashing;

public class ControlRegistro {
	private static DB conectar = DB.getInstances();
	
	public ControlRegistro() {
		
	}
	
	static public boolean Registro(String username, String pass) {
		Object[] obj = {username, Hashing.encriptar(pass)};
		System.out.println("Agregando a la base de datos..");
		
		try {
			conectar.dbPrepareStatement("INSERT INTO users" + "(username, pass) VALUES"+ "(?, ?);", obj);
			return true;
		}catch(Exception e) {
			return false;
		}
	}
	
}
