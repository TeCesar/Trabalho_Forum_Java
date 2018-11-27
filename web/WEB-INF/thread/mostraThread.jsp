<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 14/11/2018
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${titulo}</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    </style>
</head>
<body>
<c:if test="${usuario.tipoAcesso == 'Operador'}">
    <%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
</c:if>
<c:if test="${usuario.tipoAcesso == 'Cliente'}">
    <%@include file="/WEB-INF/navbar/navbarCliente.jsp" %>
</c:if>
<c:if test="${usuario.tipoAcesso == 'Administrador'}">
    <%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>
</c:if>
<c:if test="${usuario.tipoAcesso == 'Usuario'}">
    <%@include file="/WEB-INF/navbar/navbarUsuario.jsp" %>
</c:if>
<center>
<h1>${titulo}</h1>

<table>
    <c:forEach var="thread" items="${listaThread}">
        Autor: ${thread.autor}<br>
        Mensagem: ${thread.mensagem}<br>
        Data: <fmt:formatDate value="${thread.dataPostagem}" pattern="dd/MM/yyyy HH:mm:ss"/><br>
        <form method="get" action="controller">
            <input type="hidden" value="responderPostagemThread" name="acao">
            <c:choose>
                <c:when test="${thread.topicoDTO.titulo != null}">
                    <input type="hidden" value="${thread.topicoDTO.titulo}" name="titulo">
                    <input type="hidden" value="${thread.topicoDTO.id}" name="id">
                </c:when>
                <c:otherwise>
                    <input type="hidden" value="${thread.ticketDTO.titulo}" name="titulo">
                    <input type="hidden" value="${thread.ticketDTO.id}" name="id">
                </c:otherwise>
            </c:choose>
            <input type="hidden" value="${thread.mensagem}" name="mensagemThread">
            <input type="hidden" value="${thread.autor}" name="autorThread">
            <input type="submit" value="Responder ${thread.autor}">
        </form>
        <br><br><br>
    </c:forEach>
    <form method="get" action="controller">
        <input type="hidden" value="responderThread" name="acao">
        <input type="hidden" value="${titulo}" name="titulo">
        <input type="hidden" value="${id}" name="idPostagem">
        <input type="submit" value="Responder">
    </form>

</table>
</center>

</body>
</html>
