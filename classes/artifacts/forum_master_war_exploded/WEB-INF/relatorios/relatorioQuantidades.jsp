<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 06/12/2018
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Relatório de Quantidades</title>
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
<center>
    <h1>Relatório por Quantidade</h1>
    <form method="get" action="controller">
        <input type="hidden" value="relatorio" name="acao">
        <input type="hidden" value="pesquisaClienteQtd" name="tipo">
        <label class="txt">Selecione um cliente</label><select name="selecionaCliente" class="campo">
            <option>Selecione um cliente</option>
            <c:forEach var="cliente" items="${listaClientes}">
                <option value="${cliente.id}">Nome: ${cliente.nome} - Usuário: ${cliente.usuarioDTO.nomeConta}</option>
            </c:forEach>
        </select>
        <br><br>
        <input type="submit" value="Pesquisar" class="btne">
    </form>

        <c:if test="${mostraDetalhe == 'sim'}">
    <div class="listarTopicos">
        <label class="txtLeft">Nome do cliente:</label><strong> ${clienteBusca.nome}</strong><br><br>
        <label class="txtLeft">Nome de usuário do cliente:</label><strong>${clienteBusca.usuarioDTO.nomeConta}</strong><br><br>
        <label class="txtLeft">Quantidade de tickets pelo cliente:</label><strong> ${quantidadeTickets}</strong><br><br>
        <label class="txtLeft"> Quantidade de tickets sem resposta pelo cliente:</label><strong> ${quantidadeTicketsSemResposta}</strong><br><br>
        <label class="txtLeft">Quantidade de tickets respondidos:</label><strong> ${quantidadeTicketsRespondidos}</strong><br><br>
         <label class="txtLeft">Quantidade de tickets reabertos:</label><strong> ${clienteBusca.usuarioDTO.ticketsReabertos}</strong><br><br>
    </div>
        </c:if>

</center>
</body>
</html>
