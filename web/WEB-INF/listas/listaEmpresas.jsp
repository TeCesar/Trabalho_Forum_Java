<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 30/10/2018
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Listagem de Empresas</title>
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

<table>
    <tr>
        <th>Nome</th>
        <th>CNPJ</th>
        <th>Razão Social</th>
        <th>Rua</th>
        <th>Numero do Endereço</th>
        <th>Bairro</th>
        <th>Cidade</th>
        <th>Estado</th>
        <th colspan="2">Ação</th>
    </tr>

    <c:forEach var="empresa" items="${listaEmpresas}">
        <c:if test="${empresa.nomeFantasia != 'N/A'}">
            <tr>
                <td>${empresa.nomeFantasia}</td>
                <td>${empresa.cnpj}</td>
                <td>${empresa.razaoSocial}</td>
                <td>${empresa.enderecoDTO.rua}</td>
                <td>${empresa.enderecoDTO.numeroEndereco}</td>
                <td>${empresa.enderecoDTO.bairro}</td>
                <td>${empresa.enderecoDTO.cidade}</td>
                <td>${empresa.enderecoDTO.ufDTO.sigla}</td>
                <td><a href="controller?acao=editarEmpresa&idEmpresa=${empresa.id}">Editar</a></td>
                <td><a href="controller?acao=excluirEmpresa&idEmpresa=${empresa.id}">Excluir</a></td>
            </tr>
        </c:if>
    </c:forEach>
</table>

</body>
</html>
