<!DOCTYPE html>
<%@page import="br.com.gestoecon.bean.MovimentoVO"%>
<head>
<%
	MovimentoVO movimento = (MovimentoVO) request.getAttribute("movimento");
%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Editar Movimento</title>
</head>
<jsp:include page="../cabecalho.jsp"></jsp:include>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

	<div class="container">
		<div class="col-md-8 col-md-offset-2">

			<form class="form-horizontal" action="/gestoecon/ManterMovimento" method="post">
				<input type="hidden" name="acao" value="alterarMovimento"> <input
					type="hidden" name="Id_movimento" value="<%= movimento.getId_movimento()%>">
			
				<fieldset>

					<!-- Form Name -->
					<legend>Editar Movimento</legend>

					<!-- editar descrição -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="nome">Descrição</label>
						<div class="col-md-4">
							<input id="nome" name="nome" type="text"
								placeholder="Digite a descrição do movimento"
								class="form-control input-md" required=""
								value="<%=movimento.getNome()%>">
						</div>
					</div>

					<!-- editar valor-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="valor">Valor</label>
						<div class="col-md-4">
							<input id="saldo" name="valor" type="double"
								placeholder="Saldo da conta" class="form-control input-md"
								required="" value="<%=movimento.getValor()%>">
						</div>
					</div>
					
					<!-- alterar data movimento -->
					<!-- 
					<div class="form-group">
						<label class="col-md-4 control-label" for="data">Data</label>
						<div class="col-md-4">
							<input id="data" name="data" type="date"
								placeholder="Saldo da conta" class="form-control input-md"
								required="" value="<%=movimento.getData()%>">
						</div> 
					</div>    -->
					
					<!-- alterar tipo movimento -->
					<!--  
					<div class="form-group">
						<label class="col-md-4 control-label" for="saldo">Tipo</label>
						<div class="col-md-4">
							<input id="saldo" name="tipo" type="tipo"
								placeholder="Saldo da conta" class="form-control input-md"
								required="" value="<%=movimento.isTipo()%>">
						</div> 
					</div> -->

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
						href="extrato/extrato.jsp"> VOLTAR</a></li>
				</center>
			</form>
</body>
</html>