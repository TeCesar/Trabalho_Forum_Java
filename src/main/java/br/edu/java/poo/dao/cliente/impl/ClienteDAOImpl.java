package br.edu.java.poo.dao.cliente.impl;

import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.model.cliente.ClienteDTO;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ClienteDAOImpl implements ClienteDAO {
    Integer resultado = null;

    @Override
    public int cadastrarCliente(ClienteDTO clienteDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO clientes(cliente_nome, cliente_sobrenome, cliente_dtNascimento," +
                    "endereco_id, empresa_id, usuario_id) VALUES (?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

            DateFormat dateFormat = new SimpleDateFormat();

            preparedStatement.setString(1, clienteDTO.getNome());
            preparedStatement.setString(2, clienteDTO.getSobrenome());
            preparedStatement.setDate(3, (Date) dateFormat.parse(clienteDTO.getDtNascimento()));
            preparedStatement.setInt(4, clienteDTO.getEnderecoDTO().getId());
            preparedStatement.setInt(5, clienteDTO.getEmpresaDTO().getId());
            preparedStatement.setInt(6, clienteDTO.getUsuarioDTO().getId());

            resultado = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return resultado;
    }
}
