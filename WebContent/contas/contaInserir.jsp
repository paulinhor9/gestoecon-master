<!DOCTYPE html>
<%@page import="br.com.gestoecon.bean.UsuarioVO"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Cadastrar Nova Conta</title>
  <jsp:include page="../cabecalho.jsp" />
  
  <%
  	UsuarioVO usuarioLogado = (UsuarioVO) session.getAttribute("usuarioOK");
  %>
</head>
<body>
	<jsp:include page="../menu.jsp" />

	<div class="container">
		<div class="col-md-8 col-md-offset-2">

			<form class="form-horizontal" action="../ManterConta" method="post">
				<input type="hidden" name="acao" value="inserirConta">
				<input type="hidden" name="id_usuario" value="<%= usuarioLogado.getEmail() %>"/>
				<fieldset>

					<!-- Form Name -->
					 <h1><i class="glyphicon glyphicon-plus-sign   "></i> Adicionar conta </h1> <br> <br>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="nome">Nome</label>
						<div class="col-md-4">
							<input id="nome" name="nome" type="text"
								placeholder="Digite o nome da conta" class="form-control input-md"
								required="">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="saldo">Saldo</label>
						<div class="col-md-4">
							<input id="saldo" name="saldo" type="text"
								placeholder="Digite o saldo da conta" class="form-control input-md"
								required="">
						</div>
					</div>

					<!-- Button (Double) -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="cadastrar"></label>
						<div class="col-md-8">
							<button type="submit" value="Cadastrar" class="btn btn-primary">Cadastrar</button>
							<button type="reset" value="Limpar" class="btn btn-danger">Limpar</button>
						</div>
					</div>
<center>
						<li class="btn btn-home"><a href="../ManterConta?acao=listarConta"> VOLTAR</a></li>
					</center>
				</fieldset>
			</form>


		</div>
	</div>

</body>
           

</html>