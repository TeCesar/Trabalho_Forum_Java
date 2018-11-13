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

<table>
    <tr>
        <th>Titulo</th>
        <th>Mensagem</th>
        <th>Autor</th>
        <th colspan="2">Ações</th>
    </tr>
    <c:forEach var="topico" items="${listaTopicos}">
        <tr>
            <td>${topico.titulo}</td>
            <td>${topico.mensagem}</td>
            <td>${usuario.nomeConta}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
