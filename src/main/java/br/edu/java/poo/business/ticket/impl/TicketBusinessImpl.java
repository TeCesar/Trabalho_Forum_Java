package br.edu.java.poo.business.ticket.impl;

import br.edu.java.poo.business.ticket.TicketBusiness;
import br.edu.java.poo.dao.ticket.TicketDAO;
import br.edu.java.poo.dao.ticket.impl.TicketDAOImpl;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

public class TicketBusinessImpl implements TicketBusiness {
    TicketDAO ticketDAO;

    public TicketBusinessImpl(){
        ticketDAO = new TicketDAOImpl();
    }

    @Override
    public boolean cadastroTicket(TicketDTO ticketDTO, UsuarioDTO usuarioDTO) {
        if(ticketDTO != null){
            ticketDAO.inicioTicket(ticketDTO, usuarioDTO.getId());
            return true;
        }
        return false;
    }
}
