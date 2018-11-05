<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 05/11/2018
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Tickets por Cliente</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>

<%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
<br><br><br><br>

<center>
<c:forEach var="cliente" items="${listaClientes}">
    <h5>Cliente: ${cliente.nome} ${cliente.sobrenome}</h5>
    <table>
        <tr>
            <th>Titulo</th>
            <th>Mensagem</th>
            <th>Status</th>
            <th>Situação</th>
            <th>Respondido</th>
        </tr>
        <c:forEach var="ticket" items="${listaTickets}">
            <c:if test="${cliente.usuarioDTO.id == ticket.usuarioDTO.id}">
                <tr>
                    <td>${ticket.titulo}</td>
                    <td>${ticket.mensagem}</td>
                    <td>${ticket.status}</td>
                    <td>${ticket.situacao}</td>
                    <td>${ticket.respondido}</td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</c:forEach>
</center>

</body>
</html>
