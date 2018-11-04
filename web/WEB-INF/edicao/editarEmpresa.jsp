<%@ page import="br.edu.java.poo.model.empresa.EmpresaDTO" %>
<%@ page import="br.edu.java.poo.model.endereco.UfDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 30/10/2018
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edição de Empresa</title>
</head>
<body>

<form action="controller?acao=editarEmpresa" method="post">
    <input type="hidden" name="idEmpresaEdit" value="${empresaBusca.id}">
    <input type="text" name="nomeEmpresaEdit" value="${empresaBusca.nomeFantasia}"><br><br>
    <input type="text" name="cnpjEmpresaEdit" value="${empresaBusca.cnpj}"><br><br>
    <input type="text" name="razaoSocialEmpresaEdit" value="${empresaBusca.razaoSocial}"><br><br>
    <input type="hidden" name="enderecoIdEmpresaEdit" value="${empresaBusca.enderecoDTO.id}">
    <input type="text" name="ruaEmpresaEdit" value="${empresaBusca.enderecoDTO.rua}"><br><br>
    <input type="text" name="numeroEmpresaEdit" value="${empresaBusca.enderecoDTO.numeroEndereco}"><br><br>
    <input type="text" name="bairroEmpresaEdit" value="${empresaBusca.enderecoDTO.bairro}"><br><br>
    <input type="text" name="cidadeEmpresaEdit" value="${empresaBusca.enderecoDTO.cidade}"><br><br>
    <select name="ufIdEmpresaEdit">
        <option value="${empresaBusca.enderecoDTO.ufDTO.id}">${empresaBusca.enderecoDTO.ufDTO.sigla}</option>
        <c:forEach var="uf" items="${listaUfs}">
            <c:if test="${uf.id != empresaBusca.enderecoDTO.ufDTO.id && uf.sigla != 'N/A'}">
                <option value="${uf.id}">${uf.sigla}</option>
            </c:if>
        </c:forEach>
    </select><br><br>
    <input type="submit" value="Editar">
</form>

</body>
</html>
