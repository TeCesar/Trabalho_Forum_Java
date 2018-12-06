package br.edu.java.poo.dao.usuario.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
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
                usuarioDTO.setBloqueado(resultSet.getInt("usuario_bloqueado"));
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
                    "usuario_tipoAcesso, usuario_dataDeCadastro) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, usuarioDTO.getNomeConta());
            preparedStatement.setString(2, usuarioDTO.getSenha());
            preparedStatement.setString(3, usuarioDTO.getTipoAcesso());
            preparedStatement.setDate(4, new java.sql.Date(usuarioDTO.getDataDeCadastro().getTime()));

            preparedStatement.execute();

            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            if (resultSet.next()) {
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
    public boolean atualizaUsuario(UsuarioDTO usuarioDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE usuarios SET usuario_nomeConta = ?, usuario_senha = ?, " +
                    "usuario_dataDeAlteracao = ? WHERE usuario_id = ?");

            preparedStatement.setString(1, usuarioDTO.getNomeConta());
            preparedStatement.setString(2, usuarioDTO.getSenha());
            usuarioDTO.setDataDeAlteracao(new java.util.Date());
            preparedStatement.setDate(3, new java.sql.Date(usuarioDTO.getDataDeAlteracao().getTime()));
            preparedStatement.setInt(4, usuarioDTO.getId());

            int resultado = preparedStatement.executeUpdate();

            if (resultado != 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public UsuarioDTO buscarUsuario(int id) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM usuarios WHERE usuario_id = ?");

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                UsuarioDTO usuarioBusca = fillUsuario(resultSet);
                return usuarioBusca;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public UsuarioDTO buscarUsuarioPorNome(String nomeConta) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM usuarios WHERE usuario_nomeConta = ?");

            preparedStatement.setString(1, nomeConta);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                UsuarioDTO usuarioDTO = fillUsuario(resultSet);
                return usuarioDTO;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean atualizaErrosLogin(UsuarioDTO usuarioDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE usuarios SET usuario_errosLogin = ? WHERE usuario_id = ?");

            preparedStatement.setInt(1, usuarioDTO.getErrosLogin());
            preparedStatement.setInt(2, usuarioDTO.getId());

            int resultado = preparedStatement.executeUpdate();

            if (resultado != 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<UsuarioDTO> listarUsuarios(String tipo) {
        List<UsuarioDTO> listaUsuarios = new ArrayList<>();
        String sql;
        if ("todos".equalsIgnoreCase(tipo)) {
            sql = "SELECT usuario_id, usuario_nomeConta, usuario_tipoAcesso, " +
                    "usuario_dataDeCadastro, usuario_dataDeAlteracao, usuario_apelido, usuario_errosLogin, usuario_ticketResolvidos, usuario_ticketsReabertos, usuario_bloqueado FROM usuarios";
        } else {
            sql = "SELECT usuario_id, usuario_nomeConta, usuario_tipoAcesso, " +
                    "usuario_dataDeCadastro, usuario_dataDeAlteracao, usuario_apelido, usuario_errosLogin, usuario_ticketResolvidos, usuario_ticketsReabertos, usuario_bloqueado FROM usuarios WHERE usuario_bloqueado = 1";
        }
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                UsuarioDTO usuarioDTO = fillUsuario(resultSet);
                listaUsuarios.add(usuarioDTO);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listaUsuarios;
    }

    @Override
    public boolean mudarBloqueioUsuario(UsuarioDTO usuarioDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE usuarios SET usuario_bloqueado = ? WHERE usuario_id = ?");

            preparedStatement.setInt(1, usuarioDTO.getBloqueado());
            preparedStatement.setInt(2, usuarioDTO.getId());

            int resultado = preparedStatement.executeUpdate();

            if (resultado != 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean criarUsuario(UsuarioDTO usuarioDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO usuarios (usuario_nomeConta, usuario_senha, " +
                    "usuario_tipoAcesso, usuario_dataDeCadastro) VALUES (?, ?, ?, ?)");

            preparedStatement.setString(1, usuarioDTO.getNomeConta());
            preparedStatement.setString(2, usuarioDTO.getSenha());
            preparedStatement.setString(3, usuarioDTO.getTipoAcesso());
            preparedStatement.setDate(4, new java.sql.Date(usuarioDTO.getDataDeCadastro().getTime()));

            int resultado = preparedStatement.executeUpdate();

            if (resultado != 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean aumentaTicketsResolvidos(UsuarioDTO usuarioDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE usuarios SET usuario_ticketResolvidos = ? WHERE usuario_id = ?");

            preparedStatement.setInt(1, usuarioDTO.getTicketsResolvidos());
            preparedStatement.setInt(2, usuarioDTO.getId());

            int resultado = preparedStatement.executeUpdate();

            if (resultado != 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean aumentaTicketsReabertos(UsuarioDTO usuarioDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE usuarios SET usuario_ticketsReabertos = ? WHERE usuario_id = ?");

            preparedStatement.setInt(1, usuarioDTO.getTicketsReabertos());
            preparedStatement.setInt(2, usuarioDTO.getId());

            int resultado = preparedStatement.executeUpdate();

            if (resultado != 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    private UsuarioDTO fillUsuario(ResultSet resultSet) throws SQLException {
        UsuarioDTO usuarioBusca = new UsuarioDTO();
        usuarioBusca.setId(resultSet.getInt("usuario_id"));
        usuarioBusca.setNomeConta(resultSet.getString("usuario_nomeConta"));
        usuarioBusca.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
        usuarioBusca.setDataDeCadastro(resultSet.getDate("usuario_dataDeCadastro"));
        usuarioBusca.setDataDeAlteracao(resultSet.getDate("usuario_dataDeAlteracao"));
        usuarioBusca.setApelido(resultSet.getString("usuario_apelido"));
        usuarioBusca.setErrosLogin(resultSet.getInt("usuario_errosLogin"));
        usuarioBusca.setTicketsResolvidos(resultSet.getInt("usuario_ticketResolvidos"));
        usuarioBusca.setTicketsReabertos(resultSet.getInt("usuario_ticketsReabertos"));
        usuarioBusca.setBloqueado(resultSet.getInt("usuario_bloqueado"));
        return usuarioBusca;
    }

}

