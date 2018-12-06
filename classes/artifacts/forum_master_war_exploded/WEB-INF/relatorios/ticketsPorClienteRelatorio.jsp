<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 05/11/2018
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Tickets por Cliente</title>
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
<br><br><br><br>

<center>
    <h1>Relatório Tickets por Cliente</h1><br>

<c:forEach var="cliente" items="${listaClientes}">
    <h3 class="txtLeft">Cliente: ${cliente.nome} ${cliente.sobrenome}</h3>


    <table width="90%" align="center" cellpadding="10">

        <tr align="center" bgcolor="#CCC">
            <td><strong>Titulo</strong></td>
            <td><strong>Mensagem</strong></td>
            <td><strong>Status</strong></td>
            <td><strong>Situação</strong></td>
            <td><strong>Respondido</strong></td>
        </tr>


        <c:forEach var="ticket" items="${listaTickets}">
            <c:if test="${cliente.usuarioDTO.id == ticket.usuarioDTO.id}">
                <tr style="text-align: center;" class="border_bottom">
                    <td>${ticket.titulo}</td>
                    <td>${ticket.mensagem}</td>
                    <td>${ticket.status}</td>
                    <td>${ticket.situacao}</td>
                    <td>${ticket.respondido}</td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</c:forEach>
</center>

</body>
</html>
