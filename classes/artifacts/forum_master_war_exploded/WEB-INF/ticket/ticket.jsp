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
    <title>Criacao de Tickets</title>
</head>
<body>
<form action="controller?acao=criarTicket" method="post">
<fieldset>
    <legend>Ticket</legend>
    <input placeholder="Título" name="titulo"><br>
    <input placeholder="Mensagem" name="mensagem"><br>
    <input type="submit" value="Postar">
</fieldset>
</form>
</body>
</html>
