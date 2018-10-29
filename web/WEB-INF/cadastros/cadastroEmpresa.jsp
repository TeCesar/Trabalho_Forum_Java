<%@ page import="br.edu.java.poo.model.endereco.UfDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Robson Manfroi
  Date: 25/10/2018
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro Empresa</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>
<%
    List<UfDTO> listaUfs = (List<UfDTO>) request.getSession().getAttribute("listaUfs");
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

<h1 class="titulo">Cadastro de Empresa</h1>

<form method="post">
    <div style="text-align: center">
        <label class="txt">Razão Social: </label><input type="text" name="razaoSocial" class="campo"><br><br>
        <label class="txt">Nome Fantasia: </label><input type="text" name="nomeFantasia" class="campo"><br><br>
        <label class="txt">CNPJ: </label><input type="text" name="cnpj" class="campo"><br><br>
        <label class="txt">Nome da Rua: </label><input type="text" name="empresaNomeRua" class="campo" required><br><br>
        <label class="txt">Número do Endereço: </label><input type="text" name="empresaNumeroCasa" class="campo"
                                                          required><br><br>
        <label class="txt">Bairro: </label><input type="text" name="empresaBairro" class="campo" required><br><br>
        <label class="txt">Cidade: </label><input type="text" name="empresaCidade" class="campo" required><br><br>
        <label class="txt">UF:</label>
        <select name="empresaUfId" class="campo">
            <option>Selecione uma opção</option>
            <%for (UfDTO uf : listaUfs) { %>
            <option value="<%= uf.getId()%>"><%= uf.getSigla()%>
            </option>
            <%}%>
        </select>

    </div>
    <br>
    <input type="reset" value="Limpar Campos" class="btns">
    <input type="submit" value="Cadastrar" class="btne">
</form>

</body>
</html>
