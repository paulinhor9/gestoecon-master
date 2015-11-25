<%@page import="br.com.gestoecon.bean.UsuarioVO"%>
<%@page import="br.com.gestoecon.bean.ContaVO"%>
<%@page import="br.com.gestoecon.dao.ContaDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<head>
<title>GestoEcon - Cadastrar Movimento</title>
<jsp:include page="../cabecalho.jsp" />

<%
	ContaDAO dao = new ContaDAO();

	UsuarioVO usuarioOK = (UsuarioVO) session.getAttribute("usuarioOK");
	
	List<ContaVO> contas = dao.listarContaPorUsuario(usuarioOK.getEmail());
%>
</head>
<body>
	<jsp:include page="../menu.jsp" />

	<div class="container">
		<div class="col-md-8 col-md-offset-2">

			<form class="form-horizontal" action="../ManterMovimento"
				method="post">
				<input type="hidden" name="acao" value="inserirMovimento">
				<input type="hidden" name="id_usuario" value="<%= usuarioOK.getEmail() %>"/>

				<fieldset>

					<!-- Form Name -->
					 
 <div class="row">
        <div class="page-header">
            <h1><i class="glyphicon glyphicon-plus-sign"></i> Registrar Movimento</h1>
        </div>
        
					<!-- Select Basic -->


					<div class="form-group">
						<label class="col-md-4 control-label" for="conta">Minhas contas</label>
						<div class="col-md-4">
							<select name="conta" class="form-control">
								<option>Selecione uma conta</option>

								<%
									for (ContaVO conta : contas) {
								%>
								<option value="<%= conta.getId()%>"><%=conta.getNome()%></option>
								<%
									}
								%>
							</select>

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="inserirMovimento">Nome</label>
						<div class="col-md-4">
							<input id="nome" name="nome" type="text"
								placeholder="Descrição do movimento."
								class="form-control input-md" required="">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="valor">Valor</label>
						<div class="col-md-4">
							<input id="valor" name="valor" type="text"
								placeholder="Valor do movimento" class="form-control input-md"
								required="required">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="data">Data</label>
						<div class="col-md-4">
							<input type="date" name="data" type="text"
								placeholder="Data do movimento" class="form-control input-md"
								required="required">

						</div>
					</div>

					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="tipo"> Tipo</label>
						<div class="col-md-4">
							<select id="tipo" name="tipo" class="form-control">
								<option value="true">Entrada</option>
								<option value="false">Saída</option>
							</select>
						</div>
					</div>

					<!-- Button (Double) -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="cadastrar"></label>
						<div class="col-md-8">
							<button type="submit" name="cadastrar" class="btn btn-success">CADASTRAR</button>
							<button type="reset" name="limpar" class="btn btn-danger">LIMPAR</button>

						</div>
					</div>
					<center>
						<li class="btn btn-home"><a href="../Home.jsp"> VOLTAR</a></li>
					</center>
				</fieldset>
			</form>

		</div>
	</div>

</body>


</html>