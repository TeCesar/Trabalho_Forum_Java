<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Robson Manfroi
  Date: 18/10/2018
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NovaSenha</title>
    <style><%@include file="/WEB-INF/estilo/estilo.css"%></style>

    <style>
        body{
            background-color: #11a6d4;
        }

    </style>
</head>
<body>

    <center>
        <h1>Bem vindo</h1><br>
        <h2>Esse é seu primeiro acesso, por favor troque sua senha</h2>
    </center>
<div id="divLogin">
    <div id="login-box-interno">
        <form action="/novaSenha?nomeConta=<c:out value="nomeConta"" method="post">
            <div id="login-box-label">NOVA SENHA</div>
            <div class="input-div" id="input-usuario">
                <input type="text" name="novaSenha" placeholder="NOVA SENHA">
            </div>
            <div class="input-div" id="input-senha">
                <input type="text" name="confirmaSenha" placeholder="REPETIR SENHA"><br>
            </div>
            <div id="botoes">
                <input type="submit" value="SALVAR">
            </div>
        </form>
    </div>
</div>






</body>
</html>
