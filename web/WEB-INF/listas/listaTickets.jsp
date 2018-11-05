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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>

<%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
<br><br><br><br><br><br>

<h1 class="titulo">Todos Tickets</h1>

<input type="text" name="buscar" placeholder="BUSCAR" class="busca">
<form>
    <table width="90%" align="center" cellpadding="10">
        <tr align="center" bgcolor="#CCC">
            <td><strong>Número Ticket</strong></td>
            <td><strong>Titulo Assunto</strong></td>
            <td><strong>Situacao</strong></td>
            <td><strong>Ação</strong></td>
        </tr>

        <c:forEach var="ticket" items="${listaTickets}">
            <tr>
                <td>${ticket.id}</td>
                <td>${ticket.titulo}</td>
                <td>${ticket.situacao}</td>
                <td><a href="#">Abrir</a></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
