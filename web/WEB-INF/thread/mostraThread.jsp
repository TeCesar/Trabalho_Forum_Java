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
<c:if test="${usuarioLogado.tipoAcesso == 'Operador'}">
    <%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
</c:if>
<c:if test="${usuarioLogado.tipoAcesso == 'Cliente'}">
    <%@include file="/WEB-INF/navbar/navbarCliente.jsp" %>
</c:if>
<c:if test="${usuarioLogado.tipoAcesso == 'Administrador'}">
    <%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>
</c:if>
<c:if test="${usuarioLogado.tipoAcesso == 'Usuario'}">
    <%@include file="/WEB-INF/navbar/navbarUsuario.jsp" %>
</c:if>
<center>
<h1>${titulo}</h1>

<table>
    <c:forEach var="thread" items="${listaThread}">

       <div class="listarTopicos">

        Mensagem: ${thread.mensagem}<br>
        <c:choose>
            <c:when test="${thread.usuarioDTO.tipoAcesso == 'Administrador'}">
                Autor: <label style="color:darkgreen;">${thread.autor}(Admin)</label><br>
            </c:when>
            <c:when test="${thread.usuarioDTO.tipoAcesso == 'Operador'}">
                Autor: <label style="color:darkblue;">${thread.autor}(OP)</label><br>
            </c:when>
            <c:when test="${thread.usuarioDTO.tipoAcesso == 'Usuario'}">
                Autor: <label style="color:darkred;">${thread.autor}(User)</label><br>
            </c:when>
            <c:when test="${thread.usuarioDTO.tipoAcesso == 'Cliente'}">
                Autor: <label style="color:darkorange;">${thread.autor}(Cliente)</label><br>
            </c:when>
        </c:choose>
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
            <input type="submit" value="Responder ${thread.autor}" class="btne">
        </form>
       </div>
        <br><br><br>
    </c:forEach>
    <form method="get" action="controller">
        <input type="hidden" value="responderThread" name="acao">
        <input type="hidden" value="${titulo}" name="titulo">
        <input type="hidden" value="${id}" name="idPostagem">
        <input type="submit" value="Responder" class="btne">
    </form>

</table>
</center>

</body>
</html>
