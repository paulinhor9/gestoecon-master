<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GESTOECON- REGISTRO DE MOVIMENTO</title>
</head>
<jsp:include page="/cabecalho.jsp"></jsp:include>
<body>
	<jsp:include page="/menu.jsp"></jsp:include>

	<center>
		<div class="container">
			<div class="page-header">
			
				<h1>Movimento realizado com sucesso!</h1>
			</div>


			<div class="alert alert-default">
				<td>
					<h4>AGUARDE</h4>
					<h5>EFETUANDO OPERAÇÃO!</h5> <br> 
					<img src="../imagens/load.gif" />
				</td>
				
				
				
					<!-- REDIRECIONADOR -->
	<meta http-equiv="refresh" content="5; url=../movimentos/movimentoInserir.jsp"> 
	</center>
	</div>
	</div>
</body>
</html>