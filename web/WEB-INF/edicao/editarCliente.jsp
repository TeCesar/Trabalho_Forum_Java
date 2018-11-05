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

<form method="post" action="controller?acao=editarCliente" style="text-align: center">
    <input type="hidden" name="idClienteEdit" value="${clienteBusca.id}"/>
    <label>Nome: </label><input type="text" name="nomeClienteEdit" value="${clienteBusca.nome}" required><br><br>
    <label>Sobrenome: </label><input type="text" name="sobrenomeClienteEdit" value="${clienteBusca.sobrenome}" required><br><br>
    <label>Data de Nascimento: </label><input type="text" name="dtNascClienteEdit"
           value="<fmt:formatDate value="${clienteBusca.dtNascimento}" pattern="dd/MM/yyyy" />" required><br><br>
    <label>Sexo: </label>
    <c:choose>
        <c:when test="${clienteBusca.sexo == 'M'}">
            <input type="radio" name="sexoClienteEdit" value="M" checked="checked">Masculino
            <input type="radio" name="sexoClienteEdit" value="F">Feminino
        </c:when>
        <c:when test="${clienteBusca.sexo == 'F'}">
            <input type="radio" name="sexoClienteEdit" value="M">Masculino
            <input type="radio" name="sexoClienteEdit" value="F" checked="checked">Feminino
        </c:when>
    </c:choose>
    <br><br>
    <input type="hidden" name="idEnderecoClienteEdit" value="${clienteBusca.enderecoDTO.id}"/>
    <label>Rua: </label><input type="text" name="nomeRuaClienteEdit" value="${clienteBusca.enderecoDTO.rua}" required><br><br>
    <label>Numero: </label><input type="text" name="numeroCasaClienteEdit" value="${clienteBusca.enderecoDTO.numeroEndereco}" required><br><br>
    <label>Bairro: </label><input type="text" name="bairroClienteEdit" value="${clienteBusca.enderecoDTO.bairro}" required><br><br>
    <label>Cidade: </label><input type="text" name="cidadeClienteEdit" value="${clienteBusca.enderecoDTO.cidade}" required><br><br>
    <label>Uf: </label>
    <select name="idUfClienteEdit">
        <option value="${clienteBusca.enderecoDTO.ufDTO.id}">${clienteBusca.enderecoDTO.ufDTO.sigla}</option>
        <c:forEach var="uf" items="${listaUfs}">
            <c:if test="${uf.id != clienteBusca.enderecoDTO.ufDTO.id && uf.sigla != 'N/A'}">
                <option value="${uf.id}">${uf.sigla}</option>
            </c:if>
        </c:forEach>
    </select>
    <br><br>
    <label>Empresa: </label>
    <select name="idEmpresaClienteEdit">
        <option value="${clienteBusca.empresaDTO.id}">${clienteBusca.empresaDTO.nomeFantasia}</option>
        <c:forEach var="empresa" items="${listaEmpresas}">
            <c:if test="${empresa.id != clienteBusca.empresaDTO.id}">
                <option value="${empresa.id}">${empresa.nomeFantasia}</option>
            </c:if>
        </c:forEach>
    </select>

    <input type="hidden" name="idUsuarioClienteEdit" value="${clienteBusca.usuarioDTO.id}"><br><br>
    <label>Nome de Usuario: </label><input type="text" name="nomeContaUsuarioClienteEdit" value="${clienteBusca.usuarioDTO.nomeConta}">
    <input type="hidden" name="nomeContaUsuarioAntigoClienteEdit" value="${clienteBusca.usuarioDTO.nomeConta}"><br><br>
    <label>Senha: </label><input type="text" name="senhaUsuarioClienteEdit" value="${clienteBusca.usuarioDTO.senha}"><br><br>
    <input type="hidden" name="senhaUsuarioAntigoClienteEdit" value="${clienteBusca.usuarioDTO.senha}">
    <input type="submit" value="Salvar Alterações">

</form>

</body>
</html>
