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
<br><br><br>
<center>

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


    <div class="listarTopicos">

        <form method="post" action="controller?acao=respostaPostagemThread">
            <input type="hidden" value="${id}" name="id">
            <c:if test="${tt == 'topico'}">
                <input type="hidden" name="tipo" value="topico">
                <label>Titulo do Tópico: ${titulo}</label><br>
            </c:if>
            <c:if test="${tt == 'ticket'}">
                <input type="hidden" name="tipo" value="ticket">
                <label>Titulo do Ticket: ${titulo}</label><br>
            </c:if>

            <c:choose>
                <c:when test="${autor != null}">
                    <label>Respondendo a mensagem de: ${autor}</label><br><br>
                    <label>Mensagem: ${mensagem}</label><br><br>
                    <label>Resposta: <input type="text" value="@${autor}" name="mensagemResposta"></label>
                </c:when>
                <c:otherwise>
                    <br>
                    <label>Resposta: <input type="text" name="mensagemResposta"></label><br>
                </c:otherwise>
            </c:choose>
            <br><br>
            <input type="submit" value="Enviar Resposta" class="btne">
        </form>
    </div>
</center>
</body>
</html>
