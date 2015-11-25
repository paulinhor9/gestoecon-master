<%@page import="br.com.gestoecon.bean.ContaVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	List<ContaVO> contas = (List<ContaVO>) request.getAttribute("listaConta");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GestoEcon - Contas</title>
<jsp:include page="../cabecalho.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="container">

		<div class="page-header">
			<h1>
				<i class="glyphicon glyphicon-list"></i> Lista de contas
			</h1>
		</div>


		<div class="row">

			<div class="col-md-8 col-md-offset-2">

				<a href="contas/contaInserir.jsp" class="btn btn-primary"><i
					class="glyphicon glyphicon-plus"></i>Adicinar nova</a><br />
				<br />

				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Nome</th>
							<th>Saldo</th>
							<th>Editar</th>
							<th>Excluir</th>
						</tr>
					</thead>

					<tbody>
						<%
							//if (!(contas.isEmpty())) {
						%>
						<%
							for (ContaVO conta : contas) {
						%>
						<tr>
							<td><%=conta.getNome()%></td>
							<td><%=conta.getSaldo()%></td>
							<td><a
								href="ManterConta?acao=editarConta&id=<%=conta.getId()%>"
								class="btn btn-warning">Alterar</a></td>
							<td>
								<form action="ManterConta" method="post">
								
									<input type="hidden" name="acao" value="excluirConta" /> <input
										type="hidden" name="id" value="<%=conta.getId()%>" /> <input
										type="submit" value="Excluir" class="btn btn-danger" disabled />

								</form>
							</td>
						</tr>
						<%
							} //fecha o for
								//} //fecha o if
						%>
					</tbody>
					</tr>

				</table>
				<center>
					<li class="btn btn-home"><a href="Home.jsp"> Página
							Inicial</a></li>
				</center>
			</div>
		</div>
	</div>

</body>
</html>