<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 05/11/2018
  Time: 09:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Relatório Clientes por Empresa</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>

<%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
<br><br><br><br>

<c:forEach var="empresa" items="${listaEmpresas}">
    <label>Empresa: ${empresa.nomeFantasia}</label><br>
    <table>
        <tr>
            <th>Nome</th>
            <th>Sobrenome</th>
            <th>Dt Nascimento</th>
            <th>Sexo</th>
            <th>Rua</th>
            <th>Numero da Moradia</th>
            <th>Bairro</th>
            <th>Cidade</th>
            <th>Estado</th>
        </tr>
        <c:forEach var="cliente" items="${listaClientes}">
            <c:if test="${cliente.empresaDTO.id == empresa.id}">
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
                </tr>

            </c:if>
        </c:forEach>
    </table>
    <br><br><br>
</c:forEach>

</body>
</html>
