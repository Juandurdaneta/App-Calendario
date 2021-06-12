package helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controllers.User;


//CLASE QUE PROVEE OPERACIONES CRUD CON LA BASE DE DATOS
public class UserCRUD {
	private String jdbcURL = "jdbc:mysql://localhost:3306/calendarapp";
	private String jdbcUsername = "root";
	private String jdbcPassword = "password";
	
	private static final String INSERTAR_USUARIOS_SQL = "INSERT INTO users" + "(username, pass) VALUES"+ "(?, ?);";
	private static final String EDITAR_USUARIO_SQL = "UPDATE users SET username = ? WHERE user_id = ?;";
	private static final String ELIMINAR_USUARIO_SQL ="DELETE FROM users WHERE username = ?;";
	private static final String SELECCIONAR_USUARIO_SQL = "SELECT user_id, username FROM users WHERE username = ?;"; 
	
	

	protected Connection getConnection(){
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}catch(SQLException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	
	//Crear Usuario 
	public void crearUsuario(User user) {
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(INSERTAR_USUARIOS_SQL);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	//Editar Usuario
	public boolean editarUsuario(User user) throws SQLException {
		boolean editado;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(EDITAR_USUARIO_SQL);) {
			statement.setString(1, user.getUsername());
			statement.setInt(2, user.getId());
			
			editado = statement.executeUpdate() > 0;
		}
		return editado;
	}
	
	//Seleccionar Usuario
	public User SeleccionarUsuario (int id) {
		User user = null;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(SELECCIONAR_USUARIO_SQL);){
				statement.setInt(1, id);
				System.out.println(statement);
				ResultSet rs = statement.executeQuery();
				
				while(rs.next()) {
					String username = rs.getString("username");
					String password = rs.getString("pass");
					user = new User(username, password);
				}
				
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	//Eliminar Usuario
	public boolean eliminarUsuario(String username) throws SQLException{
		boolean eliminado;
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(ELIMINAR_USUARIO_SQL)){
			
			statement.setString(1,username);
			eliminado = statement.executeUpdate() > 0;
			
		}
		return eliminado;
	}

	
	
}