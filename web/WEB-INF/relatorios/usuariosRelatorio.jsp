<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 05/11/2018
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Lista de Usuários</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>

<%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
<br><br><br><br>

<table>
    <tr>
        <th>Nome de Usuário</th>
        <th>Data de Cadastro</th>
        <th>Ultima Alteração</th>
        <th>Apelido</th>
        <th>Quantidade de Erros de Login</th>
    </tr>

    <c:forEach var="usuario" items="${listaUsuarios}">
        <tr>
            <td>${usuario.nomeConta}</td>
            <td><fmt:formatDate value="${usuario.dataDeCadastro}" pattern="dd/MM/yyyy"/></td>
            <td><fmt:formatDate value="${usuario.dataDeAlteracao}" pattern="dd/MM/yyyy"/></td>
            <td>${usuario.usuarioApelido}</td>
            <td>${usuario.errosLogin}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
