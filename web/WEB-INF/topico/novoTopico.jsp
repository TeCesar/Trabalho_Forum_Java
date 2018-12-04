<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 05/11/2018
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Criação de Tópico</title>
    <style>
        <%@include file="/WEB-INF/estilo/estilo.css" %>
    </style>
</head>
<body>
<c:if test="${usuarioLogado.tipoAcesso == 'Operador'}">
    <%@include file="/WEB-INF/navbar/navbarOperador.jsp" %>
</c:if>
<c:if test="${usuarioLogado.tipoAcesso == 'Cliente'}">
    <%@include file="/WEB-INF/navbar/navbarCliente.jsp" %>
</c:if>
<c:if test="${usuarioLogado.tipoAcesso == 'Administrador'}">
    <%@include file="/WEB-INF/navbar/navbarAdministrador.jsp" %>
</c:if>
<c:if test="${usuarioLogado.tipoAcesso == 'Usuario'}">
    <%@include file="/WEB-INF/navbar/navbarUsuario.jsp" %>
</c:if>
<center>
    <h1 class="titulo">Abrir novo Topico</h1>
    <br><br>
    <div style="text-align: center">
        <form method="post" action="controller?acao=topico&tipo=finalizaTopico">
            <%--<input type="hidden" value="${novoTopico.id}" name="idTopico">--%>
            <strong><label class="txt">Titulo: </label></strong><input type="text" name="tituloTopico" class="campo" required><br><br>
            <strong><label class="txt">Mensagem: </label></strong><input type="text" name="mensagemTopico" class="campo" required><br><br>
            <input type="submit" value="Criar Tópico" class="btne">
        </form>
    </div>
</center>
</body>
</html>
