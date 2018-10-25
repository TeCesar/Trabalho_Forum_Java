<%@ page import="br.edu.java.poo.model.empresa.EmpresaDTO" %>
<%@ page import="br.edu.java.poo.model.endereco.UfDTO" %>
<%@ page import="java.util.List" %><%--
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

    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>


<%
    List<UfDTO> listaUfs = (List<UfDTO>) request.getSession().getAttribute("listaUfs");
    List<EmpresaDTO> listaEmpresas = (List<EmpresaDTO>) request.getSession().getAttribute("listaEmpresas");
%>


<div id="barra">
    <label>Bem vindo</label>
    <div id="login">
        <a href="../../index.jsp">Sair</a>

    </div>
</div>

<nav>
    <ul class="menu">

        <li><a href="#">Cadastrar</a>
            <ul>
                <li><a href="controller?acao=cadastro">Cliente</a></li>
                <li><a href="controller?acao=cadastroEmpresa">Empresa</a></li>

            </ul>
        </li>

        <li><a href="#">Relatórios</a>
            <ul>
                <li><a href="#">Cliente</a></li>
                <li><a href="#">Empresa</a></li>
                <li><a href="#">Venda</a></li>
                <li><a href="#">Estoque</a></li>
                <li><a href="#">Tickets</a></li>
                <li><a href="#">Tópicos</a></li>
            </ul>
        </li>

        <li><a href="#">Tickets</a>
            <ul>
                <li><a href="controller?acao=tickets">Todos</a></li>
                <li><a href="#">Aberto</a></li>
                <li><a href="#">Fechado</a></li>
                <li><a href="#">Em Andamento</a></li>
            </ul>

        <li><a href="#">Tópicos</a></li>
    </ul>
</nav>
<br><br><br>

<h1 class="titulo">Cadastro de Cliente</h1>

<form method="post" action="/controller?acao=cadastro">
    <div style="text-align: center">

        <label class="txt">Nome: </label><input type="text" name="clienteNome" class="campo"><br><br>
        <label class="txt">Sobrenome: </label><input type="text" name="clienteSobrenome" class="campo"><br><br>
        <label class="txt">Dt. Nascimento: </label><input type="text" name="clienteDtNasc" class="campo"><br><br>
        <label>Sexo: </label>
        <input type="radio" name="clienteSexo" value="M" checked="checked">Masculino
        <input type="radio" name="clienteSexo" value="F">Feminino
        <br><br>
        <label class="txt">Nome da Rua: </label><input type="text" name="clienteNomeRua" class="campo"><br><br>
        <label class="txt">Número da Casa: </label><input type="text" name="clienteNumeroCasa" class="campo"><br><br>
        <label class="txt">Bairro: </label><input type="text" name="clienteBairro" class="campo"><br><br>
        <label class="txt">Cidade: </label><input type="text" name="clienteCidade" class="campo"><br><br>
        <label class="txt">UF:</label>
        <select name="clienteUfId" class="campo">
            <option>Selecione uma opção</option>
            <%for (UfDTO uf : listaUfs) { %>
            <option value="<%= uf.getId()%>"><%= uf.getSigla()%>
            </option>
            <%}%>
        </select>
        <br><br>
        <label class="txt">Selecione uma empresa para o seu cliente</label>
        <select name="clienteEmpresaId" class="campo">
            <option>Selecione uma Opção</option>
            <%for (EmpresaDTO empresa : listaEmpresas) { %>
            <option value="<%= empresa.getId()%>"><%= empresa.getNomeFantasia()%>
            </option>
            <%}%>
        </select>
        <br><br>
        <label class="txt">Nome de Usuário:</label><input type="text" name="clienteNomeUsuario" class="campo"><br><br>
    </div>
    <input type="reset" value="Limpar Campos" class="btns">
    <input type="submit" value="Cadastrar" class="btne">
</form>

</body>
</html>
