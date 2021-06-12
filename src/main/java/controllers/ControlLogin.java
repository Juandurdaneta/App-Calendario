package controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import helpers.DB;
import helpers.Hashing;

public class ControlLogin {
	private static DB conectar = DB.getInstances();
	
	public ControlLogin() {
		
	}
	
	public static boolean login(HttpServletRequest request) {
		try {
			String clave_hash = Hashing.encriptar(request.getParameter("pass"));
			ArrayList<String> datos = conectar.dbStatement("SELECT * FROM users WHERE username = '"+request.getParameter("username")+"' and pass = '"+clave_hash+"';");
			if(datos.get(0).equals(request.getParameter("username"))) {
				HttpSession session = request.getSession();
				session.setAttribute("username", request.getParameter("username"));
				return true;
			}else {
				return false;
			}
		} catch(Exception e) {
			return false;
		}
	}

}
