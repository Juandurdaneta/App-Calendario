package helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

public class DB {
	private static DB db = new DB();
	private Connection conn;
	private PreparedStatement pstmt;
	private Properties properties = new Properties();
	private Statement stmt;
	private ResultSet rs;
	
	public DB() {
		try {
			properties.load(this.getClass().getResourceAsStream("/propiedades/propiedades.properties"));
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql://ec2-54-224-194-214.compute-1.amazonaws.com:5432" + "/" + "d3tjdf5bf90vaa","rfobzujdtmevyk", "fb950993af16ce0d371f5b83a7b1369cd8a61d8179bddde7fefca62c7bbd27ad");
		} catch(Exception ex) {
			System.out.println(ex);
		}
	}
	
	public static DB getInstances() {
		return db;
	}
	
	//Comprobando si el usuario ingresado existe
	public boolean existe(String usuario) {
		try {
			this.stmt = this.conn.createStatement();
			this.rs = this.stmt.executeQuery("SELECT username FROM users");
			while(rs.next()) {
				String key = rs.getString("username");
				if(key.contentEquals(usuario)) {
					return true;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	//Obteniendo datos del usuario
	
	public String[] getData(String username) {
		try {
			this.stmt = this.conn.createStatement();
			this.rs = this.stmt.executeQuery("SELECT * FROM users");
			while(rs.next()) {
				if(username.contentEquals(rs.getString("username"))) {
					String[] data = {
							rs.getString("username")
					};
					return data;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public void dbPrepareStatement(String query, Object... obj) {
		try {
			this.pstmt = this.conn.prepareStatement(query);
			int i = 0;
			for(Object objeto:obj) {
				
				if(objeto instanceof java.lang.String)
						this.pstmt.setString(++i, (String) objeto);
				else
					this.pstmt.setInt(++i, (int) objeto);
			}
			this.pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				this.pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<String> dbStatement(String query){
		
		try {
			this.stmt = this.conn.createStatement();
			this.rs = this.stmt.executeQuery(query);
			ArrayList<String> datos_usuario = new ArrayList<String>();
			while(rs.next()) {
				for(int i =0; i<rs.getMetaData().getColumnCount(); i++)
					datos_usuario.add(rs.getString(++i));
			}
			if(datos_usuario.get(0) != null)
				return datos_usuario;
			else
				return null;
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				this.stmt.close();
				this.rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return null;
	}
	
}
