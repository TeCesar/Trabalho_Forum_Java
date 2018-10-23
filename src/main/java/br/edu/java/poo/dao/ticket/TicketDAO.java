package br.edu.java.poo.dao.ticket;

import br.edu.java.poo.model.ticket.TicketDTO;

public interface TicketDAO {

    int criarTicket(TicketDTO ticketDTO, int usuarioId);

}
