package br.edu.java.poo.business.ticket.impl;

import br.edu.java.poo.business.ticket.TicketBusiness;
import br.edu.java.poo.dao.ticket.TicketDAO;
import br.edu.java.poo.dao.ticket.impl.TicketDAOImpl;
import br.edu.java.poo.model.ticket.TicketDTO;

public class TicketBusinessImpl implements TicketBusiness {
    TicketDAO ticketDAO;

    public TicketBusinessImpl() {
        ticketDAO = new TicketDAOImpl();
    }

    @Override
    public int iniciaTicket(TicketDTO ticketDTO) {
        if (ticketDTO != null) {
            int id = ticketDAO.inicioTicket(ticketDTO);
            return id;
        }
        return 0;
    }

    @Override
    public boolean finalizaTicket(TicketDTO ticketDTO) {
        if(ticketDTO != null){
            ticketDAO.finalizaTicket(ticketDTO);
            return true;
        }
        return false;
    }
}
