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


    <title>Cadastro de Usuário</title>
</head>
<body>

    <div id="divLogin">
        <div id="login-box-interno">
            <form method="post" action="controller">
                <input type="hidden" value="cadastro" name="acao">
                <input type="hidden" value="usuario" name="tipo">
                <div id="login-box-label">Bem vindo a D.R.T</div>
                <div class="input-div" id="input-usuario">
                    <input type="text" placeholder="Nome Usuario*" id="novoUsuario" name="nomeConta" required="required" oninvalid="this.setCustomValidity('O nome de usuário e obrigatório')">
                </div>
               <p style="text-align: center;">A senha padrão e 12345 assim que logar pela primeira vez será pedido para alterar a senha.</p><br>
                <div id="botoes">
                        <input type="submit" value="Cadastrar" class="botao" ><br>
                </div>
            </form>
            <div class="botoes">
                 <a href="login.jsp"><input type="submit" value="Voltar" class="botao"></a>
            </div>

        </div>
    </div>
</body>
</html>
