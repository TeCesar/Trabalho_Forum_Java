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

<center>
    <h1 class="titulo">Cadastrar Operador</h1>

    <form method="post" action="controller">
        <input type="hidden" value="cadastro" name="acao">
        <input type="hidden" value="operador" name="tipo">
        <label class="txt">Login: </label><input type="text" name="nomeUsuario" class="campo" required oninvalid="setCustomValidity('O nome do operador e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <input type="submit" value="CADASTRAR OPERADOR" class="btne">
    </form>
</center>

</body>
</html>
