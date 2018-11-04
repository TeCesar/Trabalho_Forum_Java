<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 24/10/2018
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cadastro de Cliente</title>

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

<h1 class="titulo">Cadastro de Cliente</h1>

<form method="post" action="controller?acao=cadastroCliente">
    <div style="text-align: center">

        <label class="txt">Nome: </label><input type="text" name="clienteNome" class="campo" required><br><br>
        <label class="txt">Sobrenome: </label><input type="text" name="clienteSobrenome" class="campo" required><br><br>
        <label class="txt">Dt. Nascimento: </label><input type="text" name="clienteDtNasc" class="campo"
                                                          required><br><br>
        <label>Sexo: </label>
        <input type="radio" name="clienteSexo" value="M" checked="checked">Masculino
        <input type="radio" name="clienteSexo" value="F">Feminino
        <br><br>
        <label class="txt">Nome da Rua: </label><input type="text" name="clienteNomeRua" class="campo" required><br><br>
        <label class="txt">Número da Casa: </label><input type="text" name="clienteNumeroCasa" class="campo"
                                                          required><br><br>
        <label class="txt">Bairro: </label><input type="text" name="clienteBairro" class="campo" required><br><br>
        <label class="txt">Cidade: </label><input type="text" name="clienteCidade" class="campo" required><br><br>
        <label class="txt">UF:</label>
        <select name="clienteUfId" class="campo">
            <option>Selecione uma opção</option>
            <c:forEach var="uf" items="${listaUfs}">
                <c:if test="${uf.sigla != 'N/A'}">
                    <option value="${uf.id}">${uf.sigla}</option>
                </c:if>
            </c:forEach>
        </select>
        <br><br>
        <label class="txt">Selecione uma empresa: </label>
        <select name="clienteEmpresaId" class="campo">
            <option>Selecione uma Opção</option>
            <c:forEach var="empresa" items="${listaEmpresas}">
                <option value="${empresa.id}">${empresa.nomeFantasia}</option>
            </c:forEach>
        </select>
        <br><br>
        <label class="txt">Nome de Usuário:</label><input type="text" name="clienteNomeUsuario" class="campo"
                                                          required><br><br>
    </div>
    <input type="reset" value="Limpar Campos" class="btns">
    <input type="submit" value="Cadastrar" class="btne">
</form>

    <a href="controller?acao=cadastroEmpresa"><h5>Cadastrar nova empresa</h5></a>

</body>
</html>
