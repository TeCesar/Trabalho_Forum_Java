package br.edu.java.poo.dao.topico.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.topico.TopicoDAO;
import br.edu.java.poo.model.topico.TopicoDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TopicoDAOImpl implements TopicoDAO {

    @Override
    public int iniciaTopico(TopicoDTO topicoDTO) {
        int id = 0;
        String sql = "INSERT INTO topicos (topico_status, topico_dataCriacao, usuario_id) VALUES " +
                "(?, ?, ?)";
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, topicoDTO.getStatus());
            preparedStatement.setTimestamp(2, new java.sql.Timestamp(topicoDTO.getDataCriacao().getTime()));
            preparedStatement.setInt(3, topicoDTO.getUsuarioDTO().getId());

            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            if (resultSet.next()) {
                id = resultSet.getInt(1);
                return id;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public TopicoDTO pesquisaTopico(String palavraChave) {
        return null;
    }

    @Override
    public List<TopicoDTO> listarTopicos() {
        List<TopicoDTO> listaTopicos = new ArrayList<>();
        String sql = "SELECT topicos.topico_id, topicos.topico_titulo, topicos.topico_status, topicos.topico_dataCriacao, " +
                "topicos.topico_dataTermino, topicos.topico_situacao, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso, usuarios.usuario_apelido " +
                "FROM topicos INNER JOIN usuarios ON topicos.usuario_id = usuarios.usuario_id WHERE topicos.topico_status = ?";
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, "Completo");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                TopicoDTO topicoDTO = fillTopico(resultSet);
                listaTopicos.add(topicoDTO);
            }

            return listaTopicos;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listaTopicos;
    }

    @Override
    public boolean finalizaTopico(TopicoDTO topicoDTO) {
        String sql = "UPDATE topicos SET topico_titulo = ?, topico_status = ?, topico_dataTermino = ?, topico_situacao = ? " +
                "WHERE topico_id = ?";
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, topicoDTO.getTitulo());
            preparedStatement.setString(2, topicoDTO.getStatus());
            preparedStatement.setTimestamp(3, new java.sql.Timestamp(topicoDTO.getDataTermino().getTime()));
            preparedStatement.setString(4, topicoDTO.getSituacao());
            preparedStatement.setInt(5, topicoDTO.getId());

            int sucesso = preparedStatement.executeUpdate();

            if (sucesso != 0) {
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
    public TopicoDTO buscaTopico(int id) {
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT topicos.topico_id, topicos.topico_titulo, topicos.topico_status, topicos.topico_dataCriacao, " +
                    "topicos.topico_dataTermino, topicos.topico_situacao, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso, usuarios.usuario_apelido " +
                    "FROM topicos INNER JOIN usuarios ON topicos.usuario_id = usuarios.usuario_id WHERE topicos.topico_id = ?");

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                TopicoDTO topicoBusca = fillTopico(resultSet);
                return topicoBusca;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean mudarSituacaoTopico(TopicoDTO topicoDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE topicos SET topico_situacao = ? WHERE topico_id = ?");

            preparedStatement.setString(1, topicoDTO.getSituacao());
            preparedStatement.setInt(2, topicoDTO.getId());

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

    private TopicoDTO fillTopico(ResultSet resultSet) throws SQLException {
        UsuarioDTO usuarioDTO = new UsuarioDTO();
        usuarioDTO.setId(resultSet.getInt("usuario_id"));
        usuarioDTO.setNomeConta(resultSet.getString("usuario_nomeConta"));
        usuarioDTO.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
        usuarioDTO.setApelido(resultSet.getString("usuario_apelido"));
        TopicoDTO topicoBusca = new TopicoDTO();
        topicoBusca.setUsuarioDTO(usuarioDTO);
        topicoBusca.setId(resultSet.getInt("topico_id"));
        topicoBusca.setTitulo(resultSet.getString("topico_titulo"));
        topicoBusca.setStatus(resultSet.getString("topico_status"));
        topicoBusca.setDataCriacao(resultSet.getDate("topico_dataCriacao"));
        topicoBusca.setDataTermino(resultSet.getDate("topico_dataTermino"));
        topicoBusca.setSituacao(resultSet.getString("topico_situacao"));
        return topicoBusca;
    }
}
