package controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import helpers.DB;
import helpers.Hashing;


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
	
	public static boolean cambiarContraseña(HttpServletRequest request) {
		try {
			String clave_hash = Hashing.encriptar(request.getParameter("myPassword"));
			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("username");
			ArrayList<String> datos = conectar.dbStatement("SELECT * FROM users WHERE username = '"+username+"' and pass = '"+clave_hash+"';");
			
			
			if(datos.get(1).equals(clave_hash)) {
				Object[] obj = {Hashing.encriptar(request.getParameter("nuevaContraseña")), username};
				conectar.dbPrepareStatement("UPDATE users SET pass = ? WHERE username = ?", obj);
				return true;
			} else {
				return false;
			}
			
		}catch(Exception e) {
			return false;
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
