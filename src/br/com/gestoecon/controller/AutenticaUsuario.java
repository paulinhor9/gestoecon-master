package br.com.gestoecon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gestoecon.bean.UsuarioVO;
import br.com.gestoecon.dao.UsuarioDAO;

/**
 * Servlet implementation class AutenticaUsuario
 */
@WebServlet("/AutenticaUsuario")
public class AutenticaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutenticaUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/**
		 * FINALIZAR SESSÃO.
		 */
		
		String acao = request.getParameter("acao");
		if(acao.equals("sair")){
			request.getSession().removeAttribute("usuarioOK");
			request.getSession().invalidate();
			
			response.sendRedirect("login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");

		/** AUTENTICAR USUARIO. */

		if (acao.equals("autenticarUsuario")) {

			// RECUPERANDO OS PARAMETROS
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");

			// VALIDAR LOGIN E SENHA

			UsuarioVO objUsuario = UsuarioDAO.consultarUsuario(email);
			RequestDispatcher direcionador;
			if (objUsuario != null) {
				if (objUsuario.getSenha().trim().equals(senha.trim())) {
					request.getSession().setAttribute("usuarioOK", objUsuario);
					response.sendRedirect("Home.jsp");
				} else
					// request.getRequestDispatcher("falhaLogin.jsp").forward(request,
					// response);
					response.sendRedirect("login.jsp");

			} else {
				response.sendRedirect("login.jsp");
			}
		}

	}

}
