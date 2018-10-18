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
        UsuarioDTO usuarioBusca = new UsuarioDTO();
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM usuarios WHERE usuario_nomeConta = '" + usuarioDTO.getNomeConta() + "'" +
                    " AND usuario_senha = '" + usuarioDTO.getSenha() + "'");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                usuarioBusca.setId(resultSet.getInt("usuario_id"));
                usuarioBusca.setNomeConta(resultSet.getString("usuario_nomeConta"));
                usuarioBusca.setSenha(resultSet.getString("usuario_senha"));
                usuarioBusca.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
            }
            return usuarioBusca;

        } catch (SQLException e) {
            System.out.println("Falha na conexao");
        }

        usuarioBusca = null;
        return usuarioBusca;
    }

}

