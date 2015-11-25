<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle Navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<%if(session.getAttribute("usuarioOK") == null){ %>
				<a class="navbar-brand" href="/gestoecon/index.jsp">GESTOECON</a>
			<%}else{ %>
				<a class="navbar-brand" href="/gestoecon/Home.jsp">GESTOECON</a>
			<%} %>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">

			</ul>

			<ul class="nav navbar-nav navbar-right">

				<%
					if (session.getAttribute("usuarioOK") == null) {
				%>
				<li><a href="/gestoecon/usuario/usuarioInserir.jsp"><i
						class="glyphicon glyphicon-plus"></i> Cadastre-se</a></li>

				<%
					}
				%>

				<%
					if (session.getAttribute("usuarioOK") != null) {
				%>
				<li> <a href="/gestoecon/AutenticaUsuario?acao=sair">
						<i class="glyphicon glyphicon-log-out"></i> Sair</a> </li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</nav>