<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 02/11/2018
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edicao de Cliente</title>
</head>
<body>

<form>
    <input type="text" name="clienteNomeEdit" required><br><br>
    <input type="text" name="clienteSobrenomeEdit" required><br><br>
    <input type="text" name="clienteDtNascEdit" required><br><br>
    <label>Sexo: </label>
    <input type="radio" name="clienteSexoEdit" value="M" checked="checked">Masculino
    <input type="radio" name="clienteSexoEdit" value="F">Feminino
    <br><br>
    <input type="text" name="clienteNomeRuaEdit" required><br><br>
    <input type="text" name="clienteNumeroCasaEdit" required><br><br>
    <input type="text" name="clienteBairroEdit" required><br><br>
    <input type="text" name="clienteCidadeEdit" required><br><br>
    <c:forEach var="uf" items="${listaUfs}">

    </c:forEach>
</form>

</body>
</html>
