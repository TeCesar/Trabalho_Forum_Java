<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 02/11/2018
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Edicao de Cliente</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>

<%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
<br><br><br>
<h1 class="titulo">Editar Cliente</h1>
<form method="post" action="controller?acao=editarCliente">
    <div style="text-align: center">
        <input class="campo" type="hidden" name="idCliente" value="${clienteBusca.id}"/>
        <label class="txt">Nome: </label><input class="campo" type="text" name="nomeCliente" value="${clienteBusca.nome}" required><br><br>
        <label class="txt">Sobrenome: </label><input class="campo" type="text" name="sobrenomeCliente" value="${clienteBusca.sobrenome}" required><br><br>
        <label class="txt">Data de Nascimento: </label><input class="campo" type="text" name="dtNascCliente"
               value="<fmt:formatDate value="${clienteBusca.dtNascimento}" pattern="dd/MM/yyyy" />" required><br><br>
        <label>Sexo: </label>
        <c:choose>
            <c:when test="${clienteBusca.sexo == 'M'}">
                <input type="radio" name="sexoCliente" value="M" checked="checked">Masculino
                <input type="radio" name="sexoCliente" value="F">Feminino
            </c:when>
            <c:when test="${clienteBusca.sexo == 'F'}">
                <input class="campo" type="radio" name="sexoCliente" value="M">Masculino
                <input class="campo" type="radio" name="sexoCliente" value="F" checked="checked">Feminino
            </c:when>
        </c:choose>
        <br><br>
        <input class="campo" type="hidden" name="idEnderecoCliente" value="${clienteBusca.enderecoDTO.id}"/>
        <label class="txt">Rua: </label><input class="campo" type="text" name="nomeRuaCliente" value="${clienteBusca.enderecoDTO.rua}" required><br><br>
        <label class="txt">Numero: </label><input class="campo" type="text" name="numeroCasaCliente" value="${clienteBusca.enderecoDTO.numeroEndereco}" required><br><br>
        <label class="txt">Bairro: </label><input class="campo" type="text" name="bairroCliente" value="${clienteBusca.enderecoDTO.bairro}" required><br><br>
        <label class="txt">Cidade: </label><input class="campo" type="text" name="cidadeCliente" value="${clienteBusca.enderecoDTO.cidade}" required><br><br>
        <label class="txt">Uf: </label>
        <select name="idUfCliente" class="campo">
            <option value="${clienteBusca.enderecoDTO.ufDTO.id}">${clienteBusca.enderecoDTO.ufDTO.sigla}</option>
            <c:forEach var="uf" items="${listaUfs}">
                <c:if test="${uf.id != clienteBusca.enderecoDTO.ufDTO.id && uf.sigla != 'N/A'}">
                    <option value="${uf.id}">${uf.sigla}</option>
                </c:if>
            </c:forEach>
        </select>
        <br><br>
        <label class="txt">Empresa: </label>
        <select name="idEmpresaCliente" class="campo">
            <option value="${clienteBusca.empresaDTO.id}">${clienteBusca.empresaDTO.nomeFantasia}</option>
            <c:forEach var="empresa" items="${listaEmpresas}">
                <c:if test="${empresa.id != clienteBusca.empresaDTO.id}">
                    <option value="${empresa.id}">${empresa.nomeFantasia}</option>
                </c:if>
            </c:forEach>
        </select>

        <input class="campo" type="hidden" name="idUsuarioCliente" value="${clienteBusca.usuarioDTO.id}"><br><br>
        <label class="txt">Nome de Usuario: </label><input class="campo" type="text" name="nomeContaUsuarioCliente" value="${clienteBusca.usuarioDTO.nomeConta}">
        <input class="campo" type="hidden" name="nomeContaUsuarioAntigoCliente" value="${clienteBusca.usuarioDTO.nomeConta}"><br><br>
        <label class="txt">Senha: </label><input class="campo" type="text" name="senhaUsuarioCliente" value="${clienteBusca.usuarioDTO.senha}"><br><br>
        <input class="campo" type="hidden" name="senhaUsuarioAntigoCliente" value="${clienteBusca.usuarioDTO.senha}">
        <input class="btne" type="submit" value="Salvar Alterações">
    </div>
</form>

</body>
</html>
