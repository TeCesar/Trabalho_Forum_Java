package br.edu.java.poo.dao.endereco.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.endereco.EnderecoDAO;
import br.edu.java.poo.model.endereco.EnderecoDTO;

import java.sql.*;

public class EnderecoDAOImpl implements EnderecoDAO {

    @Override
    public EnderecoDTO buscaEndereco(EnderecoDTO enderecoDTO, int ufId) {
        EnderecoDTO enderecoBusca = new EnderecoDTO();
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM enderecos WHERE endereco_rua = ?");

            preparedStatement.setString(1, enderecoDTO.getRua());

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                enderecoBusca.setId(resultSet.getInt("endereco_id"));
                enderecoBusca.setRua(resultSet.getString("endereco_rua"));
                enderecoBusca.setNumeroCasa(resultSet.getInt("endereco_numero"));
                enderecoBusca.setBairro(resultSet.getString("endereco_bairro"));
                enderecoBusca.setCidade(resultSet.getString("endereco_cidade"));
                enderecoBusca.getUfDTO().setId(resultSet.getInt("uf_id"));
            } else {
                preparedStatement = connection.prepareStatement("INSERT INTO enderecos(endereco_rua, endereco_numero, endereco_bairro, " +
                        "endereco_cidade, uf_id) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

                preparedStatement.setString(1, enderecoDTO.getRua());
                preparedStatement.setInt(2, enderecoDTO.getNumeroCasa());
                preparedStatement.setString(3, enderecoDTO.getBairro());
                preparedStatement.setString(4, enderecoDTO.getCidade());
                preparedStatement.setInt(5, ufId);

                preparedStatement.executeUpdate();
                resultSet = preparedStatement.getGeneratedKeys();

                while (resultSet.next()) {
                    enderecoBusca.setId(resultSet.getInt("endereco_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return enderecoBusca;
    }
}
