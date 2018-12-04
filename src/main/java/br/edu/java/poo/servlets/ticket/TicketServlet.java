package br.edu.java.poo.servlets.ticket;

import br.edu.java.poo.business.ticket.TicketBusiness;
import br.edu.java.poo.business.ticket.impl.TicketBusinessImpl;
import br.edu.java.poo.dao.thread.ThreadDAO;
import br.edu.java.poo.dao.thread.impl.ThreadDAOImpl;
import br.edu.java.poo.mapper.BaseMapper;
import br.edu.java.poo.mapper.impl.TicketMapperImpl;
import br.edu.java.poo.model.thread.ThreadDTO;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = "/ticket")
public class TicketServlet extends HttpServlet {
    TicketBusiness ticketBusiness;
    BaseMapper<HttpServletRequest, TicketDTO> ticketMapper;

    public TicketServlet(){
        ticketBusiness = new TicketBusinessImpl();
        ticketMapper = new TicketMapperImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("fimTicket".equalsIgnoreCase(tipo)) {
            ThreadDAO threadDAO = new ThreadDAOImpl();
            String titulo = req.getParameter("tituloTicket");
            String mensagem = req.getParameter("mensagemTicket");
            TicketDTO ticketDTO = (TicketDTO) req.getSession().getAttribute("novoTicket");
            ThreadDTO threadDTO = new ThreadDTO();

            ticketDTO.setTitulo(titulo);
            ticketDTO.setStatus("Completo");
            ticketDTO.setRespondido("Nao");
            ticketDTO.setSituacao("Aberto");

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            String data = dateFormat.format(new Date());
            try {
                ticketDTO.setTempoFim(dateFormat.parse(data));
                threadDTO.setDataPostagem(dateFormat.parse(data));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            threadDTO.setMensagem(mensagem);
            threadDTO.setAutor(ticketDTO.getUsuarioDTO().getNomeConta());
            threadDTO.setAutorPergunta(1);
            threadDTO.setTicketDTO(ticketDTO);
            threadDTO.setUsuarioDTO(ticketDTO.getUsuarioDTO());

            if (ticketBusiness.finalizaTicket(ticketDTO)){
                threadDAO.criarThread(threadDTO);
            }
            req.getSession().removeAttribute("novoTopico");
            req.getRequestDispatcher("WEB-INF/ticket/novoTicket.jsp").forward(req, resp);
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
