<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 05/12/2018
  Time: 09:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Alteração de Mensagem de Operador</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>
<%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>

<form method="post" action="controller">
    <div class="listarTopicos" ">
        <input type="hidden" value="thread" name="acao">
        <input type="hidden" value="alterarMensagem" name="tipo">
        <input type="hidden" value="${threadBusca.id}" name="idThread">
        <input type="text" value="${threadBusca.mensagem}" name="mensagemThread" style="width: 500px;"><br><br>
        <input type="submit" value="Alterar Mensagem" class="btne">
    </div>
</form>

</body>
</html>
