<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 06/10/2018
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <style><%@include file="/WEB-INF/estilo/estilo.css"%></style>

    <style>

        body{
            background-color: #11a6d4;
        }

    </style>


    <title>Login</title>
</head>
<body>

    <div id="divLogin">
        <div id="login-box-interno">
            <form action="controller?acao=login" method="post">
                <div id="login-box-label">Bem vindo a D.R.T</div>
                <div class="input-div" id="input-usuario">
                    <input type="text" placeholder="USUÁRIO" id="nomeUsuario" name="nomeUsuario">
                </div>
                <div class="input-div" id="input-senha">
                    <input type="password" id="senha" name="senha" placeholder="SENHA">
                </div>
                <div id="botoes">
                        <input type="submit" value="Logar" class="botao">
                    <div id="lembrar-senha"><input type="checkbox">Lembrar minha senha</div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
