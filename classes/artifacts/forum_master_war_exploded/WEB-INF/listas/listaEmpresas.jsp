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

<%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
<br><br><br>
<center><h1>Listagem de Empresas</h1></center>

<table width="90%" align="center" cellpadding="10">

    <tr align="center" bgcolor="#CCC">
        <td><strong>Nome</strong></td>
        <td><strong>CNPJ</strong></td>
        <td><strong>Razão Social</strong></td>
        <td><strong>Rua</strong></td>
        <td><strong>Número do Endereço</strong></td>
        <td><strong>Bairro</strong></td>
        <td><strong>Cidade</strong></td>
        <td><strong>Estado</strong></td>
        <td colspan="2"><strong>Ações</strong></td>
    </tr>


    <c:forEach var="empresa" items="${listaEmpresas}">
        <c:if test="${empresa.nomeFantasia != 'N/A'}">
            <tr style="text-align: center;" class="border_bottom">
                <td>${empresa.nomeFantasia}</td>
                <td>${empresa.cnpj}</td>
                <td>${empresa.razaoSocial}</td>
                <td>${empresa.enderecoDTO.rua}</td>
                <td>${empresa.enderecoDTO.numeroEndereco}</td>
                <td>${empresa.enderecoDTO.bairro}</td>
                <td>${empresa.enderecoDTO.cidade}</td>
                <td>${empresa.enderecoDTO.ufDTO.sigla}</td>
                <td class="abrir"><a href="controller?acao=editarEmpresa&idEmpresa=${empresa.id}">Editar</a></td>
                <td class="excluir"><a href="controller?acao=excluirEmpresa&idEmpresa=${empresa.id}">Excluir</a></td>
            </tr>
        </c:if>
    </c:forEach>
</table>

</body>
</html>
