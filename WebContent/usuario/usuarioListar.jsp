<%@page import="br.com.gestoecon.bean.UsuarioVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	UsuarioVO usuario = (UsuarioVO) request.getAttribute("usuarioVO");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GestoEcon - Usuario</title>
<jsp:include page="../cabecalho.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="container">

		<div class="page-header">
			<h1>
				<i class="glyphicon glyphicon-list"></i> Usuário
			</h1>
		</div>


		<div class="row">

			<div class="col-md-8 col-md-offset-2">

				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Nome</th>
							<th>Email</th>
						<!--<th>Senha</th> -->
							<th>Editar</th>
							<th>Excluir</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><%=usuario.getNome()%></td>
							<td><%=usuario.getEmail()%></td>
						<!--<td><%=usuario.getSenha()%></td> -->
							<td><a
								href="ManterUsuario?acao=editarUsuario&email=<%=usuario.getEmail()%>"
								class="btn btn-warning">Alterar</a></td>
							<td>
								<form action="ManterUsuario" method="post">
									<input type="hidden" name="acao" value="excluirUsuario" /> <input
										type="hidden" name="email" value="<%=usuario.getEmail()%>" />

									<input type="submit" value="Excluir" class="btn btn-danger " disabled />
								</form>
							</td>
						</tr>
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