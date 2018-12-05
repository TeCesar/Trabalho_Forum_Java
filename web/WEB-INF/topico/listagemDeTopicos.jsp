<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 13/11/2018
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Listagem de Tópicos</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>
<br><br><br>
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

<table width="90%" align="center" cellpadding="10">
    <tr align="center" bgcolor="#CCC">
        <td><strong>Titulo</strong></td>
        <td><strong>Autor</strong></td>
        <td><strong>Situação</strong></td>
        <td colspan="2">Ações</td>
    </tr>
    <c:forEach var="topico" items="${listaTopicos}">
        <tr style="text-align: center;" class="border_bottom">
            <td>${topico.titulo}</td>
            <td>${topico.usuarioDTO.nomeConta}</td>
            <c:if test="${topico.situacao == 'Aberto'}">
                <td style="background-color: #F08080;">${topico.situacao}</td>
            </c:if>
            <c:if test="${topico.situacao == 'Fechado'}">
                <td style="background-color: #90EE90">${topico.situacao}</td>
            </c:if>
            <c:choose>
                <c:when test="${topico.usuarioDTO.nomeConta == usuarioLogado.nomeConta && topico.situacao == 'Aberto'}">
                    <td class="linkCor"><a
                            href="controller?acao=topico&tipo=mostrarTopico&id=${topico.id}&tt=topico&titulo=${topico.titulo}">Abrir</a>
                    </td>
                    <td class="linkCor"><a
                            href="controller?acao=thread&tipo=fecharTopico&id=${topico.id}">Finalizar Topico</a>
                    </td>
                </c:when>
                <c:otherwise>
                    <td class="linkCor" colspan="2"><a
                            href="controller?acao=topico&tipo=mostrarTopico&id=${topico.id}&tt=topico&titulo=${topico.titulo}">Abrir</a>
                    </td>
                </c:otherwise>
            </c:choose>
        </tr>
    </c:forEach>
</table>

</body>
</html>
