package br.edu.java.poo.business.ticket;

import br.edu.java.poo.model.ticket.TicketDTO;

public interface TicketBusiness {

    boolean cadastroTicket(TicketDTO ticketDTO, int usuarioId);

}
