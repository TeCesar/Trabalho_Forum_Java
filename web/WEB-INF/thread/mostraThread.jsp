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
                        <c:when test="${thread.topicoDTO != null}">
                            <input type="hidden" value="${thread.topicoDTO.titulo}" name="titulo">
                            <input type="hidden" value="${thread.topicoDTO.id}" name="id">
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" value="${thread.ticketDTO.titulo}" name="titulo">
                            <input type="hidden" value="${thread.ticketDTO.id}" name="id">
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${conteudoBusca.situacao != 'Fechado'}">
                        <input type="hidden" value="${thread.mensagem}" name="mensagemThread">
                        <input type="hidden" value="${thread.autor}" name="autorThread">
                        <input type="submit" value="Responder ${thread.autor}" class="btne">
                    </c:if>
                    <c:if test="${thread.dataAlteracao != null}">
                        <br><label>Mensagem editada por: ${thread.usuarioEdicao} em <fmt:formatDate value="${thread.dataAlteracao}" pattern="dd/MM/yyyy HH:mm:ss"/></label>
                    </c:if>
                </form>
                <c:if test="${thread.usuarioDTO.tipoAcesso == 'Operador' && usuarioLogado.tipoAcesso == 'Administrador'}">
                    <form method="get" action="controller">
                        <input type="hidden" value="thread" name="acao">
                        <input type="hidden" value="editaMensagemOperador" name="tipo">
                        <input type="hidden" value="${thread.id}" name="idThread">
                        <input type="hidden" value="${conteudoBusca.id}" name="idConteudo">
                        <input type="submit" value="Alterar resposta do Operador">
                    </form>
                </c:if>
                <c:if test="${thread.usuarioDTO.tipoAcesso == 'Operador' && conteudoBusca.usuarioDTO.nomeConta == usuarioLogado.nomeConta && conteudoBusca.situacao != 'Fechado' && tipoAcao == 'ticket'}">
                    <form method="get" action="controller">
                        <input type="hidden" value="ticket" name="acao">
                        <input type="hidden" value="ticketRespondido" name="tipo">
                        <input type="hidden" value="${thread.usuarioDTO.id}" name="idThread">
                        <input type="hidden" value="${conteudoBusca.id}" name="idConteudo">
                        <input type="submit" value="Marcar Ticket resolvido por ${thread.usuarioDTO.nomeConta}">
                    </form>
                </c:if>
            </div>
            <br><br><br>
        </c:forEach>

        <c:choose>
            <c:when test="${conteudoBusca.situacao != 'Fechado'}">
                <form method="get" action="controller">
                    <input type="hidden" value="responderThread" name="acao">
                    <input type="hidden" value="${titulo}" name="titulo">
                    <input type="hidden" value="${id}" name="idPostagem">
                    <input type="submit" value="Responder" class="btne">
                </form>
            </c:when>
            <c:otherwise>
                <c:if test="${conteudoBusca.usuarioDTO.nomeConta == usuarioLogado.nomeConta}">
                    <form method="get" action="controller">
                        <input type="hidden" value="thread" name="acao">
                        <input type="hidden" value="reabrir" name="tipo">
                        <input type="hidden" value="${tipoAcao}" name="tipoAcao">
                        <input type="hidden" value="${conteudoBusca.id}" name="idConteudo">
                        <input type="submit" value="Reabrir Thread">
                    </form>
                </c:if>
            </c:otherwise>
        </c:choose>

    </table>
</center>

</body>
</html>
