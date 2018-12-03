<%--
  Created by IntelliJ IDEA.
  User: Robson Manfroi
  Date: 18/10/2018
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>DKRT Fórum</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>
<c:choose>
    <c:when test="${usuarioLogado.tipoAcesso == 'Administrador'}">
        <%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>
    </c:when>
    <c:when test="${usuarioLogado.tipoAcesso == 'Operador'}">
        <%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
    </c:when>
    <c:when test="${usuarioLogado.tipoAcesso == 'Cliente'}">
        <%@include file="/WEB-INF/navbar/navbarCliente.jsp" %>
    </c:when>
    <c:when test="${usuarioLogado.tipoAcesso == 'Usuario'}">
        <%@include file="/WEB-INF/navbar/navbarUsuario.jsp" %>
    </c:when>
</c:choose>
</body>
</html>
