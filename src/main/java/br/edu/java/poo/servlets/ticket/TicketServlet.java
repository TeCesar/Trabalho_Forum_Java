package br.edu.java.poo.servlets.ticket;

import br.edu.java.poo.business.ticket.TicketBusiness;
import br.edu.java.poo.business.ticket.impl.TicketBusinessImpl;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = "/ticket")
public class TicketServlet extends HttpServlet {
    TicketBusiness ticketBusiness;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("fimTicket".equalsIgnoreCase(tipo)) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");
        ticketBusiness = new TicketBusinessImpl();
        TicketDTO ticketDTO = new TicketDTO();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();


        if ("inicioTicket".equalsIgnoreCase(tipo)) {
            ticketDTO.setEstado("Incompleto");
            ticketDTO.setTempoInicio(date);
            UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuario");
            ticketBusiness.cadastroTicket(ticketDTO, usuarioSession.getId());
        }
    }
}
