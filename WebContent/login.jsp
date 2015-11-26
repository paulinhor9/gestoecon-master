<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GESTOECON - PAGINA INICIAL</title>
</head>
<jsp:include page="cabecalho.jsp"></jsp:include>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<div class="container">
		<div class="page-header">
			
			<h1> <font face="Impact"> BEM VINDO AO GESTOECON!</font> </h1>
			<h3><font> <font face="segoe script"> Faça login e aproveite!</font></h3> 
			
		</div>
		
		<center>

 <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading panel-title text-center">EFETUAR LOGIN</div>

                <div class="panel-body">
                    
                    
                    <div class="row">
				<form action="AutenticaUsuario" method="post" class="form-horizontal">

					<div class="form-group">
						<label class="col-md-4 control-label">E-Mail</label>
						<div class="col-md-6">
							<input type="email" class="form-control" name="email" value=""
								required="">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label">Senha</label>
						<div class="col-md-6">
							<input type="password" class="form-control" name="senha"
								required="true">
						</div>
					</div>
<center>
					<input type="hidden" name="acao" value="autenticarUsuario">
					<input type="submit" value="Entrar" class="btn btn-primary">
					<input type="reset" value="Limpar" class="btn btn-danger">
					<br> </center>
				</form>
				<br>
			</div>
                                     
                </div>

                <div class="panel-footer"></div>
            </div>
        </div>

	</center>




</body>
</html>