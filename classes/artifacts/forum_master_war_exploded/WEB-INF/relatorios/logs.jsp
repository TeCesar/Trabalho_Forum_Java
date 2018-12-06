<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 06/12/2018
  Time: 00:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Log</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>
<%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>

<center>
<c:if test="${tipoLog == 'acesso'}">
    <h1>Relatório de Acessos</h1>
</c:if>
<c:if test="${tipoLog == 'acao'}">
    <h1>Relatório de Ações</h1>
</c:if>


<table width="90%" align="center" cellpadding="10">
    <tr align="center" bgcolor="#CCC">
        <td><strong>ID</strong></td>
        <td><strong>Ação</strong></td>
        <td><strong>Tipo</strong></td>
        <td><strong>Horário da Ação</strong></td>
        <td><strong>Usuário</strong></td>
        <td><strong>Tipo de Usuário</strong></td>
    </tr>
    <c:forEach var="acao" items="${listaAcoes}">
        <tr style="text-align: center;" class="border_bottom">
            <td>${acao.id}</td>
            <td>${acao.acao}</td>
            <td>${acao.tipo}</td>
            <td><fmt:formatDate value="${acao.dataAcao}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
            <td>${acao.usuarioSession.nomeConta}</td>
            <td>${acao.usuarioSession.tipoAcesso}</td>
        </tr>
    </c:forEach>
</table>
</center>

</body>
</html>
