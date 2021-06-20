package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.ControlPerfiles;

/**
 * Servlet implementation class ActualizarUsuario
 */
@WebServlet("/ActualizarUsuario")
public class ActualizarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarUsuario() {
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
		HttpSession session = request.getSession();
		PrintWriter s=response.getWriter();
		String nuevaContraseña = request.getParameter("nuevaContraseña");
		String confirmarNuevaContraseña = request.getParameter("confirmarNuevaContraseña");
		
		if( nuevaContraseña.equals(confirmarNuevaContraseña) && ControlPerfiles.cambiarContraseña(request)) {
			s.print("<script>window.alert('Cambios guardados exitosamente!.')</script>");
			response.sendRedirect("calendario");
		} else {
			s.print("<script>window.alert('Las claves no coinciden, intentalo de nuevo.')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/public/views/perfil.html");
			rd.include(request, response);
		}
		
	}

}
