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

<div id="barra">
    <label>Bem vindo, ${usuarioLogado.nomeConta}</label>
    <div id="login">
        <a href="controller?acao=login&tipo=logoff">Sair</a>

    </div>
</div>

<nav>
    <ul class="menu">

        <li><a>Cadastrar</a>
            <ul>
                <li><a href="controller?acao=cadastro&tipo=cliente">Cliente</a></li>
                <li><a href="controller?acao=cadastro&tipo=empresa">Empresa</a></li>

            </ul>
        </li>

        <li><a>Relatórios</a>
            <ul>
                <li><a href="controller?acao=relatorio&tipo=clienteEmpresa">Clientes por Empresa</a></li>
                <li><a href="controller?acao=relatorio&tipo=listaUsuarios">Lista de Usuários</a></li>
                <li><a href="controller?acao=relatorio&tipo=ticketSemResp">Lista de Tickets sem Resposta por Cliente</a></li>
                <li><a href="controller?acao=relatorio&tipo=qtdTicketsCliente">Relatório de Quantidades Cliente</a></li>

            </ul>
        </li>

        <li><a>Tickets</a>
            <ul>
                <li><a href="controller?acao=listarTickets&tipo=todos">Todos</a></li>
                <li><a href="controller?acao=listarTickets&tipo=Aberto">Aberto</a></li>
                <li><a href="controller?acao=listarTickets&tipo=Fechado">Fechado</a></li>
            </ul>
        </li>

        <li><a>Tópicos</a>
            <ul>
                <li><a href="controller?acao=topico&tipo=listarTopicos">Listar Tópicos</a></li>
            </ul>
        </li>

        <li><a>Listar</a>
            <ul>
                <li><a href="controller?acao=listar&tipo=clientes">Clientes</a></li>
                <li><a href="controller?acao=listar&tipo=empresas">Empresas</a></li>
                <li><a href="controller?acao=listar&tipo=usuarios">Usuários</a></li>
            </ul>
        </li>
    </ul>
    </ul>
</nav>
<br><br><br><br>

</body>
</html>
