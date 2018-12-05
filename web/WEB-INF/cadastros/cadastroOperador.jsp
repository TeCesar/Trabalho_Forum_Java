<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 04/12/2018
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cadastro de Operador</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>
<%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>
<br><br><br>
<form method="post" action="controller">
    <input type="hidden" value="cadastro" name="acao">
    <input type="hidden" value="operador" name="tipo">
    <input type="text" name="nomeUsuario">
    <input type="submit" value="CADASTRAR OPERADOR">
</form>

</body>
</html>
