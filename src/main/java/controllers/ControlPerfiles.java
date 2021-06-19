package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import helpers.DB;


public class ControlPerfiles {
	private static DB conectar = DB.getInstances();
	
	public ControlPerfiles() {
		
	}

	public static String perfil(HttpServletRequest request, HttpServletResponse response, String username) {
		DB database = DB.getInstances();
		
		if(database.existe(username)) {
			String[] data = database.getData(username);
			return ("{\"message\":\"Perfil Encontrado\"," + "\"username\":\"" + data[0]+"\", \"status\":"+200+"}");
			
		}else {
			return ("{\"message\": \"Perfil no encontrado\", \"status\":"+200+"}");
		}
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
