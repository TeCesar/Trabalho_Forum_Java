package br.edu.java.poo.dao.usuario.impl;

import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAOImpl implements UsuarioDAO {

    public UsuarioDTO validarUsuario(UsuarioDTO usuarioDTO) throws ClassNotFoundException {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM usuarios WHERE usuario_nomeConta = '" + usuarioDTO.getNomeConta() + "'" +
                    " AND usuario_senha = '" + usuarioDTO.getSenha() + "'");

            ResultSet resultSet = preparedStatement.executeQuery();


            if (resultSet.next()) {
                usuarioDTO.setId(resultSet.getInt("usuario_id"));
                usuarioDTO.setNomeConta(resultSet.getString("usuario_nomeConta"));
                usuarioDTO.setSenha(resultSet.getString("usuario_senha"));
                usuarioDTO.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
            } else {
                return null;
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
                    "usuario_tipoAcesso, usuario_dataDeCadastro, usuario_errosLogin, usuario_ticketResolvidos) VALUES (?, ?, ?, ?, ?, ? )", Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, usuarioDTO.getNomeConta());
            preparedStatement.setString(2, usuarioDTO.getSenha());
            preparedStatement.setString(3, usuarioDTO.getTipoAcesso());
            preparedStatement.setDate(4, new java.sql.Date(usuarioDTO.getDataDeCadastro().getTime()));
            preparedStatement.setInt(5, 0);
            preparedStatement.setInt(6, 0);

            preparedStatement.execute();

            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            if (resultSet.next()){
                id = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public boolean atualizaUsuario(UsuarioDTO usuarioDTO, boolean altera) {
        if (altera) {
            try (Connection connection = SQLConnectionProvider.openConnection()) {
                PreparedStatement preparedStatement = connection.prepareStatement("UPDATE usuarios SET usuario_nomeConta = ?, usuario_senha = ?, " +
                        "usuario_dataDeAlteracao = ? WHERE usuario_id = ?");

                preparedStatement.setString(1, usuarioDTO.getNomeConta());
                preparedStatement.setString(2, usuarioDTO.getSenha());
                usuarioDTO.setDataDeAlteracao(new java.util.Date());
                preparedStatement.setDate(3, new java.sql.Date(usuarioDTO.getDataDeAlteracao().getTime()));
                preparedStatement.setInt(4, usuarioDTO.getId());

                boolean sucesso = preparedStatement.execute();

                if (!sucesso){
                    return true;
                }

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            return true;
        }
        return false;
    }

    @Override
    public UsuarioDTO buscarUsuario(int id) {
        UsuarioDTO usuarioBusca = new UsuarioDTO();
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM usuarios WHERE usuario_id = ?");

            preparedStatement.setInt(1, id);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return usuarioBusca;
    }

    @Override
    public List<UsuarioDTO> listarUsuarios() {
        List<UsuarioDTO> listaUsuarios = new ArrayList<>();
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM usuarios");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                UsuarioDTO usuarioDTO = new UsuarioDTO();
                usuarioDTO.setId(resultSet.getInt("usuario_id"));
                usuarioDTO.setNomeConta(resultSet.getString("usuario_nomeConta"));
                usuarioDTO.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
                usuarioDTO.setDataDeCadastro(resultSet.getDate("usuario_dataDeCadastro"));
                usuarioDTO.setDataDeAlteracao(resultSet.getDate("usuario_dataDeAlteracao"));
                usuarioDTO.setApelido(resultSet.getString("usuario_apelido"));
                usuarioDTO.setErrosLogin(resultSet.getInt("usuario_errosLogin"));
                usuarioDTO.setTicketsResolvidos(resultSet.getInt("usuario_ticketResolvidos"));
                listaUsuarios.add(usuarioDTO);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listaUsuarios;
    }

}

