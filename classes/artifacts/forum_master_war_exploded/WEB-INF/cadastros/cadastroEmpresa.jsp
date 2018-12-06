<%--
  Created by IntelliJ IDEA.
  User: Robson Manfroi
  Date: 25/10/2018
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cadastro Empresa</title>
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
<br><br><br>

<h1 class="titulo">Cadastro de Empresa</h1>

<form method="post" action="controller?acao=cadastroEmpresa">
    <div style="text-align: center">
        <label class="txt">Razão Social: </label><input type="text" name="razaoSocial" class="campo" required oninvalid="setCustomValidity('Razão Social e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">Nome Fantasia: </label><input type="text" name="nomeFantasia" class="campo" required oninvalid="setCustomValidity('Nome fantasia e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">CNPJ: </label><input type="text" name="cnpj" class="campo"required oninvalid="setCustomValidity('CNPJ e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">Nome da Rua: </label><input type="text" name="empresaNomeRua" class="campo" required oninvalid="setCustomValidity('O nome da rua e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">Número do Endereço: </label><input type="text" name="empresaNumeroEndereco" class="campo" required oninvalid="setCustomValidity('O número e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">Bairro: </label><input type="text" name="empresaBairro" class="campo" required oninvalid="setCustomValidity('O bairro de usuário e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">Cidade: </label><input type="text" name="empresaCidade" class="campo" required oninvalid="setCustomValidity('A cidade e obrigatório')" onchange="try{setCustomValidity('')}catch(e){}"><br><br>
        <label class="txt">UF:</label>
        <select name="empresaUfId" class="campo" onchange="habilitaBtn()" id="opcao">
            <option>Selecione uma opção</option>
            <c:forEach var="uf" items="${listaUfs}">
                <c:if test="${uf.sigla != 'N/A'}">
                    <option value="${uf.id}">${uf.sigla}</option>
                </c:if>
            </c:forEach>
        </select>

    </div>
    <br>
    <center>
        <input type="reset" value="Limpar Campos" class="btns">
        <input type="submit" value="Cadastrar" class="btne" id="cadastrar" disabled="disabled">
    </center>
</form>

<script type="text/javascript">
    function habilitaBtn(){
        var op = document.getElementById("opcao").value;

        if(op == "Selecione uma Opção"){
            if(!document.getElementById('cadastrar').disabled) document.getElementById('cadastrar').disabled=true;
        }
        else{
            if(document.getElementById('cadastrar').disabled) document.getElementById('cadastrar').disabled=false;
        }
    }
</script>


</body>
</html>
