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
</head>
<body>

<form>
    <input type="hidden" name="idClienteEdit" value="${clienteBusca.id}"/>
    <input type="text" name="nomeClienteEdit" value="${clienteBusca.nome}" required><br><br>
    <input type="text" name="sobrenomeClienteEdit" value="${clienteBusca.sobrenome}" required><br><br>
    <input type="text" name="dtNascClienteEdit"
           value="<fmt:formatDate value="${clienteBusca.dtNascimento}" pattern="dd/MM/yyyy" />" required><br><br>
    <label>Sexo: </label>
    <input type="radio" name="sexoClienteEdit" value="M" checked="checked">Masculino
    <input type="radio" name="sexoClienteEdit" value="F">Feminino
    <br><br>
    <input type="hidden" name="idEnderecoClienteEdit" value="${clienteBusca.enderecoDTO.id}"/>
    <input type="text" name="nomeRuaClienteEdit" value="${clienteBusca.enderecoDTO.rua}" required><br><br>
    <input type="text" name="numeroCasaClienteEdit" value="${clienteBusca.enderecoDTO.numeroEndereco}" required><br><br>
    <input type="text" name="bairroClienteEdit" value="${clienteBusca.enderecoDTO.bairro}" required><br><br>
    <input type="text" name="cidadeClienteEdit" value="${clienteBusca.enderecoDTO.cidade}" required><br><br>
    <select name="idUfClienteEdit">
        <option value="${clienteBusca.enderecoDTO.ufDTO.id}">${clienteBusca.enderecoDTO.ufDTO.sigla}</option>
        <c:forEach var="uf" items="${listaUfs}">
            <c:if test="${uf.id != clienteBusca.enderecoDTO.ufDTO.id}">
                <option value="${uf.id}">${uf.sigla}</option>
            </c:if>
        </c:forEach>
    </select>
    <br><br>
    <select name="idEmpresaClienteEdit">
        <option value="${clienteBusca.empresaDTO.id}">${clienteBusca.empresaDTO.nomeFantasia}</option>
        <c:forEach var="empresa" items="${listaEmpresas}">
            <c:if test="${empresa.id != clienteBusca.empresaDTO.id}">
                <option value="${empresa.id}">${empresa.nomeFantasia}</option>
            </c:if>
        </c:forEach>
    </select>

    <input type="hidden" name="idUsuarioClienteEdit" value="${clienteBusca.usuarioDTO.id}"><br><br>
    <input type="text" name="nomeContaUsuarioClienteEdit" value="${clienteBusca.usuarioDTO.nomeConta}"><br><br>
    <input type="hidden" name="nomeContaUsuarioAntigoClienteEdit" value="${clienteBusca.usuarioDTO.nomeConta}"><br><br>
    <input type="text" name="senhaUsuarioClienteEdit" value="${clienteBusca.usuarioDTO.senha}"><br><br>
    <input type="hidden" name="senhaUsuarioAntigoClienteEdit" value="${clienteBusca.usuarioDTO.senha}"><br><br>

</form>

</body>
</html>
