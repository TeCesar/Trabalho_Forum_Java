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
<html>
<head>
    <title>Edição de Empresa</title>
</head>
<body>
<%
    EmpresaDTO empresaBusca = (EmpresaDTO) request.getSession().getAttribute("empresaBusca");
    List<UfDTO> listaUfs = (List<UfDTO>) request.getSession().getAttribute("listaUfs");
%>

<form action="controller?acao=editarEmpresa" method="post">
    <input type="hidden" name="idEmpresaEdit" value="<%= empresaBusca.getId()%>">
    <input type="text" name="nomeEmpresaEdit" value="<%= empresaBusca.getNomeFantasia()%>"><br><br>
    <input type="text" name="cnpjEmpresaEdit" value="<%= empresaBusca.getCnpj()%>"><br><br>
    <input type="text" name="razaoSocialEmpresaEdit" value="<%= empresaBusca.getRazaoSocial()%>"><br><br>
    <input type="hidden" name="enderecoIdEmpresaEdit" value="<%= empresaBusca.getEnderecoDTO().getId()%>">
    <input type="text" name="ruaEmpresaEdit" value="<%= empresaBusca.getEnderecoDTO().getRua()%>"><br><br>
    <input type="text" name="numeroEmpresaEdit" value="<%= empresaBusca.getEnderecoDTO().getNumeroEndereco()%>"><br><br>
    <input type="text" name="bairroEmpresaEdit" value="<%= empresaBusca.getEnderecoDTO().getBairro()%>"><br><br>
    <input type="text" name="cidadeEmpresaEdit" value="<%= empresaBusca.getEnderecoDTO().getCidade()%>"><br><br>
    <input type="hidden" name="ufIdEmpresaEdit" value="<%= empresaBusca.getEnderecoDTO().getUfDTO().getId()%>">
    <select name="empresaUfIdEdit">
        <option value="<%= empresaBusca.getEnderecoDTO().getUfDTO().getId()%>"><%= empresaBusca.getEnderecoDTO().getUfDTO().getSigla()%></option>
        <%for (UfDTO uf : listaUfs) {
        if (uf.getId() != empresaBusca.getEnderecoDTO().getUfDTO().getId()) {%>
            <option value="<%= uf.getId()%>"><%= uf.getSigla()%></option>
        <%}
        }%>
    </select><br><br>
    <input type="submit" value="Editar">
</form>

</body>
</html>
