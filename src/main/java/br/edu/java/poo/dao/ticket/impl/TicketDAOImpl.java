package br.edu.java.poo.dao.ticket.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.ticket.TicketDAO;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketDAOImpl implements TicketDAO {

    @Override
    public int inicioTicket(TicketDTO ticketDTO, int usuarioId) {
        int resultado = 0;
        String sql = "INSERT INTO tickets (ticket_tempoInicio, ticket_estado) VALUES (?, ?)";
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setTimestamp(1, new java.sql.Timestamp(ticketDTO.getTempoInicio().getTime()));
            preparedStatement.setString(2, ticketDTO.getStatus());

            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            if (resultSet.next()){
                resultado = resultSet.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultado;
    }

    @Override
    public List<TicketDTO> listarTicketsSituacao(String situacao) {
        List<TicketDTO> listaTickets = new ArrayList<>();
        String sql;
        String aux;
        if ("todos".equalsIgnoreCase(situacao)) {
            sql = "SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_mensagem, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                    "tickets.ticket_tempoFim, tickets.ticket_situacao, tickets.ticket_respondido, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
                    "FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id";

            try (Connection connection = SQLConnectionProvider.openConnection()) {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);

                ResultSet resultSet = preparedStatement.executeQuery();

                listaTickets = retrieveInformacoes(resultSet);

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            return listaTickets;
        } else if ("Sem Resposta".equalsIgnoreCase(situacao)) {
            sql = "SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_mensagem, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                    "tickets.ticket_tempoFim, tickets.ticket_situacao, tickets.ticket_respondido, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
                    "FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id WHERE ticket_respondido = ?";

            aux = "Nao";
        } else {
            sql = "SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_mensagem, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                    "tickets.ticket_tempoFim, tickets.ticket_situacao, tickets.ticket_respondido, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
                    "FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id WHERE ticket_situacao = ?";

            aux = situacao;
        }
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, aux);

            ResultSet resultSet = preparedStatement.executeQuery();

            listaTickets = retrieveInformacoes(resultSet);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listaTickets;
    }

    @Override
    public List<TicketDTO> listarTicketsUser(String usuarioNomeConta) {
        List<TicketDTO> listaTickets = new ArrayList<>();
        String sql = "SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_mensagem, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                "tickets.ticket_tempoFim, tickets.ticket_situacao, tickets.ticket_respondido, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
                "FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id WHERE usuarios.usuario_nomeConta = ?";

        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, usuarioNomeConta);

            ResultSet resultSet = preparedStatement.executeQuery();

            listaTickets = retrieveInformacoes(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listaTickets;
    }

    private List<TicketDTO> retrieveInformacoes(ResultSet resultSet) throws SQLException {
        List<TicketDTO> listaTickets = new ArrayList<>();
        while (resultSet.next()) {
            UsuarioDTO usuarioDTO = new UsuarioDTO();
            usuarioDTO.setId(resultSet.getInt("usuario_id"));
            usuarioDTO.setNomeConta(resultSet.getString("usuario_nomeConta"));
            usuarioDTO.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
            TicketDTO ticketDTO = new TicketDTO();
            ticketDTO.setUsuarioDTO(usuarioDTO);
            ticketDTO.setId(resultSet.getInt("ticket_id"));
            ticketDTO.setTitulo(resultSet.getString("ticket_titulo"));
            ticketDTO.setMensagem(resultSet.getString("ticket_mensagem"));
            ticketDTO.setStatus(resultSet.getString("ticket_status"));
            ticketDTO.setTempoInicio(resultSet.getDate("ticket_tempoInicio"));
            ticketDTO.setTempoFim(resultSet.getDate("ticket_tempoFim"));
            ticketDTO.setSituacao(resultSet.getString("ticket_situacao"));
            ticketDTO.setRespondido(resultSet.getString("ticket_respondido"));
            listaTickets.add(ticketDTO);
        }
        return listaTickets;
    }
}
