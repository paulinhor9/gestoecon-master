<!DOCTYPE html>
<%@page import="br.com.gestoecon.bean.ContaVO"%>
<head>
<%
	ContaVO conta = (ContaVO) request.getAttribute("conta");
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Editar Conta</title>
</head>
<jsp:include page="../cabecalho.jsp"></jsp:include>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="container">
		<div class="col-md-8 col-md-offset-2">

			<form class="form-horizontal" action="/gestoecon/ManterConta"
				method="post">
				<input type="hidden" name="acao" value="alterarConta"> <input
					type="hidden" name="id" value="<%=conta.getId()%>">
				<fieldset>

					<!-- Form Name -->
					<legend>Editar Conta</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="nome">Conta</label>
						<div class="col-md-4">
							<input id="nome" name="nome" type="text"
								placeholder="Digite o nome da conta"
								class="form-control input-md" required=""
								value="<%=conta.getNome()%>">
						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="saldo">Saldo</label>
						<div class="col-md-4">
							<input id="saldo" name="saldo" type="double"
								placeholder="Saldo da conta" class="form-control input-md"
								required="" value="<%=conta.getSaldo()%>">
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
						href="ManterConta?acao=listarConta"> VOLTAR</a></li>
				</center>
			</form>
</body>
</html>