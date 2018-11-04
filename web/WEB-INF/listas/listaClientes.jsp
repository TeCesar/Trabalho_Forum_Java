<%@ page import="br.edu.java.poo.model.cliente.ClienteDTO" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %><%--
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
</head>
<body>
<%
    List<ClienteDTO> listaClientes = (List<ClienteDTO>) request.getSession().getAttribute("listaClientes");
    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
%>
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
            <td><fmt:formatDate value="${clienteBusca.dtNascimento}" pattern="dd/MM/yyyy"/></td>
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

    <%--<%--%>
    <%--for (ClienteDTO cliente : listaClientes) { %>--%>
    <%--<tr>--%>
    <%--<td><%= cliente.getNome()%></td>--%>
    <%--<td><%= cliente.getSobrenome()%></td>--%>
    <%--<td><%= dateFormat.format(cliente.getDtNascimento())%></td>--%>
    <%--<td><%= cliente.getSexo()%></td>--%>
    <%--<td><%= cliente.getEnderecoDTO().getRua()%></td>--%>
    <%--<td><%= cliente.getEnderecoDTO().getNumeroEndereco()%></td>--%>
    <%--<td><%= cliente.getEnderecoDTO().getBairro()%></td>--%>
    <%--<td><%= cliente.getEnderecoDTO().getCidade()%></td>--%>
    <%--<td><%= cliente.getEnderecoDTO().getUfDTO().getSigla()%></td>--%>
    <%--<td><%= cliente.getEmpresaDTO().getNomeFantasia()%></td>--%>
    <%--<td><%= cliente.getUsuarioDTO().getNomeConta()%></td>--%>
    <%--<td><a href="controller?acao=editarCliente&idCliente=<%=cliente.getId()%>">Editar</a></td>--%>
    <%--<td>Excluir</td>--%>
    <%--</tr>--%>
    <%--<%--%>
    <%--}--%>
    <%--%>--%>


</table>


</body>
</html>
