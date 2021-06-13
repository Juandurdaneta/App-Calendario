package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.ControlRegistro;
import helpers.Hashing;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		RequestDispatcher rd = request.getRequestDispatcher("/public/views/register.html");
		rd.include(request, response);
		String mensajeExito = "Registro exitoso";
		request.setAttribute("exito", mensajeExito);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		response.setContentType("text/html");
		PrintWriter s=response.getWriter();
		
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		String pass2 = request.getParameter("pass2");
		
		if(pass.equals(pass2) && ControlRegistro.Registro(username, pass)) {
			s.print("<script>window.alert('Te haz registrado exitosamente!')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/public/views/register.html");
			rd.include(request, response);
			
		}
			
		else {
			s.print("<script>window.alert('Hubo un error al tratar de registrar el usuario, intentelo de nuevo')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/public/views/register.html");
			rd.include(request, response);
		}	
	}

}
