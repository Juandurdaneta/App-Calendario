package controllers;

import helpers.DB;


public class ControlPerfiles {
	private static DB conectar = DB.getInstances();
	
	public ControlPerfiles() {
		
	}
	
	static public boolean Eliminar(String username) {
		Object[] obj = {username};
		
		try {
			conectar.dbPrepareStatement("DELETE FROM users WHERE username = ?;", obj);
			return true;
		}catch(Exception e) {
			return false;
		}
	}
	
	
}
