package br.edu.java.poo.business.ticket;

import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

public interface TicketBusiness {

    boolean cadastroTicket(TicketDTO ticketDTO, UsuarioDTO usuarioDTO);

}
