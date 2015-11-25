package br.com.gestoecon.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gestoecon.bean.ContaVO;
import br.com.gestoecon.bean.UsuarioVO;
import br.com.gestoecon.dao.ContaDAO;

/**
 * Servlet implementation class ManterConta
 */
@WebServlet("/ManterConta")
public class ManterConta extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManterConta() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");
		
		UsuarioVO usuarioLogado =(UsuarioVO) request.getSession().getAttribute("usuarioOK");

		/** INSERIR CONTA */

		if (acao.equals("inserirConta")) {
			String nome = request.getParameter("nome");
			String idUsuario = request.getParameter("id_usuario");
			double saldo = Double.parseDouble(request.getParameter("saldo"));

			// CRIANDO O OBJETO CONTA
			ContaVO objConta = new ContaVO();

			objConta.setNome(nome);
			objConta.setSaldo(saldo);
			objConta.setIdUsuario(idUsuario);

			// INSERINDO AS INFORMAÇÕES DA CONTA
			ContaDAO.inserirConta(objConta);
			response.sendRedirect("contas/contaInserirSucesso.jsp");

		}

		/** EXCLUIR CONTA */

		else if (acao.equals("excluirConta")) {

			int id = Integer.parseInt(request.getParameter("id"));
			String idUsuario = request.getParameter("id_usuario");
			
			ContaVO objConta = new ContaVO();
			objConta.setId(id);
			objConta.setIdUsuario(idUsuario);

			ContaDAO contaDAO = new ContaDAO();
			contaDAO.excluirConta(objConta);
			response.sendRedirect("contas/contaExcluirSucesso.jsp");
			
		/** ATUALIZAR CONTA */	

		} else if (acao.equals("alterarConta")) {
			int id = Integer.parseInt(request.getParameter("id"));
			String nome = request.getParameter("nome");
			Double saldo = Double.parseDouble(request.getParameter("saldo"));

			ContaDAO contaDAO = new ContaDAO();

			ContaVO conta = contaDAO.consultarConta(id);

			conta.setNome(nome);
			conta.setSaldo(saldo);

			contaDAO.alterarConta(conta);

			// request.getRequestDispatcher("ManterConta?acao=listarConta").forward(request,
			// response);
			response.sendRedirect("ManterConta?acao=listarConta");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");
		
		UsuarioVO usuarioLogado =(UsuarioVO) request.getSession().getAttribute("usuarioOK");

	/** LISTAR CONTAS */	
		
		if (acao.equals("listarConta")) {

			// BUscando a lista do banco
			List<ContaVO> lista = ContaDAO.listarContaPorUsuario(usuarioLogado.getEmail());

			// Colocando a lista como atributo para o jsp acesssa como parametro
			request.setAttribute("listaConta", lista);

			// Encaminhando para o jsp
			request.getRequestDispatcher("contas/contaListar.jsp").forward(request, response);
		
	/** EDITAR CONTAS */		
			
		} else if (acao.equals("editarConta")) {
			int id = Integer.parseInt(request.getParameter("id"));
			ContaDAO contaDAO = new ContaDAO();

			ContaVO conta = contaDAO.consultarConta(id);

			request.setAttribute("conta", conta);

			request.getRequestDispatcher("contas/contaEditar.jsp").forward(request, response);

		}

	}
}
