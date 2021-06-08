package webapp.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import webapp.dao.userDAO;
import webapp.model.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private userDAO userDao;
       
	public void init() {
		userDao = new userDAO();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("pass");
		String passwordConfirm = request.getParameter("pass2");
	
		
		try {
			if(password.equals(passwordConfirm)) {
				User newUser = new User(username, password);
				userDao.crearUsuario(newUser);
				request.setAttribute("success", "<p class='bg-success text-white'><i class=\"far fa-thumbs-up\"></i> Usuario creado exitosamente!</p>");
				request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
			} else {
				request.setAttribute("success", "<p class='bg-warning text-white'><i class='fas fa-exclamation-triangle'></i> Error al crear el usuario, intentalo de nuevo</p>");
				request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
