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
    public int criarTicket(TicketDTO ticketDTO, int usuarioId) {
        int resultado = 0;
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO tickets (ticket_tempoInicio, ticket_estado) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
            java.sql.Timestamp sqlDateIni = new java.sql.Timestamp(ticketDTO.getTempoInicio().getTime());
            preparedStatement.setTimestamp(1, sqlDateIni);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultado;
    }

    @Override
    public List<TicketDTO> listarTickets(String situacao) {
        List<TicketDTO> listaTickets = new ArrayList<>();
        String sql;
        if ("todos".equalsIgnoreCase(situacao)) {
            sql = "SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_mensagem, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                    "tickets.ticket_tempoFim, tickets.ticket_situacao, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
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
        } else {
            sql = "SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_mensagem, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                    "tickets.ticket_tempoFim, tickets.ticket_situacao, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
                    "FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id WHERE ticket_situacao = ?";

            try (Connection connection = SQLConnectionProvider.openConnection()) {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);

                preparedStatement.setString(1, situacao);

                ResultSet resultSet = preparedStatement.executeQuery();

                listaTickets = retrieveInformacoes(resultSet);

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return listaTickets;
    }

    private List<TicketDTO> retrieveInformacoes(ResultSet resultSet) throws SQLException {
        List<TicketDTO> listaTickets = new ArrayList<>();
        while (resultSet.next()) {
            UsuarioDTO usuarioDTO = new UsuarioDTO();
            usuarioDTO.setId(resultSet.getInt("usuario_id"));
            usuarioDTO.setNomeConta(resultSet.getString("usuario_nomeConta"));
            usuarioDTO.setNomeConta(resultSet.getString("usuario_tipoAcesso"));
            TicketDTO ticketDTO = new TicketDTO();
            ticketDTO.setUsuarioDTO(usuarioDTO);
            ticketDTO.setId(resultSet.getInt("ticket_id"));
            ticketDTO.setTitulo(resultSet.getString("ticket_titulo"));
            ticketDTO.setMensagem(resultSet.getString("ticket_mensagem"));
            ticketDTO.setStatus(resultSet.getString("ticket_status"));
            ticketDTO.setTempoInicio(resultSet.getDate("ticket_tempoInicio"));
            ticketDTO.setTempoFim(resultSet.getDate("ticket_tempoFim"));
            ticketDTO.setSituacao(resultSet.getString("ticket_situacao"));
            listaTickets.add(ticketDTO);
        }
        return listaTickets;
    }
}
