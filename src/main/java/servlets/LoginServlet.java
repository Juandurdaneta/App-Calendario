package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.LoginUser;
import helpers.ValidarDatosUsuario;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ValidarDatosUsuario validarDatos;
	
	public void init() {
		validarDatos = new ValidarDatosUsuario();
		}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		
		LoginUser userLogin = new LoginUser();
		userLogin.setUsername(username);
		userLogin.setPassword(pass);
		
	
		
		 try {
			if(validarDatos.validar(userLogin)) {
				request.getSession().setAttribute("username", username);
				RequestDispatcher rd = request.getRequestDispatcher("/public/views/calendario.html");
				rd.include(request, response);
				
			}else {
				request.setAttribute("invalido","<i class=\"fas fa-exclamation-triangle\"></i> Usuario o contraseña invalidos");
				HttpSession session = request.getSession();
				response.sendRedirect("/");
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
