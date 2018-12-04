<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 05/11/2018
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<div id="barra">
    <label>Bem vindo</label>
    <div id="login">
        <a href="../../login.jsp">Sair</a>

    </div>
</div>

<nav>
    <ul class="menu">

        <li><a>Tickets</a>
            <ul>
                <li><a href="controller?acao=ticket&tipo=iniciarTicket">Abrir Ticket</a></li>
                <li><a href="controller?acao=listarTickets&tipo=user">Meus Tickets</a></li>
            </ul>
        </li>

        <li><a>Tópicos</a>
            <ul>
                <li><a href="controller?acao=topico&tipo=criaTopico">Novo Tópico</a></li>
                <li><a href="controller?acao=topico&tipo=listarTopicos">Listar Tópicos</a></li>
            </ul>
        </li>

    </ul>
    </ul>
</nav>
<br><br><br><br>

</body>
</html>
