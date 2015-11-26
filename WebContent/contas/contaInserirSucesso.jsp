<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GESTOECON- CONTA CRIADA</title>
</head>
<jsp:include page="/cabecalho.jsp"></jsp:include>
<body>
	<jsp:include page="/menu.jsp"></jsp:include>

	<center>
		<div class="container">
			<div class="page-header">
			
				<H2>REGISTRANDO CONTA NO BANCO DE DADOS!</H2>
			</div>


			<div class="alert alert-default">
				<td>
					<h4>AGUARDE</h4>
					<h5>PROCESSANDO O REGISTRO ! :)</h5> <br> 
				</td>
			
				<img src="../imagens/load.gif" />
				
				
					<!-- REDIRECIONADOR -->
	<meta http-equiv="refresh" content="2; url=../ManterConta?acao=listarConta">
	</center>
	</div>
	</div>
</body>
</html>