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

<center><h1>Listagem de Clientes</center>

<table width="90%" align="center" cellpadding="10">

    <tr align="center" bgcolor="#CCC">
        <td><strong>Nome</strong></td>
        <td><strong>Sobrenome</strong></td>
        <td><strong>Dt Nascimento</strong></td>
        <td><strong>Sexo</strong></td>
        <td><strong>Nome da Rua</strong></td>
        <td><strong>Número da Casa</strong></td>
        <td><strong>Bairro</strong></td>
        <td><strong>Cidade</strong></td>
        <td><strong>Estado</strong></td>
        <td><strong>Empresa</strong></td>
        <td><strong>Nome de Usuário</strong></td>
        <td colspan="2"><strong>Ações</strong></td>
    </tr>


    <c:forEach var="cliente" items="${listaClientes}">
        <tr style="text-align: center;" class="border_bottom">
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
            <td class="abrir"><a href="controller?acao=editarCliente&idCliente=${cliente.id}">Editar</a></td>
            <td class="excluir"><a href="controller?acao=excluirCliente&idCliente=${cliente.id}">Excluir</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
