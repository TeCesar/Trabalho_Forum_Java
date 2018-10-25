<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 20/10/2018
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Todos Tickets</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
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
                <li><a href="controller?acao=tickets">Todos</a></li>
                <li><a href="#">Aberto</a></li>
                <li><a href="#">Fechado</a></li>
                <li><a href="#">Em Andamento</a></li>
            </ul>

        <li><a href="#">Tópicos</a></li>
    </ul>
</nav>
<br><br><br><br><br><br>

<h1 class="titulo">Todos Tickets</h1>

<input type="text" name="buscar" placeholder="BUSCAR" class="busca">
<form>
    <table width="90%" align="center" cellpadding="10">
        <tr align="center" bgcolor="#CCC">
            <td><strong>Número Ticket</strong></td>
            <td><strong>Titulo Assunto</strong></td>
            <td><strong>Mensagem</strong></td>
            <td><strong>Status</strong></td>
            <td><strong>Responder</strong></td>
        </tr>

        <tr class="ticket">

            <td>TD0001</td>
            <td>BUG</td>
            <td>Quando eu clico la bug aqui</td>
            <td class="aberto">ABERTO</td>
            <td class="responder"><a href="#"><i class="fa fa-edit" style="color:rgba(0,0,0,1.00)"></i></a></td>
        </tr>

        <tr class="ticket2">
            <td>TD0002</td>
            <td>BUG</td>
            <td>Quando eu clico la bug aqui</td>
            <td class="fechado">FECHADO</td>
            <td class="responder"><a href="#"><i class="fa fa-edit" style="color:rgba(0,0,0,1.00)"></i></a></td>
        </tr>
    </table>
</form>
</body>
</html>
