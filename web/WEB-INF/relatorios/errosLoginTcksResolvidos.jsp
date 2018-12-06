<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 06/12/2018
  Time: 02:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Relatório</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>
<%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>

<center>
    <h1>Erros de Login</h1>
    <table style="text-align: center">
        <tr>
            <th>Nome de Usuário</th>
            <th>Erros de Login</th>
        </tr>
        <c:forEach var="usuario" items="${listaUsuarios}">
            <tr>
                <td>${usuario.nomeConta}</td>
                <td>${usuario.errosLogin}</td>
            </tr>
        </c:forEach>
    </table>
    <br><br>
    <h1>Tickets Resolvidos</h1>
    <table style="text-align: center">
        <tr>
            <th>Nome Operador</th>
            <th>Tickets Resolvidos</th>
        </tr>
        <c:forEach var="usuario" items="${listaUsuarios}">
            <c:if test="${usuario.tipoAcesso == 'Operador'}">
                <tr>
                    <td>${usuario.nomeConta}</td>
                    <td>${usuario.ticketsResolvidos}</td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</center>
</body>
</html>
