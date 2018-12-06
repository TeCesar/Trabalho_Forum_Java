package br.edu.java.poo.business.ticket.impl;

import br.edu.java.poo.business.ticket.TicketBusiness;
import br.edu.java.poo.dao.ticket.TicketDAO;
import br.edu.java.poo.dao.ticket.impl.TicketDAOImpl;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TicketBusinessImpl implements TicketBusiness {
    TicketDAO ticketDAO;
    UsuarioDAO usuarioDAO;

    public TicketBusinessImpl() {
        ticketDAO = new TicketDAOImpl();
        usuarioDAO = new UsuarioDAOImpl();
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
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String dataAtual = dateFormat.format(new Date());
            try {
                ticketDTO.setTempoFim(dateFormat.parse(dataAtual));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            ticketDAO.finalizaTicket(ticketDTO);
            return true;
        }
        return false;
    }

    @Override
    public boolean ticketRespondido(int id) {
        TicketDTO ticketDTO = ticketDAO.buscarTicket(id);
        ticketDTO.setSituacao("Fechado");
        if (ticketDAO.mudaSituacaoTicket(ticketDTO)){
            return true;
        }
        return false;
    }

    @Override
    public boolean reabrirTicket(int id, int idUsuario) {
        TicketDTO ticketDTO = ticketDAO.buscarTicket(id);
        ticketDTO.setSituacao("Aberto");
        UsuarioDTO usuarioDTO = usuarioDAO.buscarUsuario(idUsuario);
        usuarioDTO.setTicketsReabertos(usuarioDTO.getTicketsReabertos()+1);
        if (ticketDAO.mudaSituacaoTicket(ticketDTO)){
            usuarioDAO.aumentaTicketsReabertos(usuarioDTO);
            return true;
        }
        return false;
    }
}
