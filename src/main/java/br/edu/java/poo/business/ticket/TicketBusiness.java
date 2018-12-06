package br.edu.java.poo.business.ticket;

import br.edu.java.poo.model.ticket.TicketDTO;

import java.util.List;

public interface TicketBusiness {

    int iniciaTicket(TicketDTO ticketDTO);

    boolean finalizaTicket(TicketDTO ticketDTO);

    boolean ticketRespondido(int id);

    boolean reabrirTicket(int id);

    List<List<TicketDTO>> buscarClientesETickets();

}
