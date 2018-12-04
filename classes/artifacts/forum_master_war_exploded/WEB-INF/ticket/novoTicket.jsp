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
<center>
        <h1 class="titulo">Abrir novo Ticket</h1>
    <br><br>
    <div style="text-align: center">
        <form method="post" action="controller?acao=ticket&tipo=finalizarTicket">
           <strong><label class="txt">Titulo do Tickt: </label></strong><input type="text" name="tituloTicket" class="campo" required><br><br>
            <strong><label class="txt">Mensagem: </label></strong><input type="text" name="mensagemTicket" class="campo" required><br><br>
            <input type="submit" value="Abrir Ticket" class="btne">
        </form>
    </div>
</center>


</body>
</html>
