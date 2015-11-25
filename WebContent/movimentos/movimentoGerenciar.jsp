<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.gestoecon.bean.MovimentoVO"%>
<%@page import="java.util.List"%>
<%@page import="br.com.gestoecon.bean.UsuarioVO"%>
<%@page import="br.com.gestoecon.dao.MovimentoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>GestoEcon - Movimentos</title>

<jsp:include page="../cabecalho.jsp"></jsp:include>

<%
MovimentoDAO movimentoDAO = new MovimentoDAO();

UsuarioVO usuarioLogado = (UsuarioVO) session.getAttribute("usuarioOK");

List<MovimentoVO> meusMovimentos = movimentoDAO.listarMovimentoPorUsuario(usuarioLogado.getEmail());


%>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="page-header">
            <h1><i class="glyphicon glyphicon-th-list "></i> Gerenciar Movimentos</h1>
        </div>
        
        <div class="col-md-7">
        	<div class="panel panel-default">
        		<div class="panel-heading panel-title text-center">MEUS MOVIMENTOS</div>
        		
        		<div class="panel-body">
        			<div class="table-responsive">
        				<table class="table table-bordered table-striped table-hover">
        					<thead>
        						<th>Valor</th>
        						<th>Nome</th>
        						<th>Tipo</th>
        						<th>Data</th>
        					</thead>
        					<tbody>
        						<% for(MovimentoVO movimento : meusMovimentos) {%>
        							<tr>
        								<td><%= movimento.getValor() %></td>
        								<td><%= movimento.getNome() %></td>
        								<td>
        									<%
        									 if(movimento.isTipo()){
        										 out.println("Entrada"); 
        									 }
        									 else{
        										 out.println("Saida"); 
        									 }
        									%>
        								</td>
        								<td>
        									<%
        										if(movimento.getData() != null){
        											SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                									
            										String dataFormatada = format.format(movimento.getData());
            										out.println(dataFormatada);
        										}
        										else{
        											out.println("Data nao fornecida");
        										}
        									%>
        								</td>
        							</tr>
        						<%} %>
        					</tbody>
        				</table>
        			</div>
        		</div>
        	</div>
        </div>
        
        <div class="col-md-5">
            <div class="panel panel-primary">
                <div class="panel-heading panel-title text-center">MOVIMENTOS</div>

                <div class="panel-body">
                    <ul class="list-group">
             <br>
                        <center>
						                    
                   		<a href="movimentoInserir.jsp" class="btn btn-sm btn-info"><span class="glyphicon glyphicon-plus-sign"></span> NOVO MOVIMENTO</a>
						<a href="#" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove-circle" disabled ></span> EXCLUIR MOVIMENTO</a>                    
                    </ul> 
                          </center>
                </div>

                <div class="panel-footer"></div>
            </div>
        </div>
    </div>
</div>


<center>
					<li class="btn btn-home"><a href="../Home.jsp"> Página
							Inicial</a></li>
				</center>







</body>
</html>