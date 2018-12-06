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
    <table width="90%" align="center" cellpadding="10">
        <tr align="center" bgcolor="#CCC">
            <td><strong>Nome de Usuário</strong></td>
            <td><strong>Erros de Login</strong></td>
        </tr>
        <c:forEach var="usuario" items="${listaUsuarios}">
            <tr style="text-align: center;" class="border_bottom">
                <td>${usuario.nomeConta}</td>
                <td>${usuario.errosLogin}</td>
            </tr>
        </c:forEach>
    </table>
    <br><br>
    <h1>Tickets Resolvidos</h1>
    <table width="90%" align="center" cellpadding="10">
        <tr align="center" bgcolor="#CCC">
            <td><strong>Nome Operador</strong></td>
            <td><strong>Tickets Resolvidos</strong></td>
        </tr>
        <c:forEach var="usuario" items="${listaUsuarios}">
            <c:if test="${usuario.tipoAcesso == 'Operador'}">
                <tr style="text-align: center;" class="border_bottom">
                    <td>${usuario.nomeConta}</td>
                    <td>${usuario.ticketsResolvidos}</td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</center>
</body>
</html>
