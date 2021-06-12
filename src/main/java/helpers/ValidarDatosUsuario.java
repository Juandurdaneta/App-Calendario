package helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controllers.LoginUser;
import controllers.User;

public class ValidarDatosUsuario {

	/** Validar inicio de sesion con la base de datos */
	
	public boolean validar(LoginUser user) throws ClassNotFoundException{
		boolean status = false;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/calendarapp", "root", "password");
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE username = ? and pass = ?;")){
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
		}catch(SQLException e) {
			printSQLException(e);
		}
		return status;
	}

	private void printSQLException(SQLException ex) {
		 for (Throwable e: ex) {
	            if (e instanceof SQLException) {
	                e.printStackTrace(System.err);
	                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	                System.err.println("Message: " + e.getMessage());
	                Throwable t = ex.getCause();
	                while (t != null) {
	                    System.out.println("Cause: " + t);
	                    t = t.getCause();
	                }
	            }
	        }
	    }
	
	
}
