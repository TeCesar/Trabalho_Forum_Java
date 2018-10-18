<%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 06/10/2018
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <link href="WEB-INF/estilo/estilo.css" rel="stylesheet" type="text/css">

    <style>

        body{
            background-color: #11a6d4;

        }

        #divLogin{
            background-color: #1992b7;
            width: 380px;
            height:260px;
            margin: 140px auto 0px;
            border-radius: 5px;
        }

        #login-box-interno{
            width: 360px;
            height: 240px;
            background-color: #fdfdfd;
            position: absolute;
            margin: 10px;
            border-radius: 5px;
            box-shadow: 0px 0px 5px black;
            overflow: hidden;
        }

        #login-box-label{
            background: #fafbfc;
            background:  -moz-linear-gradient(top, #fafbfc 0%, #ecf1f4 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#fafbfc), color-stop(100%, #ecf1f4));
            background: -webkit-linear-gradient(top, #fafbfc 0%, #ecf1f4 100%);
            background: -o-linear-gradient(top, #fafbfc 0%, #ecf1f4 100%);
            background: -ms-linear-gradient(top, #fafbfc 0%, #ecf1f4 100%);
            background:  linear-gradient(top, #fafbfc 0%, #ecf1f4 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fafbfc', endColorstr='ecf1f4', GradientType=0);
            height: 45px;
            text-align: center;
            font: bold 14px/45px sans-serif;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom: 1px solid #bfc3c5;
            box-shadow: 1px 0px 3px #dedede;
            color: #555555;
            text-shadow: 1px 0px 1px white;

        }

        .input-div{
            margin: 20px;
            padding: 5px;
            background-color: #f2f5f7;
            border-radius: 3px;
        }
        .input-div input{
            width: 310px;
            height: 35px;
            padding-left: 5px;
            font: normal 13px sans-serif;
            color: #aeaeae;
            border-radius: 3px;
            border:1px  solid #bfc4c6;
            outline: none;
        }
        .input-div:hover{
            background-color: #e0f1fc;
        }
        .input-div:hover input{
            boder-color: #7dc6dd;
        }
        #input-senha{
            margin-top: -10px;
        }

        #botoes{
            width: 310px;
            margin-left: 25px;
        }

        .botao{
            background-color: #ecf1f4;
            float:right;
            padding: 5px 15px;
            font: bold 12px sans-serif;
            border-radius: 20px;
            text-shadow: 0px 1px 0px white;
            border: 2px solid #9eb9c3;
            color:#527988;
            box-shadow: 0px 0px 10px #c9c9c9;

        }
        .botao:hover{
            cursor: pointer;
        }
        #lembrar-senha{
            font: normal 12px sans-serif;
        }

    </style>


    <title>Login</title>
</head>
<body>

    <div id="divLogin">
        <div id="login-box-interno">
            <form action="login" method="post">
                <div id="login-box-label">Bem vindo a D.R.T</div>
                <div class="input-div" id="input-usuario">
                    <input type="text" placeholder="USUÁRIO" id="nomeUsuario" name="nomeUsuario">
                </div>
                <div class="input-div" id="input-senha">
                    <input type="password" id="senha" name="senha" placeholder="SENHA">
                </div>
                <div id="botoes">
                        <input type="submit" value="Logar" class="botao">
                    <div id="lembrar-senha"><input type="checkbox">Lembrar minha senha</div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
