<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 24/10/2018
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cadastro de Cliente</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>


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
<%--@declare id="txttelefone"--%><br><br><br>

<h1 class="titulo">Cadastro de Cliente</h1>

<form method="post" action="controller?acao=cadastroCliente">
    <div style="text-align: center">
        <input type="hidden" value="cadastro" name="tipoAcao">
        <label class="txt">Nome:* </label><input type="text" name="nomeCliente" class="campo" required oninvalid="setCustomValidity('O nome do cliente e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}" ><br><br>
        <label class="txt">Sobrenome:* </label><input type="text" name="sobrenomeCliente" class="campo" required oninvalid="setCustomValidity('O sobrenome do cliente e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">Dt. Nascimento:* </label><input type="text" name="dtNascCliente" class="campo" id="data" required oninvalid="setCustomValidity('A data e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label>Sexo: </label>
        <input type="radio" name="sexoCliente" value="M" checked="checked">Masculino
        <input type="radio" name="sexoCliente" value="F">Feminino
        <br><br>
        <label class="txt">Nome da Rua:* </label><input type="text" name="nomeRuaCliente" class="campo" required oninvalid="setCustomValidity('O nome da rua e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">Número da Casa:* </label><input type="text" name="numeroCasaCliente" class="campo" required oninvalid="setCustomValidity('O número e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">Bairro:* </label><input type="text" name="bairroCliente" class="campo" required oninvalid="setCustomValidity('O bairro e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">Cidade:* </label><input type="text" name="cidadeCliente" class="campo" required oninvalid="setCustomValidity('A cidade e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">UF:*</label>
        <select name="idUfCliente" class="campo" onchange="habilitaBtn()" id="opcao">
            <option>Selecione uma opção</option>
            <c:forEach var="uf" items="${listaUfs}">
                <c:if test="${uf.sigla != 'N/A'}">
                    <option value="${uf.id}">${uf.sigla}</option>
                </c:if>
            </c:forEach>
        </select>
        <br><br>
        <label class="txt">Selecione uma empresa:* </label>
            <select name="idEmpresaCliente" class="campo" onchange="habilitaBtn()" id="opcao2">
                <option>Selecione uma Opção</option>
                <c:forEach var="empresa" items="${listaEmpresas}">
                    <option value="${empresa.id}">${empresa.nomeFantasia}</option>
                </c:forEach>
            </select>

            <br><br>
        <label class="txt">Nome de Usuário:*</label><input type="text" name="nomeUsuarioCliente" class="campo" required oninvalid="setCustomValidity('O nome de usuário e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
    </div>
    <center>
        <input type="reset" value="Limpar Campos" class="btns">
        <input type="submit" value="Cadastrar" id="cadastrar" class="btne"  disabled="disabled">
    </center>
    <br><br>
</form>

    <center>
        <a href="controller?acao=cadastroEmpresa" class="txt" style="color: green; border: 1px solid">Cadastrar Nova Empresa ?</a>
    </center>

<script type="text/javascript">$("#data").mask("00/00/0000");</script>

<script type="text/javascript">
    function habilitaBtn(){
        var op = document.getElementById("opcao").value;
        var op2 = document.getElementById("opcao2").value;

        if(op == "Selecione uma Opção"  || op2 == "Selecione uma Opção"){
            if(!document.getElementById('cadastrar').disabled) document.getElementById('cadastrar').disabled=true;
        }
        else{
            if(document.getElementById('cadastrar').disabled) document.getElementById('cadastrar').disabled=false;
        }
    }
</script>
</body>
</html>
