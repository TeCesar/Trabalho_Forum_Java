package br.edu.java.poo.dao.acao.impl;

import br.edu.java.poo.dao.acao.AcaoDAO;
import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.model.acao.AcaoDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AcaoDAOImpl implements AcaoDAO {

    @Override
    public boolean insereAcao(AcaoDTO acaoDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO acoes (acao_acao, acao_tipo, acao_dataAcao, usuario_id) VALUES " +
                    "(?, ?, ?, ?)");

            preparedStatement.setString(1, acaoDTO.getAcao());
            preparedStatement.setString(2, acaoDTO.getTipo());
            preparedStatement.setTimestamp(3, new java.sql.Timestamp(acaoDTO.getDataAcao().getTime()));
            preparedStatement.setInt(4, acaoDTO.getUsuarioSession().getId());

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
    public boolean insereAcaoLogin(AcaoDTO acaoDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement= connection.prepareStatement("INSERT INTO acoes (acao_acao, acao_dataAcao, usuario_id) " +
                    "VALUES (?, ?, ?)");

            preparedStatement.setString(1, acaoDTO.getAcao());
            preparedStatement.setTimestamp(2, new java.sql.Timestamp(acaoDTO.getDataAcao().getTime()));
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

    @Override
    public List<AcaoDTO> listaLogAcesso() {
        List<AcaoDTO> listaAcoes = new ArrayList<>();
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT acoes.acao_id, acoes.acao_acao, acoes.acao_tipo, acoes.acao_dataAcao, " +
                    "usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso FROM acoes INNER JOIN usuarios ON acoes.usuario_id = " +
                    "usuarios.usuario_id WHERE acoes.acao_acao = 'login' ORDER BY acoes.acao_id DESC");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                AcaoDTO acaoDTO = fillAcao(resultSet);
                listaAcoes.add(acaoDTO);
            }
            return listaAcoes;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<AcaoDTO> listaAcoes() {
        List<AcaoDTO> listaAcoes = new ArrayList<>();
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT acoes.acao_id, acoes.acao_acao, acoes.acao_tipo, acoes.acao_dataAcao, " +
                    "usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso FROM acoes INNER JOIN usuarios ON acoes.usuario_id = " +
                    "usuarios.usuario_id ORDER BY acoes.acao_id DESC");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                AcaoDTO acaoDTO = fillAcao(resultSet);
                listaAcoes.add(acaoDTO);
            }
            return listaAcoes;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    private AcaoDTO fillAcao(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("usuario_id");
        String nomeConta = resultSet.getString("usuario_nomeConta");
        String tipoAcesso = resultSet.getString("usuario_tipoAcesso");
        UsuarioSession usuarioSession = new UsuarioSession(id, nomeConta, tipoAcesso);
        AcaoDTO acaoBusca = new AcaoDTO();
        acaoBusca.setUsuarioSession(usuarioSession);
        acaoBusca.setId(resultSet.getInt("acao_id"));
        acaoBusca.setAcao(resultSet.getString("acao_acao"));
        acaoBusca.setTipo(resultSet.getString("acao_tipo"));
        acaoBusca.setDataAcao(resultSet.getTimestamp("acao_dataAcao"));
        return acaoBusca;
    }
}
