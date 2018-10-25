<%--
  Created by IntelliJ IDEA.
  User: Robson Manfroi
  Date: 14/10/2018
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro</title>
    <style><%@include file="/WEB-INF/estilo/estilo.css"%></style>
</head>
<body>

<div id="barra">
    <label>Bem vindo</label>
    <div id="login">
        <a href="../../index.jsp">Sair</a>

    </div>
</div>

<nav>
    <ul class="menu">

        <li><a href="#">Cadastrar</a>
            <ul>
                <li><a href="controller?acao=cadastro">Cliente</a></li>
                <li><a href="#">Empresa</a></li>

            </ul>
        </li>
        <li><a href="#">Relatórios</a></li>
        <li><a href="controller?acao=ticket">Tickets</a></li>
        <li><a href="#">Tópicos</a></li>
    </ul>
</nav>
</body>
</html>
