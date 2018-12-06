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
                <input type="hidden" value="${erro}" id="erro">
                <div id="login-box-label">Bem vindo a D.R.T</div>
                <div class="input-div" id="input-usuario">
                    <input type="text" placeholder="USUÁRIO*" id="nomeUsuario" name="nomeUsuario" autofocus required="required" oninvalid="this.setCustomValidity('O nome de usuário e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}">
                </div>
                <div class="input-div" id="input-senha">
                    <input type="password" id="senha" name="senha" placeholder="SENHA*" required="required" oninvalid="this.setCustomValidity('A senha e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}">
                </div>
                <div id="botoes">
                        <input type="submit" value="Logar" class="botao"><br><br>
                    <a href="cadastroUsuario.jsp"><input type="button" value="Cadastre-se" class="botao"></a></input>
                </div>
            </form>


        </div>
    </div>

<script>
    var erro = document.getElementById("erro").value;

    if (erro == "usuarioBloqueado"){
        alert("O seu usuário foi bloqueado pelo Administrador.");
    }

    if (erro == "loginSenhaErrados"){
        alert("Usuário e/ou senha inválido(s)");
    }
</script>
</body>
</html>
