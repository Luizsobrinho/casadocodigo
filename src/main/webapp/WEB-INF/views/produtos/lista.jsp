<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<c:url value="/resources/css" var="cssPath" />
	<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
	<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" />

	<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais - Casa do Código</title>
</head>

<body>

	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Casa do Código</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="${s:mvcUrl('PC#listar').build() }" rel="nofollow">Listagem de Produtos</a></li>
					<li><a href="${s:mvcUrl('PC#form').build()}" rel="nofollow">Cadastro de Produtos</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
  					<li><a href="#"><security:authentication property="principal.username"/></a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div>
	</nav>
	<div class="container">
		<h1>Lista de Produtos</h1>
		<p>${sucesso}</p>
		<p>${falha}</p>
		<br>
		<table class="table table-hover table-bordered">
			<tr>
				<th>Título</th>
				<th>Descrição</th>
				<th>Páginas</th>
			</tr>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td>
						<a href="${s:mvcUrl('PC#detalhe').arg(0, produto.id).build()}">${produto.titulo}</a>
					<td>${produto.descricao}</td>
					<td>${produto.paginas}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>

</html>