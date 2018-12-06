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
<c:if test="${usuarioLogado.tipoAcesso == 'Operador'}">
    <%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
</c:if>
<c:if test="${usuarioLogado.tipoAcesso == 'Administrador'}">
    <%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>
</c:if>
<br><br><br><br>

<center>

    <h1>Relatório Clientes por Empresa</h1>
    <c:forEach var="empresa" items="${listaEmpresas}">
        <h3 c>Empresa: ${empresa.nomeFantasia}</h3><br>

        <table width="90%" align="center" cellpadding="10">

            <tr align="center" bgcolor="#CCC">
                <td><strong>Nome</strong></td>
                <td><strong>Sobrenome</strong></td>
                <td><strong>Dt Nascimento</strong></td>
                <td><strong>Sexo</strong></td>
                <td><strong>Rua</strong></td>
                <td><strong>Numero da Moradia</strong></td>
                <td><strong>Bairro</strong></td>
                <td><strong>Cidade</strong></td>
                <td><strong>Estado</strong></td>
            </tr>


            <c:forEach var="cliente" items="${listaClientes}">
                <c:if test="${cliente.empresaDTO.id == empresa.id}">
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
                    </tr>

                </c:if>
            </c:forEach>

        </table>
        <br><br><br>
    </c:forEach>
</center>





</body>
</html>
