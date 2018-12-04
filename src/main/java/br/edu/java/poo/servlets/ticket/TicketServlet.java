package br.edu.java.poo.servlets.ticket;

import br.edu.java.poo.business.ticket.TicketBusiness;
import br.edu.java.poo.business.ticket.impl.TicketBusinessImpl;
import br.edu.java.poo.dao.thread.ThreadDAO;
import br.edu.java.poo.dao.thread.impl.ThreadDAOImpl;
import br.edu.java.poo.mapper.BaseMapper;
import br.edu.java.poo.mapper.impl.ThreadMapperImpl;
import br.edu.java.poo.mapper.impl.TicketMapperImpl;
import br.edu.java.poo.model.thread.ThreadDTO;
import br.edu.java.poo.model.ticket.TicketDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/ticket")
public class TicketServlet extends HttpServlet {
    TicketBusiness ticketBusiness;
    BaseMapper<HttpServletRequest, TicketDTO> ticketMapper;
    BaseMapper<HttpServletRequest, ThreadDTO> threadMapper;
    ThreadDAO threadDAO;

    public TicketServlet() {
        ticketBusiness = new TicketBusinessImpl();
        ticketMapper = new TicketMapperImpl();
        threadMapper = new ThreadMapperImpl();
        threadDAO = new ThreadDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("fimTicket".equalsIgnoreCase(tipo)) {
            req.setAttribute("tipoTicketMapper", tipo);
            TicketDTO ticketDTO = ticketMapper.doMap(req);
            req.setAttribute("threadMapperTicket", ticketDTO);
            req.setAttribute("tipoThreadMapper", "ticket");
            ThreadDTO threadDTO = threadMapper.doMap(req);

            if (ticketBusiness.finalizaTicket(ticketDTO)) {
                threadDAO.criarThread(threadDTO);
            }
            req.getSession().removeAttribute("novoTicket");
            req.getRequestDispatcher("listar?tipo=tickets&situacao=user").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("inicioTicket".equalsIgnoreCase(tipo)) {
            req.setAttribute("tipoTicketMapper", tipo);
            TicketDTO ticketDTO = ticketMapper.doMap(req);
            ticketDTO.setId(ticketBusiness.iniciaTicket(ticketDTO));
            req.getSession().setAttribute("novoTicket", ticketDTO);
            req.getRequestDispatcher("WEB-INF/ticket/novoTicket.jsp").forward(req, resp);

        }
    }
}
