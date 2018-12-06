<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 11/11/2018
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tickets sem Resposta por Cliente</title>
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
<br><br><br><br>



</body>
</html>
