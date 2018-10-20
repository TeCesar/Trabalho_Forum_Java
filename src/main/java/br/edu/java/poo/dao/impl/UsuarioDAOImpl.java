package br.edu.java.poo.dao.impl;

import br.edu.java.poo.dao.UsuarioDAO;
import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

}

