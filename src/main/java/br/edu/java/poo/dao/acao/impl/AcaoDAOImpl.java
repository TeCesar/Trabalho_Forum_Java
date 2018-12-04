package br.edu.java.poo.dao.acao.impl;

import br.edu.java.poo.dao.acao.AcaoDAO;
import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.model.acao.AcaoDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AcaoDAOImpl implements AcaoDAO {

    @Override
    public boolean insereAcao(AcaoDTO acaoDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO acoes (acao_acao, acao_tipo, usuario_id) VALUES " +
                    "(?, ?, ?)");

            preparedStatement.setString(1, acaoDTO.getAcao());
            preparedStatement.setString(2, acaoDTO.getTipo());
            preparedStatement.setInt(3, acaoDTO.getUsuarioSession().getId());

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
}
