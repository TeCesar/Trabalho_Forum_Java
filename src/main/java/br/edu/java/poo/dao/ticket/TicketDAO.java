package br.edu.java.poo.dao.ticket;

import br.edu.java.poo.model.ticket.TicketDTO;

import java.util.List;

public interface TicketDAO {

    int criarTicket(TicketDTO ticketDTO, int usuarioId);

    List<TicketDTO> listarTickets(String tipo);

}
