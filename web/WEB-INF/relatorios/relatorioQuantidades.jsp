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

<form method="get" action="controller">
    <input type="hidden" value="relatorio" name="acao">
    <input type="hidden" value="pesquisaClienteQtd" name="tipo">
    <select name="selecionaCliente">
        <option>Selecione um cliente</option>
        <c:forEach var="cliente" items="${listaClientes}">
            <option value="${cliente.id}">Nome: ${cliente.nome} - Usuário: ${cliente.usuarioDTO.nomeConta}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Pesquisar">
</form>

<c:if test="${mostraDetalhe == 'sim'}">
    Nome do cliente: ${clienteBusca.nome}<br>
    Nome de usuário do cliente: ${clienteBusca.usuarioDTO.nomeConta}<br>
    Quantidade de tickets pelo cliente: ${quantidadeTickets}<br>
    Quantidade de tickets sem resposta pelo cliente: ${quantidadeTicketsSemResposta}<br>
    Quantidade de tickets respondidos: ${quantidadeTicketsRespondidos}<br>
</c:if>
</body>
</html>
