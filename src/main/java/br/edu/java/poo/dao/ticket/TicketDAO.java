package br.edu.java.poo.dao.ticket;

import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.util.List;

public interface TicketDAO {

    int inicioTicket(TicketDTO ticketDTO);

    boolean finalizaTicket(TicketDTO ticketDTO);

    List<TicketDTO> listarTicketsSituacao(String tipo);

    List<TicketDTO> listarTicketsUser(int idUsuario);

}
