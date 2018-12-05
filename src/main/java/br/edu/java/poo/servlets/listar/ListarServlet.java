package br.edu.java.poo.servlets.listar;

import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.ticket.TicketDAO;
import br.edu.java.poo.dao.ticket.impl.TicketDAOImpl;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/listar")
public class ListarServlet extends HttpServlet {
    ClienteDAO clienteDAO;
    EmpresaDAO empresaDAO;
    TicketDAO ticketDAO;
    UsuarioDAO usuarioDAO;

    public ListarServlet(){
        clienteDAO = new ClienteDAOImpl();
        empresaDAO = new EmpresaDAOImpl();
        ticketDAO = new TicketDAOImpl();
        usuarioDAO = new UsuarioDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("clientes".equalsIgnoreCase(tipo)) {
            List<ClienteDTO> listaClientes = clienteDAO.listarClientes();
            req.setAttribute("listaClientes", listaClientes);
            req.getRequestDispatcher("WEB-INF/listas/listaClientes.jsp").forward(req, resp);
        }

        if ("empresas".equalsIgnoreCase(tipo)) {
            List<EmpresaDTO> listaEmpresas = empresaDAO.buscarListaEmpresas();
            req.setAttribute("listaEmpresas", listaEmpresas);
            req.getRequestDispatcher("WEB-INF/listas/listaEmpresas.jsp").forward(req, resp);
        }

        if ("tickets".equalsIgnoreCase(tipo)) {
            String situacao = req.getParameter("situacao");
            if ("user".equalsIgnoreCase(situacao)) {
                UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuarioLogado");
                List<TicketDTO> listaTickets = ticketDAO.listarTicketsUser(usuarioSession.getId());
                req.setAttribute("listaTickets", listaTickets);
                req.getRequestDispatcher("WEB-INF/listas/listaTickets.jsp").forward(req, resp);
            }
        }

        if ("usuarios".equalsIgnoreCase(tipo)){
            List<UsuarioDTO> listaUsuarios = usuarioDAO.listarUsuarios("todos");
            req.setAttribute("listaUsuarios", listaUsuarios);
            req.getRequestDispatcher("WEB-INF/listas/listaUsuarios.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("clientes".equalsIgnoreCase(tipo)) {
            List<ClienteDTO> listaClientes = clienteDAO.listarClientes();
            req.setAttribute("listaClientes", listaClientes);
            req.getRequestDispatcher("WEB-INF/listas/listaClientes.jsp").forward(req, resp);
        }

        if ("empresas".equalsIgnoreCase(tipo)) {
            List<EmpresaDTO> listaEmpresas = empresaDAO.buscarListaEmpresas();
            req.setAttribute("listaEmpresas", listaEmpresas);
            req.getRequestDispatcher("WEB-INF/listas/listaEmpresas.jsp").forward(req, resp);
        }

        if ("usuarios".equalsIgnoreCase(tipo)){
            List<UsuarioDTO> listaUsuarios = usuarioDAO.listarUsuarios("todos");
            req.setAttribute("listaUsuarios", listaUsuarios);
            req.getRequestDispatcher("WEB-INF/listas/listaUsuarios.jsp").forward(req, resp);
        }

        if ("tickets".equalsIgnoreCase(tipo)) {
            String situacao = req.getParameter("situacao");
            if ("user".equalsIgnoreCase(situacao)) {
                UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuarioLogado");
                List<TicketDTO> listaTickets = ticketDAO.listarTicketsUser(usuarioSession.getId());
                req.setAttribute("listaTickets", listaTickets);
                req.getRequestDispatcher("WEB-INF/listas/listaTickets.jsp").forward(req, resp);
            } else {
                List<TicketDTO> listaTickets = ticketDAO.listarTicketsSituacao(situacao);
                req.setAttribute("listaTickets", listaTickets);
                req.getRequestDispatcher("WEB-INF/listas/listaTickets.jsp").forward(req, resp);
            }

        }

        if ("usuariosBloqueados".equalsIgnoreCase(tipo)){
            List<UsuarioDTO> listaUsuarios = usuarioDAO.listarUsuarios("bloqueados");
            req.setAttribute("listaUsuarios", listaUsuarios);
            req.getRequestDispatcher("WEB-INF/listas/listaUsuarios.jsp").forward(req, resp);
        }


    }
}
