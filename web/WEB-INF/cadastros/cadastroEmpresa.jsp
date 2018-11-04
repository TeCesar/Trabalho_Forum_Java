<%--
  Created by IntelliJ IDEA.
  User: Robson Manfroi
  Date: 25/10/2018
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cadastro Empresa</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>


<div id="barra">
    <label>Bem vindo</label>
    <div id="login">
        <a href="../../index.jsp">Sair</a>

    </div>
</div>

<%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
<br><br><br>

<h1 class="titulo">Cadastro de Empresa</h1>

<form method="post" action="controller?acao=cadastroEmpresa">
    <div style="text-align: center">
        <label class="txt">Razão Social: </label><input type="text" name="razaoSocial" class="campo"><br><br>
        <label class="txt">Nome Fantasia: </label><input type="text" name="nomeFantasia" class="campo"><br><br>
        <label class="txt">CNPJ: </label><input type="text" name="cnpj" class="campo"><br><br>
        <label class="txt">Nome da Rua: </label><input type="text" name="empresaNomeRua" class="campo" required><br><br>
        <label class="txt">Número do Endereço: </label><input type="text" name="empresaNumeroEndereco" class="campo"
                                                              required><br><br>
        <label class="txt">Bairro: </label><input type="text" name="empresaBairro" class="campo" required><br><br>
        <label class="txt">Cidade: </label><input type="text" name="empresaCidade" class="campo" required><br><br>
        <label class="txt">UF:</label>
        <select name="empresaUfId" class="campo">
            <option>Selecione uma opção</option>
            <c:forEach var="uf" items="${listaUfs}">
                <c:if test="${uf.sigla != 'N/A'}">
                    <option value="${uf.id}">${uf.sigla}</option>
                </c:if>
            </c:forEach>
        </select>

    </div>
    <br>
    <input type="reset" value="Limpar Campos" class="btns">
    <input type="submit" value="Cadastrar" class="btne">
</form>

</body>
</html>
