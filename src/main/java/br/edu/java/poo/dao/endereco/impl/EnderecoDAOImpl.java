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
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM enderecos WHERE endereco_rua = ? AND endereco_numero = ?");

            preparedStatement.setString(1, enderecoDTO.getRua());
            preparedStatement.setString(2, enderecoDTO.getNumeroEndereco());

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                enderecoBusca.setId(resultSet.getInt("endereco_id"));
                enderecoBusca.setRua(resultSet.getString("endereco_rua"));
                enderecoBusca.setNumeroEndereco(resultSet.getString("endereco_numero"));
                enderecoBusca.setBairro(resultSet.getString("endereco_bairro"));
                enderecoBusca.setCidade(resultSet.getString("endereco_cidade"));
                return enderecoBusca;
            } else {
                enderecoBusca.setId(criaEndereco(enderecoDTO, ufId));
                return enderecoBusca;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return enderecoBusca;
    }

    private int criaEndereco(EnderecoDTO enderecoDTO, int ufId) throws SQLException, ClassNotFoundException {
        int id = 0;
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO enderecos(endereco_rua, endereco_numero, endereco_bairro, " +
                    "endereco_cidade, uf_id) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, enderecoDTO.getRua());
            preparedStatement.setString(2, enderecoDTO.getNumeroEndereco());
            preparedStatement.setString(3, enderecoDTO.getBairro());
            preparedStatement.setString(4, enderecoDTO.getCidade());
            preparedStatement.setInt(5, ufId);

            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }
        }
        return id;
    }

    public boolean atualizaEndereco(EnderecoDTO enderecoDTO){
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE enderecos SET endereco_rua = ?," +
                    "endereco_numero = ?, endereco_bairro = ?, endereco_cidade = ?, uf_id = ? WHERE endereco_id = ?");

            preparedStatement.setString(1, enderecoDTO.getRua());
            preparedStatement.setString(2, enderecoDTO.getNumeroEndereco());
            preparedStatement.setString(3, enderecoDTO.getBairro());
            preparedStatement.setString(4, enderecoDTO.getCidade());
            preparedStatement.setInt(5, enderecoDTO.getUfDTO().getId());
            preparedStatement.setInt(6, enderecoDTO.getId());

            boolean sucesso = preparedStatement.execute();

            if (!sucesso){
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
    public boolean excluirEndreco(int id) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM enderecos WHERE endereco_id = ?");

            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
}
