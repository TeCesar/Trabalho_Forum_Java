<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 17/11/2018
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${titulo}</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<form method="post" action="controller?acao=respostaPostagemThread">
    <input type="hidden" value="${id}" name="idPostagem">
    <c:if test="${tt == 'topico'}">
        <input type="hidden" name="tipo" value="topico">
        <label>Titulo do Tópico: ${titulo}</label><br>
    </c:if>
    <c:if test="${tt == 'ticket'}">
        <input type="hidden" name="tipo" value="ticket">
        <label>Titulo do Ticket: ${titulo}</label><br>
    </c:if>

    <c:if test="${autor != null}">
        <label>Respondendo a pergunta de: ${autor}</label><br>
    </c:if>
    <label>Resposta: <input type="text" value="@${autor}" name="mensagemResposta"></label>
    <input type="submit" value="Enviar Resposta">
</form>

</body>
</html>