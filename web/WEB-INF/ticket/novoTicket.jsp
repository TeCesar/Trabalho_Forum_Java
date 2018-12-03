<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 12/11/2018
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Novo Tópico</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>
<c:if test="${usuarioLogado.tipoAcesso == 'Cliente'}">
    <%@include file="/WEB-INF/navbar/navbarCliente.jsp" %>
</c:if>

<form method="post" action="controller?acao=ticket&tipo=finalizarTicket">
    <input type="text" name="tituloTicket"><br><br>
    <input type="text" name="mensagemTicket">
    <input type="submit" value="Abrir Ticket">
</form>

</body>
</html>
