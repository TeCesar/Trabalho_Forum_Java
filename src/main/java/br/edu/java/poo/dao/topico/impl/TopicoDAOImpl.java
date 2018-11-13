package br.edu.java.poo.dao.topico.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.topico.TopicoDAO;
import br.edu.java.poo.model.topico.TopicoDTO;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class TopicoDAOImpl implements TopicoDAO {

    @Override
    public int iniciaTopico(TopicoDTO topicoDTO) {
        int id = 0;
        String sql = "INSERT INTO topicos (topico_status, topico_dataCriacao, usuario_id) VALUES " +
                "(?, ?, ?)";
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, topicoDTO.getStatus());
            preparedStatement.setDate(2, new java.sql.Date(topicoDTO.getDataCriacao().getTime()));
            preparedStatement.setInt(3, topicoDTO.getUsuarioDTO().getId());

            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            if (resultSet.next()){
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
        return null;
    }

    @Override
    public boolean finalizaTopico(TopicoDTO topicoDTO) {
        String sql = "";
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
}
