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
    <title>Menu Principal</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
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
                <li><a href="controller?acao=cadastroCliente">Cliente</a></li>
                <li><a href="controller?acao=cadastroEmpresa">Empresa</a></li>

            </ul>
        </li>

        <li><a href="#">Relatórios</a>
            <ul>
                <li><a href="#">Cliente</a></li>
                <li><a href="#">Empresa</a></li>
                <li><a href="#">Venda</a></li>
                <li><a href="#">Estoque</a></li>
                <li><a href="#">Tickets</a></li>
                <li><a href="#">Tópicos</a></li>
            </ul>
        </li>

        <li><a href="#">Tickets</a>
            <ul>
                <li><a href="controller?acao=tickets&tipo=todos">Todos</a></li>
                <li><a href="controller?acao=tickets&tipo=Aberto">Aberto</a></li>
                <li><a href="controller?acao=tickets&tipo=Fechado">Fechado</a></li>
                <li><a href="controller?acao=tickets&tipo=Andamento">Em Andamento</a></li>
            </ul>
        </li>

        <li><a href="#">Tópicos</a></li>

        <li><a href="#">Listar</a>
            <ul>
                <li><a href="controller?acao=listarClientes">Clientes</a></li>
                <li><a href="controller?acao=listarEmpresas">Empresas</a></li>
            </ul>
        </li>
    </ul>
    </ul>
</nav>
</body>
</html>
