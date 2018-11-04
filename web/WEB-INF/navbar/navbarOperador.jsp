<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 04/11/2018
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<nav>
    <ul class="menu">

        <li><a href="#">Cadastrar</a>
            <ul>
                <li><a href="controller?acao=cadastroCliente">Cliente</a></li>
                <li><a href="controller?acao=cadastroEmpresa">Empresa</a></li>

            </ul>
        </li>

        <li><a href="#">Relatórios</a>
            <ul>
                <li><a href="controller?acao=relatorio">Clientes por Empresa</a></li>
                <li><a href="controller?acao=relatorio">Lista de Usuários</a></li>
                <li><a href="controller?acao=relatorio">Quantidade de Tickets por Cliente</a></li>
                <li><a href="controller?acao=relatorio">Quantidade de Tickets sem Resposta por Cliente</a></li>
                <li><a href="#">Tickets</a></li>
                <li><a href="#">Tópicos</a></li>
            </ul>
        </li>

        <li><a href="#">Tickets</a>
            <ul>
                <li><a href="controller?acao=listarTickets&tipo=todos">Todos</a></li>
                <li><a href="controller?acao=listarTickets&tipo=Aberto">Aberto</a></li>
                <li><a href="controller?acao=listarTickets&tipo=Fechado">Fechado</a></li>
                <li><a href="controller?acao=listarTickets&tipo=Andamento">Em Andamento</a></li>
            </ul>
        </li>

        <li><a href="#">Tópicos</a></li>

        <li><a href="#">Listar</a>
            <ul>
                <li><a href="controller?acao=listarClientes">Clientes</a></li>
                <li><a href="controller?acao=listarEmpresas">Empresas</a></li>
            </ul>
        </li>
    </ul>
    </ul>
</nav>

</body>
</html>
