<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 06/12/2018
  Time: 00:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Relatório de Duração</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>
<%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>

<center>
    <h1>Tópicos</h1>
    <table width="90%" align="center" cellpadding="10">
        <tr align="center" bgcolor="#CCC">
            <td><strong>Nome de Usuário</strong></td>
            <td><strong>Título</strong></td>
            <td><strong>Duração do Tópico(hh:mm:ss)</strong></td>
        </tr>
        <c:forEach var="topico" items="${listaTopicos}">
            <c:if test="${topico.status != 'Incompleto'}">
                <tr style="text-align: center;" class="border_bottom">
                    <td>${topico.usuarioDTO.nomeConta}</td>
                    <td>${topico.titulo}</td>
                    <td><fmt:formatDate value="${topico.duracao}" pattern="HH:mm:ss"/></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    <br><br>
    <h1>Tickets</h1>
    <table width="90%" align="center" cellpadding="10">
        <tr align="center" bgcolor="#CCC">
            <td><strong>Nome de Usuário</strong></td>
            <td><strong>Título</strong></td>
            <td><strong>Duração do Tópico(hh:mm:ss)</strong></td>
        </tr>
        <c:forEach var="ticket" items="${listaTickets}">
            <c:if test="${ticket.status != 'Incompleto'}">
                <tr style="text-align: center;" class="border_bottom">
                    <td>${ticket.usuarioDTO.nomeConta}</td>
                    <td>${ticket.titulo}</td>
                    <td><fmt:formatDate value="${ticket.duracao}" pattern="HH:mm:ss"/></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</center>

</body>
</html>
