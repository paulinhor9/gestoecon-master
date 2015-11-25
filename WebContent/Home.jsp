<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>INICIO - GESTOECON</title>
<jsp:include page="cabecalho.jsp"></jsp:include>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include> 


<div class="container">
    <div class="row">
        <div class="page-header">
            <h1><i class="glyphicon glyphicon-home"></i> Página Inicial</h1>
        </div>
        
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading panel-title text-center">GERENCIAMENTO</div>

                <div class="panel-body">
                    <ul class="list-group">
                     	<li class="list-group-item"><a href="ManterUsuario?acao=listarUsuario"> USUARIO</a></li>
                        <li class="list-group-item"><a href="ManterConta?acao=listarConta">  CONTAS</a></li>
                        <li class="list-group-item"><a href="movimentos/movimentoInserir.jsp"> + MOVIMENTO</a></li>
                        <li class="list-group-item"><a href="extrato/extrato.jsp"> EXTRATO</a></li> <br></br>
                    	
                    
                        <center><a href="ManterUsuario?acao=listarUsuario" class="btn btn-lg btn-info"><span class="glyphicon glyphicon-user"></span> USUÁRIO</a>
						<a href="ManterConta?acao=listarConta" class="btn btn-lg btn-success"><span class="glyphicon glyphicon-usd"></span> CONTAS</a>                    
                   		<a href="movimentos/movimentoInserir.jsp" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-plus-sign"></span> MOVIMENTO</a>
						<a href="extrato/extrato.jsp" class="btn btn-lg btn-primary"><span class="glyphicon glyphicon-calendar"></span> EXTRATO</a>                    
                    </ul> 
                          </center>
                </div>

                <div class="panel-footer"></div>
            </div>
        </div>
    </div>
</div>
	

</body>
</html>