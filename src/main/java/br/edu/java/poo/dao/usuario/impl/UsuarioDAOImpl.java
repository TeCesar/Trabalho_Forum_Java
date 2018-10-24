package br.edu.java.poo.dao.usuario.impl;

import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.sql.*;

public class UsuarioDAOImpl implements UsuarioDAO {

    public UsuarioDTO buscarUsuario(UsuarioDTO usuarioDTO) throws ClassNotFoundException {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM usuarios WHERE usuario_nomeConta = '" + usuarioDTO.getNomeConta() + "'" +
                    " AND usuario_senha = '" + usuarioDTO.getSenha() + "'");

            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {
                usuarioDTO.setId(resultSet.getInt("usuario_id"));
                usuarioDTO.setNomeConta(resultSet.getString("usuario_nomeConta"));
                usuarioDTO.setSenha(resultSet.getString("usuario_senha"));
                usuarioDTO.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
            }

        } catch (SQLException e) {
            System.out.println("Falha na conexao");
        }
        return usuarioDTO;
    }

    @Override
    public boolean alteraSenha(String senha, String nomeConta) {

        try (Connection connection = SQLConnectionProvider.openConnection()) {

            PreparedStatement preparedStatement = connection.prepareStatement("update usuarios SET usuario_senha = ? where usuario_nomeConta = '" + nomeConta + "'");

            preparedStatement.setString(1, senha);
            preparedStatement.executeUpdate();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public int criarUsuarioCliente(UsuarioDTO usuarioDTO) {
        int id = 0;
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO usuarios(usuario_nomeConta, usuario_senha," +
                    "usuario_tipoAcesso) VALUES (?, ?, ? )", Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, usuarioDTO.getNomeConta());
            preparedStatement.setString(2, usuarioDTO.getSenha());
            preparedStatement.setString(3, usuarioDTO.getTipoAcesso());

            preparedStatement.executeUpdate();

            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            while (resultSet.next()){
                id = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return id;
    }

}

