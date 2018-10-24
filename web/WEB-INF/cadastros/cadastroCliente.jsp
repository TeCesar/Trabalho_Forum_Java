<%@ page import="br.edu.java.poo.model.endereco.UfDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.java.poo.model.empresa.EmpresaDTO" %><%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 24/10/2018
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro de Cliente</title>
</head>
<body>
<%
    List<UfDTO> listaUfs = (List<UfDTO>) request.getSession().getAttribute("listaUfs");
    List<EmpresaDTO> listaEmpresas = (List<EmpresaDTO>) request.getSession().getAttribute("listaEmpresas");
%>
<form method="post" action="/controller?acao=cadastro" style="text-align: center">
    <label>Nome: </label><input type="text" name="clienteNome"><br><br>
    <label>Sobrenome: </label><input type="text" name="clienteSobrenome"><br><br>
    <label>Dt. Nascimento: </label><input type="text" name="clienteDtNasc"><br><br>
    <label>Sexo: </label>
    <input type="radio" name="clienteSexo" value="M" checked="checked">Masculino
    <input type="radio" name="clienteSexo" value="F">Feminino
    <br><br>
    <label>Nome da Rua: </label><input type="text" name="clienteNomeRua"><br><br>
    <label>Número da Casa: </label><input type="text" name="clienteNumeroCasa"><br><br>
    <label>Bairro: </label><input type="text" name="clienteBairro"><br><br>
    <label>Cidade: </label><input type="text" name="clienteCidade"><br><br>
    <label>UF</label>
    <select name="clienteUfId">
        <option>Selecione uma opção</option>
        <%for (UfDTO uf : listaUfs) { %>
            <option value="<%= uf.getId()%>"><%= uf.getSigla()%></option>
        <%}%>
    </select>
    <br><br>
    <label>Selecione uma empresa para o seu cliente</label>
    <select name="clienteEmpresaId">
        <option>Selecione uma Opção</option>
        <%for (EmpresaDTO empresa : listaEmpresas) { %>
        <option value="<%= empresa.getId()%>"><%= empresa.getNomeFantasia()%></option>
        <%}%>
    </select>
    <br><br>
    <label>Nome de Usuário:</label><input type="text" name="clienteNomeUsuario">
    <input type="reset" value="Limpar Campos">
    <input type="submit" value="Cadastrar">
</form>

</body>
</html>
