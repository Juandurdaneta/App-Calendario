package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.ControlPerfiles;

/**
 * Servlet implementation class EliminarUsuario
 */
@WebServlet("/Eliminar")
public class EliminarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EliminarUsuario() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String usuarioAEliminar = request.getParameter("nombreUserAEliminar");
		String username = (String) request.getSession().getAttribute("username");
		PrintWriter s=response.getWriter(); 
		if(usuarioAEliminar.equals(username) && ControlPerfiles.Eliminar(usuarioAEliminar)) {
			RequestDispatcher rd = request.getRequestDispatcher("/public/views/usuarioEliminado.html");
			rd.include(request, response);
		}
		else {
			s.print("<script>window.alert('El nombre ingresado no coincide con el nombre de Usuario.')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/public/views/perfil.html");
			rd.include(request, response);

		}
	}

}
