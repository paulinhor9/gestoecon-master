<!DOCTYPE html>
<%@page import="br.com.gestoecon.bean.UsuarioVO"%>
<head>
<%
	UsuarioVO objUsuario = (UsuarioVO) request.getAttribute("usuarioOk");
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Editar Usuario</title>
</head>
<jsp:include page="../cabecalho.jsp"></jsp:include>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>


	<div class="container">
		<div class="col-md-8 col-md-offset-2">

			<form class="form-horizontal" action="/gestoecon/ManterUsuario" method="post">
				<input type="hidden" name="acao" value="alterarUsuario"> <input
					type="hidden" name="email" value="<%=objUsuario.getEmail()%>">
				<fieldset>

					<!-- Form Name -->
					<h1>
				<i class="glyphicon glyphicon-user "></i> Editar usuário
			</h1> <br><br>


 	<!-- Text input--> 
 	<!-- 
				<div class="form-group">
						<label class="col-md-4 control-label" for="email">E-mail</label>
						<div class="col-md-4">
							<input id="email" name="email" type="text"
								placeholder="Digite o seu e-mail" class="form-control input-md"
								required="" value="<%=objUsuario.getEmail()%>">
						</div>
					</div> 
					
					
					-->

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="nome">Nome</label>
						<div class="col-md-4">
							<input id="nome" name="nome" type="text"
								placeholder="Digite o seu nome" class="form-control input-md"
								required="" value="<%=objUsuario.getNome()%>">
						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="senha">Senha</label>
						<div class="col-md-4">
							<input id="senha" name="senha" type="password"
								placeholder="Digite sua nova senha" class="form-control input-md"
								required="true" /> <input id="senha2" name="senha2"
								type="password" placeholder="Digite sua senha novamente"
								class="form-control input-md" required="true" value="">
						</div>
					</div>

					<!-- Button (Double) -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="cadastrar"></label>
						<div class="col-md-8">
							<button type="submit" value="Salvar" class="btn btn-primary">Salvar</button>
							<button type="reset" value="Limpar" class="btn btn-danger">Limpar</button>
							
						</div>
					</div>

				</fieldset>
				<center>
					<li class="btn btn-home"><a
						href="ManterUsuario?acao=listarUsuario"> VOLTAR</a></li>
				</center>
			</form>
</body>
</html>