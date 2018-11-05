<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 30/10/2018
  Time: 01:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Listagem de Clientes</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>

<%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
<br><br><br>
<table>
    <tr>
        <th>Nome</th>
        <th>Sobrenome</th>
        <th>Data de Nascimento</th>
        <th>Sexo</th>
        <th>Nome da Rua</th>
        <th>Número da Casa</th>
        <th>Bairro</th>
        <th>Cidade</th>
        <th>Estado</th>
        <th>Empresa</th>
        <th>Nome de Usuário</th>
        <th colspan="2">Ações</th>
    </tr>

    <c:forEach var="cliente" items="${listaClientes}">
        <tr>
            <td>${cliente.nome}</td>
            <td>${cliente.sobrenome}</td>
            <td><fmt:formatDate value="${cliente.dtNascimento}" pattern="dd/MM/yyyy"/></td>
            <td>${cliente.sexo}</td>
            <td>${cliente.enderecoDTO.rua}</td>
            <td>${cliente.enderecoDTO.numeroEndereco}</td>
            <td>${cliente.enderecoDTO.bairro}</td>
            <td>${cliente.enderecoDTO.cidade}</td>
            <td>${cliente.enderecoDTO.ufDTO.sigla}</td>
            <td>${cliente.empresaDTO.nomeFantasia}</td>
            <td>${cliente.usuarioDTO.nomeConta}</td>
            <td><a href="controller?acao=editarCliente&idCliente=${cliente.id}">Editar</a></td>
            <td><a href="controller?acao=excluirCliente&idCliente=${cliente.id}">Excluir</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
