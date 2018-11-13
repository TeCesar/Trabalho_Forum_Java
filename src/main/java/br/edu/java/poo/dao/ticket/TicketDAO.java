package br.edu.java.poo.dao.ticket;

import br.edu.java.poo.model.ticket.TicketDTO;

import java.util.List;

public interface TicketDAO {

    int inicioTicket(TicketDTO ticketDTO, int usuarioId);

    List<TicketDTO> listarTicketsSituacao(String tipo);

    List<TicketDTO> listarTicketsUser(String usuarioNomeConta);

}
