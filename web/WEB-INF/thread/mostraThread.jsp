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
    <title></title>
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

<table>
    <c:forEach var="thread" items="${listaThread}">
        Autor: ${thread.autor}<br>
        Mensagem: ${thread.mensagem}<br>
        Data: <fmt:formatDate value="${thread.dataPostagem}" pattern="dd/MM/yyyy HH:mm:ss"/><br><br><br>
    </c:forEach>
</table>

</body>
</html>
