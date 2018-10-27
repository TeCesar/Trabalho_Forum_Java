package br.edu.java.poo.dao.cliente.impl;

import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.model.cliente.ClienteDTO;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ClienteDAOImpl implements ClienteDAO {

    @Override
    public int cadastrarCliente(ClienteDTO clienteDTO) {
        int resultado = 0;
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO clientes(cliente_nome, cliente_sobrenome, cliente_dtNascimento," +
                    "endereco_id, empresa_id, usuario_id) VALUES (?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

            DateFormat dateFormat = new SimpleDateFormat();

            preparedStatement.setString(1, clienteDTO.getNome());
            preparedStatement.setString(2, clienteDTO.getSobrenome());
            preparedStatement.setDate(3, new java.sql.Date(clienteDTO.getDtNascimento().getTime()));
            preparedStatement.setInt(4, clienteDTO.getEnderecoDTO().getId());
            preparedStatement.setInt(5, clienteDTO.getEmpresaDTO().getId());
            preparedStatement.setInt(6, clienteDTO.getUsuarioDTO().getId());

            resultado = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return resultado;
    }
}
