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

    <%
        for (ClienteDTO cliente : listaClientes) { %>
    <tr>
        <td><%= cliente.getNome()%></td>
        <td><%= cliente.getSobrenome()%></td>
        <td><%= dateFormat.format(cliente.getDtNascimento())%></td>
        <td><%= cliente.getSexo()%></td>
        <td><%= cliente.getEnderecoDTO().getRua()%></td>
        <td><%= cliente.getEnderecoDTO().getNumeroEndereco()%></td>
        <td><%= cliente.getEnderecoDTO().getBairro()%></td>
        <td><%= cliente.getEnderecoDTO().getCidade()%></td>
        <td><%= cliente.getEnderecoDTO().getUfDTO().getSigla()%></td>
        <td><%= cliente.getEmpresaDTO().getNomeFantasia()%></td>
        <td><%= cliente.getUsuarioDTO().getNomeConta()%></td>
        <td>Editar</td>
        <td>Excluir</td>
    </tr>
    <%
        }
    %>


</table>


</body>
</html>
