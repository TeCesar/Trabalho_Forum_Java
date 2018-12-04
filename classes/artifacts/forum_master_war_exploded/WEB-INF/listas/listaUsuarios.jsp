<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 04/12/2018
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Listagem de Usuários</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>

</head>
<body>
<c:if test="${usuarioLogado.tipoAcesso == 'Operador'}">
    <%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
</c:if>
<c:if test="${usuarioLogado.tipoAcesso == 'Administrador'}">
    <%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>
</c:if>
<br><br><br><br><br><br>

<center>
    <table width="90%" align="center" cellpadding="10">
        <tr align="center" bgcolor="#CCC">
            <td><strong>ID</strong></td>
            <td><strong>Login</strong></td>
            <td><strong>Tipo de Acesso</strong></td>
            <td><strong>Data de Cadastro</strong></td>
            <td><strong>Última Alteração</strong></td>
            <td><strong>Apelido</strong></td>
            <td><strong>Erros de Login</strong></td>
            <td><strong>Tickets Resolvidos</strong></td>
            <td><strong>Situação</strong></td>
            <c:if test="${usuarioLogado.tipoAcesso == 'Administrador'}">
                <td><strong>Ações</strong></td>
            </c:if>
        </tr>
        <c:forEach var="usuario" items="${listaUsuarios}">
            <tr style="text-align: center;" class="border_bottom">
                <td>${usuario.id}</td>
                <td>${usuario.nomeConta}</td>
                <td>${usuario.tipoAcesso}</td>
                <td><fmt:formatDate value="${usuario.dataDeCadastro}" pattern="dd/MM/yyyy"/></td>
                <td><fmt:formatDate value="${usuario.dataDeAlteracao}" pattern="dd/MM/yyyy"/></td>
                <td>${usuario.apelido}</td>
                <td>${usuario.errosLogin}</td>
                <td>${usuario.ticketsResolvidos}</td>
                <c:if test="${usuario.bloqueado == 0}">
                    <td>Ativo</td>
                </c:if>
                <c:if test="${usuario.bloqueado == 1}">
                    <td>Bloqueado</td>
                </c:if>
                <c:if test="${usuarioLogado.tipoAcesso == 'Administrador'}">
                    <c:if test="${usuario.bloqueado == 0}">
                        <td class="excluir"><a href="controller?acao=usuario&tipo=bloquearUsuario&id=${usuario.id}">Bloquear Usuário</a>
                        </td>
                    </c:if>
                    <c:if test="${usuario.bloqueado == 1}">
                        <td class="abrir"><a href="controller?acao=usuario&tipo=bloquearUsuario&id=${usuario.id}">Desbloquear
                            Usuário</a></td>
                    </c:if>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</center>
</body>
</html>
