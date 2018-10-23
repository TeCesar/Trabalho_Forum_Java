package br.edu.java.poo.dao.ticket.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.ticket.TicketDAO;
import br.edu.java.poo.model.ticket.TicketDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

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
}
