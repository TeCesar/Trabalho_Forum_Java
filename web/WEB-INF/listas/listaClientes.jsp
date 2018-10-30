<%@ page import="br.edu.java.poo.model.cliente.ClienteDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Archibald
  Date: 30/10/2018
  Time: 01:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Listagem de Clientes</title>
</head>
<body>
<%
    List<ClienteDTO> listaClientes = (List<ClienteDTO>) request.getSession().getAttribute("listaClientes");
    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
%>
<table>
    <tr>
        <th>Nome</th>
        <th>Sobrenome</th>
        <th>Data de Nascimento</th>
        <th>Sexo</th>
    </tr>
    <tr>
        <%
            for (ClienteDTO cliente : listaClientes) { %>
              <td><%= cliente.getNome()%></td>
              <td><%= cliente.getSobrenome()%></td>
              <td><%= dateFormat.format(cliente.getDtNascimento())%></td>
              <td><%= cliente.getSexo()%></td>
        <%
            }
        %>
    </tr>

</table>


</body>
</html>
