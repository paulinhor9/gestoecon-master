<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.gestoecon.bean.MovimentoVO"%>
<%@page import="java.util.List"%>
<%@page import="br.com.gestoecon.bean.UsuarioVO"%>
<%@page import="br.com.gestoecon.dao.MovimentoDAO"%>
<%@page import="br.com.gestoecon.bean.ContaVO"%>
<%@page import="br.com.gestoecon.dao.ContaDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GESTOECON - EXTRATO </title>
<jsp:include page="../cabecalho.jsp"></jsp:include>
</head>
<body>

	<%
	
	/** METODO PARA LISTAR CONTAS */
	
		ContaDAO dao = new ContaDAO();

		UsuarioVO usuarioOK = (UsuarioVO) session.getAttribute("usuarioOK");
	
		List<ContaVO> contas = dao.listarContaPorUsuario(usuarioOK.getEmail());
	%>

	<%
	
	/** METODO PARA LISTAR MOVIMENTOS */
		MovimentoDAO movimentoDAO = new MovimentoDAO();

		UsuarioVO usuarioLogado = (UsuarioVO) session.getAttribute("usuarioOK");

		List<MovimentoVO> meusMovimentos = movimentoDAO.listarMovimentoPorUsuario(usuarioLogado.getEmail());
	%>
	
</head>
<body>

	<jsp:include page="../menu.jsp"></jsp:include>

			<div class="container">
    		<div class="row">
        	<div class="page-header">
            <h1> <i class=" glyphicon glyphicon-folder-open "> </i> Emitir Extrato</h1>
					
					
					<!-- SELECIONAR CONTA PARA EXTRATO -->
					<center>
					<legend></legend>
					
					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="conta"> MINHAS CONTAS </label>
						<div class="col-md-4"> <select name="conta" class="form-control">
								<option>SELECIONE UMA CONTA </option>

								<%
									for (ContaVO conta : contas) {
								%>
								<option value="<%= conta.getId()%>"><%=conta.getNome()%></option>
								<%
									}
								%>
							</select>
						</div>
					</div>	
        </div> <br> </center>
        					<!-- FIM DA SELEÇÃO DE CONTA -->
        					
        					<center>
					<li class="btn btn-home"><a href="../Home.jsp"> VOLTAR</a></li>
				</center>
        					
        
        <!-- TABELA ONDE SERÃO EXIBIDOS OS MOVIMENTOS -->
        
        <div class="col-md-15">
        	<div class="panel panel-default">
        		<div class="panel-heading panel-title text-center">EXTRATO</div>
        		
        		<div class="panel-body">
        			<div class="table-responsive">
        				<table
								class="table table-bordered table-striped table-hover">
        					<thead>
        						<th>Valor</th>
        						<th>Descrição</th>
        						<th>Tipo</th>
        						<th>Data</th>
        						<th>Editar</th>
								<th>Excluir</th>
								
        					</thead>
        					<tbody>
        						<%
        							for (MovimentoVO movimento : meusMovimentos) {
        						%>
        							<tr>
        								<td><%=movimento.getValor()%></td>
        								<td><%=movimento.getNome()%></td>
        								<td>
        									<%
        										if (movimento.isTipo()) {
        												out.println("Entrada");
        											} else {
        												out.println("Saida");
        											}
        									%>
        								</td>
        						
        								<td>
        									<%
        										if (movimento.getData() != null) {
        												SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

        												String dataFormatada = format.format(movimento.getData());
        												out.println(dataFormatada);
        											} else {
        												out.println("Data nao fornecida");
        											}
        									%>
        								
        						<td><a
								href="../ManterMovimento?acao=editarMovimento&Id_movimento=<%= movimento.getId_movimento()%>"
								class="btn btn-warning">Alterar</a></td>
							<td>
								<form action="../ManterMovimento" method="post">
									<input type="hidden" name="acao" value="excluirMovimento"/> <input
										type="hidden" name="Id_movimento" value="<%= movimento.getId_movimento()%>" /> <input
										type="submit" value="Excluir" class="btn btn-danger" />

								</form>
								
								<%
        							}
        						%>
							</td>
        						
        						</tr>
        					</tbody>
        				</table>
        			</div>
        		</div>
        	</div>
        </div>

</body>


</html>