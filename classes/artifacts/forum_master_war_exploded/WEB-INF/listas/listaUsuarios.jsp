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
<table>
    <tr>
        <th>ID</th>
        <th>Login</th>
        <th>Tipo de Acesso</th>
        <th>Data de Cadastro</th>
        <th>Última Alteração</th>
        <th>Apelido</th>
        <th>Erros de Login</th>
        <th>Tickets Resolvidos</th>
        <c:if test="${usuarioLogado.tipoAcesso == 'Administrador'}">
            <th>Ação</th>
        </c:if>
    </tr>
    <c:forEach var="usuario" items="${listaUsuarios}">
        <tr>
            <td>${usuario.id}</td>
            <td>${usuario.nomeConta}</td>
            <td>${usuario.tipoAcesso}</td>
            <td><fmt:formatDate value="${usuario.dataDeCadastro}" pattern="dd/MM/yyyy"/></td>
            <td><fmt:formatDate value="${usuario.dataDeAlteracao}" pattern="dd/MM/yyyy"/></td>
            <td>${usuario.apelido}</td>
            <td>${usuario.errosLogin}</td>
            <td>${usuario.ticketsResolvidos}</td>
            <c:if test="${usuarioLogado.tipoAcesso == 'Administrador'}">
                <td>Bloquear Usuário</td>
            </c:if>
        </tr>
    </c:forEach>
</table>
</center>
</body>
</html>
