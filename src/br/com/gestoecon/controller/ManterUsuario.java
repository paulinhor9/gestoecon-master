package br.com.gestoecon.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.gestoecon.bean.UsuarioVO;
import br.com.gestoecon.dao.UsuarioDAO;

/**
 * Servlet implementation class ManterUsuario
 */
@WebServlet("/ManterUsuario")
public class ManterUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManterUsuario() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");
		UsuarioVO usuarioLogado =(UsuarioVO) request.getSession().getAttribute("usuarioOK");

		/** INSERIR USUARIO */

		if (acao.equals("inserirUsuario")) {
			String email = request.getParameter("email");
			String nome = request.getParameter("nome");
			String senha = request.getParameter("senha");

			// CRIANDO O OBJETO USUARIO
			UsuarioVO objUsuario = new UsuarioVO(email, nome, senha);

			// INSERINDO AS INFORMAÇÕES DO USUARIO
			UsuarioDAO.inserirUsuario(objUsuario);
			response.sendRedirect("usuario/usuarioInserirSucesso.jsp");

		}

		/** EXCLUIR USUARIO */

		else if (acao.equals("excluirUsuario")) {

			String email = request.getParameter("email");
			UsuarioVO objUsuario = new UsuarioVO();
			objUsuario.setEmail(email);

			UsuarioDAO usuarioDAO = new UsuarioDAO();
			usuarioDAO.excluirUsuario(objUsuario);
			response.sendRedirect("usuario/usuarioExcluirSucesso.jsp");

		/** ATUALIZAR USUARIO */

		} else if (acao.equals("alterarUsuario")) {
			String email = request.getParameter("email");
			String nome = request.getParameter("nome");
			String senha = request.getParameter("senha");
			String senha2 = request.getParameter("senha2");

			if (senha.equals(senha2)) {

				UsuarioVO objUsuario = UsuarioDAO.consultarUsuario(email);

				objUsuario.setEmail(email);
				objUsuario.setNome(nome);
				objUsuario.setSenha(senha);
				
				UsuarioDAO.alterarUsuario(objUsuario);

			}

			
			// request.getRequestDispatcher("ManterConta?acao=listarUsuario").forward(request,
			// response);
			response.sendRedirect("ManterUsuario?acao=listarUsuario");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");
		
		UsuarioVO usuarioLogado =(UsuarioVO) request.getSession().getAttribute("usuarioOK");

		/** LISTA USUARIO */

		if (acao.equals("listarUsuario")) {

			// BUscando a lista do banco
			UsuarioVO usuarioVO = UsuarioDAO.consultarUsuario(usuarioLogado.getEmail());

			// Colocando a lista como atributo para o jsp acesssa como parametro
			request.setAttribute("usuarioVO", usuarioVO);

			// Encaminhando para o jsp
			request.getRequestDispatcher("usuario/usuarioListar.jsp").forward(request, response);

			/** EDITAR USUARIO */

		} else if (acao.equals("editarUsuario")) {
			String email = request.getParameter("email");
			UsuarioDAO usuarioDAO = new UsuarioDAO();

			UsuarioVO objUsuario = usuarioDAO.consultarUsuario(email);

			request.setAttribute("usuarioOk", objUsuario);
			request.getRequestDispatcher("usuario/usuarioEditar.jsp").forward(request, response);

		}
		/**
		 * FINALIZAR SESSÃO.
		 

		else if (acao.equals("sair")) {
			HttpSession session = request.getSession();
			if (usuarioLogado != null) {
				session.removeAttribute("usuarioOk");
				session.invalidate();

				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
		}
*/
	}

}
