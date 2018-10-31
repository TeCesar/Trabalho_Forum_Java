<%@ page import="br.edu.java.poo.model.empresa.EmpresaDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 30/10/2018
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Listagem de Empresas</title>
</head>
<body>
<%
    List<EmpresaDTO> listaEmpresas = (List<EmpresaDTO>) request.getSession().getAttribute("listaEmpresas");
%>

<table>
    <tr>
        <th>Nome</th>
        <th>CNPJ</th>
        <th>Razão Social</th>
        <th>Rua</th>
        <th>Bairro</th>
        <th>Cidade</th>
        <th>Estado</th>
        <th colspan="2">Ação</th>
    </tr>
    <% for (EmpresaDTO empresa : listaEmpresas) { %>
        <tr>
            <td><%= empresa.getNomeFantasia()%></td>
            <td><%= empresa.getCnpj()%></td>
            <td><%= empresa.getRazaoSocial()%></td>
            <td><%= empresa.getEnderecoDTO().getRua()%></td>
            <td><%= empresa.getEnderecoDTO().getBairro()%></td>
            <td><%= empresa.getEnderecoDTO().getCidade()%></td>
            <td><%= empresa.getEnderecoDTO().getUfDTO().getSigla()%></td>
            <td><a href="controller?acao=editarEmpresa&id=<%=empresa.getId()%>">Editar</a></td>
            <td>Excluir</td>
        </tr>
    <%}%>
</table>

</body>
</html>
