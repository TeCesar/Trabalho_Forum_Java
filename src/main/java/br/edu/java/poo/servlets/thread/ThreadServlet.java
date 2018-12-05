package br.edu.java.poo.servlets.thread;

import br.edu.java.poo.business.ticket.TicketBusiness;
import br.edu.java.poo.business.ticket.impl.TicketBusinessImpl;
import br.edu.java.poo.business.topico.TopicoBusiness;
import br.edu.java.poo.business.topico.impl.TopicoBusinessImpl;
import br.edu.java.poo.business.usuario.UsuarioBusiness;
import br.edu.java.poo.business.usuario.impl.UsuarioBusinessImpl;
import br.edu.java.poo.dao.thread.ThreadDAO;
import br.edu.java.poo.dao.thread.impl.ThreadDAOImpl;
import br.edu.java.poo.dao.ticket.TicketDAO;
import br.edu.java.poo.dao.ticket.impl.TicketDAOImpl;
import br.edu.java.poo.dao.topico.TopicoDAO;
import br.edu.java.poo.dao.topico.impl.TopicoDAOImpl;
import br.edu.java.poo.model.thread.ThreadDTO;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.topico.TopicoDTO;
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
import java.util.List;

@WebServlet(urlPatterns = "/thread")
public class ThreadServlet extends HttpServlet {
    ThreadDAO threadDAO;
    TicketDAO ticketDAO;
    TopicoDAO topicoDAO;
    UsuarioBusiness usuarioBusiness;
    TicketBusiness ticketBusiness;
    TopicoBusiness topicoBusiness;

    public ThreadServlet() {
        threadDAO = new ThreadDAOImpl();
        ticketDAO = new TicketDAOImpl();
        topicoDAO = new TopicoDAOImpl();
        usuarioBusiness = new UsuarioBusinessImpl();
        ticketBusiness = new TicketBusinessImpl();
        topicoBusiness = new TopicoBusinessImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("acao");

        if ("respostaPostagemThread".equalsIgnoreCase(tipo)) {
            String id = (String) req.getSession().getAttribute("id");
            String mensagem = req.getParameter("mensagemResposta");
            String tt = (String) req.getSession().getAttribute("tt");
            UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuarioLogado");
            String nomeAutor = threadDAO.buscaNomeAutor(tt, Integer.parseInt(id));
            ThreadDTO threadDTO = new ThreadDTO();
            UsuarioDTO usuarioDTO = new UsuarioDTO();
            usuarioDTO.setId(usuarioSession.getId());
            threadDTO.setUsuarioDTO(usuarioDTO);
            threadDTO.setMensagem(mensagem);
            threadDTO.setAutor(usuarioSession.getNomeConta());
            if (nomeAutor.equalsIgnoreCase(usuarioSession.getNomeConta())) {
                threadDTO.setAutorPergunta(1);
            } else {
                threadDTO.setAutorPergunta(0);
            }
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String data = dateFormat.format(new Date());

            try {
                threadDTO.setDataPostagem(dateFormat.parse(data));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            if ("topico".equalsIgnoreCase(tt)) {
                TopicoDTO topicoDTO = new TopicoDTO();
                topicoDTO.setId(Integer.parseInt(id));
                threadDTO.setTicketDTO(null);
                threadDTO.setTopicoDTO(topicoDTO);
            } else {
                TicketDTO ticketDTO = new TicketDTO();
                ticketDTO.setId(Integer.parseInt(id));
                threadDTO.setTopicoDTO(null);
                threadDTO.setTicketDTO(ticketDTO);
            }

            threadDTO.setId(threadDAO.criarThread(threadDTO));

            List<ThreadDTO> listaThread = threadDAO.listarThread(tt, Integer.parseInt(id));
            req.setAttribute("listaThread", listaThread);
            req.getRequestDispatcher("WEB-INF/thread/mostraThread.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("mostrar".equalsIgnoreCase(tipo)) {
            String id = req.getParameter("id");
            String titulo = req.getParameter("titulo");
            String tt = req.getParameter("tt");
            if ("ticket".equalsIgnoreCase(tt)) {
                TicketDTO ticketDTO = ticketDAO.buscarTicket(Integer.parseInt(id));
                req.getSession().setAttribute("conteudoBusca", ticketDTO);
                req.setAttribute("tipoAcao", "ticket");
            } else {
                TopicoDTO topicoDTO = topicoDAO.buscaTopico(Integer.parseInt(id));
                req.getSession().setAttribute("conteudoBusca", topicoDTO);
                req.setAttribute("tipoAcao", "topico");
            }
            List<ThreadDTO> listaThread = threadDAO.listarThread(tt, Integer.parseInt(id));
            req.setAttribute("listaThread", listaThread);
            req.setAttribute("titulo", titulo);
            req.setAttribute("id", id);
            req.getSession().setAttribute("tt", tt);
            req.getRequestDispatcher("WEB-INF/thread/mostraThread.jsp").forward(req, resp);
        }

        if ("responderPostagem".equalsIgnoreCase(tipo)) {
            String autor = req.getParameter("autorThread");
            String titulo = req.getParameter("titulo");
            String mensagem = req.getParameter("mensagemThread");
            String id = req.getParameter("id");
            req.setAttribute("autor", autor);
            req.getSession().setAttribute("titulo", titulo);
            req.setAttribute("mensagem", mensagem);
            req.getSession().setAttribute("id", id);
            req.getRequestDispatcher("WEB-INF/thread/respostaThread.jsp").forward(req, resp);
        }

        if ("responder".equalsIgnoreCase(tipo)) {
            String titulo = req.getParameter("titulo");
            String id = req.getParameter("id");
            req.getSession().setAttribute("titulo", titulo);
            req.getSession().setAttribute("id", id);
            req.getRequestDispatcher("WEB-INF/thread/respostaThread.jsp").forward(req, resp);
        }

        if ("ticketRespondido".equalsIgnoreCase(tipo)) {
            String idThread = req.getParameter("idThread");
            String idConteudo = req.getParameter("idConteudo");
            usuarioBusiness.ticketRespondido(Integer.parseInt(idThread));
            ticketBusiness.ticketRespondido(Integer.parseInt(idConteudo));
            req.getRequestDispatcher("listar?tipo=tickets&situacao=user").forward(req, resp);
        }

        if ("reabrirThread".equalsIgnoreCase(tipo)) {
            String idConteudo = req.getParameter("idConteudo");
            String tipoAcao = req.getParameter("tipoAcao");
            if ("ticket".equalsIgnoreCase(tipoAcao)) {
                if (ticketBusiness.reabrirTicket(Integer.parseInt(idConteudo))) {
                    req.getRequestDispatcher("listar?tipo=tickets&situacao=user").forward(req, resp);
                }
            } else {
                if (topicoBusiness.reabrirTopico(Integer.parseInt(idConteudo))) {
                    req.getRequestDispatcher("topico?tipo=listarTopicos").forward(req, resp);
                }
            }
        }

        if ("fecharTopico".equalsIgnoreCase(tipo)){
            String idTopico = req.getParameter("id");
            if (topicoBusiness.fecharTopico(Integer.parseInt(idTopico))){
                req.getRequestDispatcher("topico?tipo=listarTopicos").forward(req, resp);
            }
        }
    }
}
