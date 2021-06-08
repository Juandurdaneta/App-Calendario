package webapp.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import webapp.dao.LoginDAO;
import webapp.dao.userDAO;
import webapp.model.User;
import webapp.model.UserLogin;


@WebServlet(urlPatterns = "/")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDAO loginDao;
	
	public void init(){
	loginDao = new LoginDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		
		UserLogin userLogin = new UserLogin();
		userLogin.setUsername(username);
		userLogin.setPassword(pass);
		
		try {
			if(loginDao.validar(userLogin)) {
				request.getSession().setAttribute("username", username);
				response.sendRedirect("/calendario");
			}else {
				request.setAttribute("invalido","<i class=\"fas fa-exclamation-triangle\"></i> Usuario o contraseña invalidos");
				HttpSession session = request.getSession();
				request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}


}
