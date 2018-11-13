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
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>

<%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
<br><br><br>
<div style="text-align: center">
<h1 class="titulo">Editar Empresa</h1>
<form action="controller?acao=editarEmpresa" method="post">

        <input class="campo" type="hidden" name="idEmpresaEdit" value="${empresaBusca.id}">
    <label class="txt">Nome Fantasia: </label><input class="campo" type="text" name="nomeEmpresaEdit" value="${empresaBusca.nomeFantasia}"><br><br>
    <label class="txt">CNPJ: </label><input class="campo" type="text" name="cnpjEmpresaEdit" value="${empresaBusca.cnpj}"><br><br>
    <label class="txt">Razão Social: </label> <input class="campo" type="text" name="razaoSocialEmpresaEdit" value="${empresaBusca.razaoSocial}"><br><br>
        <input class="campo" type="hidden" name="enderecoIdEmpresaEdit" value="${empresaBusca.enderecoDTO.id}">
    <label class="txt">Nome da Rua: </label><input class="campo" type="text" name="ruaEmpresaEdit" value="${empresaBusca.enderecoDTO.rua}"><br><br>
    <label class="txt">Número do Endereço: </label><input class="campo" type="text" name="numeroEmpresaEdit" value="${empresaBusca.enderecoDTO.numeroEndereco}"><br><br>
    <label class="txt">Bairro: </label><input class="campo" type="text" name="bairroEmpresaEdit" value="${empresaBusca.enderecoDTO.bairro}"><br><br>
    <label class="txt">Cidade: </label><input class="campo" type="text" name="cidadeEmpresaEdit" value="${empresaBusca.enderecoDTO.cidade}"><br><br>
    <label class="txt">UF:</label>
        <select name="ufIdEmpresaEdit" class="campo">
            <option value="${empresaBusca.enderecoDTO.ufDTO.id}">${empresaBusca.enderecoDTO.ufDTO.sigla}</option>
            <c:forEach var="uf" items="${listaUfs}">
                <c:if test="${uf.id != empresaBusca.enderecoDTO.ufDTO.id && uf.sigla != 'N/A'}">
                    <option value="${uf.id}">${uf.sigla}</option>
                </c:if>
            </c:forEach>
        </select><br><br>
        <input type="submit" value="Salvar Alterações" class="btne">
    </div>
</form>

</body>
</html>
