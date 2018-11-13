<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 20/10/2018
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Todos Tickets</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>

</head>
<body>
<c:if test="${usuario.tipoAcesso == 'Operador'}">
    <%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
</c:if>
<c:if test="${usuario.tipoAcesso == 'Cliente'}">
    <%@include file="/WEB-INF/navbar/navbarCliente.jsp" %>
</c:if>
<br><br><br><br><br><br>

<h1 class="titulo">Todos Tickets</h1>

<input type="text" name="buscar" placeholder="BUSCAR" class="busca">
<form>
    <table width="90%" align="center" cellpadding="10">
        <tr align="center" bgcolor="#CCC">
            <td><strong>Número Ticket</strong></td>
            <td><strong>Titulo Assunto</strong></td>
            <td><strong>Situacao</strong></td>
            <td><strong>Respondido</strong></td>
            <td><strong>Ação</strong></td>
        </tr>

        <c:forEach var="ticket" items="${listaTickets}">
            <tr style="text-align: center;" class="border_bottom">
                <td>${ticket.id}</td>
                <td>${ticket.titulo}</td>
                <c:if test="${ticket.situacao == 'Aberto'}">
                    <td style="background-color: #F08080;">${ticket.situacao}</td>
                </c:if>
                <c:if test="${ticket.situacao == 'Fechado'  && ticket.respondido == 'Sim'}">
                    <td style="background-color: #90EE90">${ticket.situacao}</td>
                </c:if>
                <c:if test="${ticket.situacao == 'Fechado'  && ticket.respondido == 'Nao'}">
                    <td style="background-color: #F08080;">${ticket.situacao}</td>
                </c:if>
                <td>${ticket.respondido}</td>
                <td class="abrir"><a href="#">ABRIR</a></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
