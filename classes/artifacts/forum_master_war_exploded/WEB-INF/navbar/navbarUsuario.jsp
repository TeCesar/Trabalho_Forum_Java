<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 05/11/2018
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<div id="barra">
    <label>Bem vindo, ${usuarioLogado.nomeConta}</label>
    <div id="login">
        <a href="controller?acao=login&tipo=logoff">Sair</a>

    </div>
</div>

<nav>
    <ul class="menu">

        <li><a>Tópicos</a>
            <ul>
                <li><a href="controller?acao=topico&tipo=criaTopico">Novo Tópico</a></li>
                <li><a href="controller?acao=topico&tipo=listarTopicos">Listar Tópicos</a></li>
            </ul>
        </li>

    </ul>
</nav>
<br><br><br><br>
</body>
</html>