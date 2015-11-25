package br.com.gestoecon.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.gestoecon.bean.ContaVO;
import br.com.gestoecon.bean.MovimentoVO;
import br.com.gestoecon.bean.UsuarioVO;
import br.com.gestoecon.dao.ContaDAO;
import br.com.gestoecon.dao.MovimentoDAO;

/**
 * Servlet implementation class ManterMovimento
 */
@WebServlet("/ManterMovimento")
public class ManterMovimento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public ManterMovimento() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");
		
		UsuarioVO usuarioLogado =(UsuarioVO) request.getSession().getAttribute("usuarioOK");

		/** INSERIR MOVIMENTO */

		if (acao.equals("inserirMovimento")) {
			String idUsuario = request.getParameter("id_usuario");
			String nome = request.getParameter("nome");
			double valor = Double.parseDouble(request.getParameter("valor"));
			boolean tipo = Boolean.parseBoolean(request.getParameter("tipo"));
			Integer idConta = Integer.parseInt(request.getParameter("conta"));
			String data = request.getParameter("data"); 
			Date dataFormatada = null;
			try {
				//insere no formato americano yyy-MM-dd, e quando retornar na pagina, formata no fmt brasileito dd/MM/yyy
				dataFormatada = new SimpleDateFormat("yyyy-MM-dd").parse(data);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// CRIANDO O OBJETO MOVIMENTO
			MovimentoVO objMovimento = new MovimentoVO();

			objMovimento.setNome(nome);
			objMovimento.setValor(valor);
			objMovimento.setData(dataFormatada);
			objMovimento.setTipo(tipo);
			objMovimento.setIdConta(idConta);
			objMovimento.setIdUsuario(idUsuario);
			
			
			ContaDAO contaDAO = new ContaDAO();
			
			ContaVO conta = contaDAO.consultarConta(idConta);
			if(objMovimento.isTipo()){
				//vai depositar na conta
				conta.setSaldo(conta.getSaldo() + objMovimento.getValor());
				contaDAO.alterarConta(conta);
				
			}
			else{
				//vai sacar da conta.
				conta.setSaldo(conta.getSaldo() - objMovimento.getValor());
				contaDAO.alterarConta(conta);
			}

			// INSERINDO AS INFORMAÇÕES DO MOVIMENTO
			MovimentoDAO.inserirMovimento(objMovimento);
			response.sendRedirect("movimentos/movimentoInserirSucesso.jsp");

		}

	
		/** EXCLUIR MOVIMENTO */

		else if (acao.equals("excluirMovimento")) {

			int id_movimento = Integer.parseInt(request.getParameter("Id_movimento"));
			String idUsuario = request.getParameter("id_usuario");
			
			MovimentoVO objMovimento = new MovimentoVO();
			objMovimento.setId_movimento(id_movimento);
			objMovimento.setIdUsuario(idUsuario);

			MovimentoDAO movimentoDAO = new MovimentoDAO();
			movimentoDAO.excluirMovimento(objMovimento);
			response.sendRedirect("movimentos/movimentoExcluirSucesso.jsp");
			
		/** ATUALIZAR MOVIMENTO */	

		} else if (acao.equals("alterarMovimento")) {
			
			int id_movimento = Integer.parseInt(request.getParameter("Id_movimento"));
			String nome = request.getParameter("nome");
			Double valor = Double.parseDouble(request.getParameter("valor"));

			MovimentoDAO movimentoDAO = new MovimentoDAO();

			MovimentoVO movimento = MovimentoDAO.consultarMovimento(id_movimento);

			movimento.setNome(nome);
			movimento.setValor(valor);

			movimentoDAO.alterarMovimento(movimento);

			response.sendRedirect("extrato/extrato.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

	/** LISTAR MOVIMENTO */	
		
		if (acao.equals("listarMovimento")) {

			// BUscando a lista do banco
			List<MovimentoVO> lista = MovimentoDAO.listarMovimento();

			// Colocando a lista como atributo para o jsp acesssa como parametro
			request.setAttribute("listaMovimento", lista);

			// Encaminhando para o jsp
			request.getRequestDispatcher("movimentos/movimentoListar.jsp").forward(request, response);
		
	/** EDITAR MOVIMENTO */		
			
		} else if (acao.equals("editarMovimento")) {
			int id_movimento = Integer.parseInt(request.getParameter("Id_movimento"));
			MovimentoDAO movimentoDAO = new MovimentoDAO();

			MovimentoVO movimento = movimentoDAO.consultarMovimento(id_movimento);

			request.setAttribute("movimento", movimento);

			request.getRequestDispatcher("movimentos/movimentoEditar.jsp").forward(request, response);

		}

	}
}
