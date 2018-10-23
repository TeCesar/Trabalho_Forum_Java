package br.edu.java.poo.dao.ticket.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.ticket.TicketDAO;
import br.edu.java.poo.model.ticket.TicketDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TicketDAOImpl implements TicketDAO {
    @Override
    public int criarTicket(TicketDTO ticketDTO, int usuarioId) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO tickets (ticket_tempoInicio, ticket_estado) VALUES (?, ?), Statement.RETURN_GENERATED_KEYS")
            java.sql.Timestamp sqlDateIni = new java.sql.Timestamp(ticketDTO.getTempoInicio().getTime());
            preparedStatement.setTimestamp(1, sqlDateIni);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
