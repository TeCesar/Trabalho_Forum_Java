package br.edu.java.poo.servlets.relatorios;

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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (urlPatterns = "/relatorio")
public class RelatoriosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("clienteEmpresa".equalsIgnoreCase(tipo)){
            EmpresaDAO empresaDAO = new EmpresaDAOImpl();
            ClienteDAO clienteDAO = new ClienteDAOImpl();
            List<EmpresaDTO> listaEmpresas = empresaDAO.buscarListaEmpresas();
            List<ClienteDTO> listaClientes = clienteDAO.listarClientes();
            req.getSession().setAttribute("listaEmpresas", listaEmpresas);
            req.getSession().setAttribute("listaClientes", listaClientes);
            req.getRequestDispatcher("WEB-INF/relatorios/clienteEmpresaRelatorio.jsp").forward(req, resp);
        }

        if ("listaUsuarios".equalsIgnoreCase(tipo)){
            UsuarioDAO usuarioDAO = new UsuarioDAOImpl();
            List<UsuarioDTO> listaUsuarios = usuarioDAO.listarUsuarios();
            req.getSession().setAttribute("listaUsuarios", listaUsuarios);
            req.getRequestDispatcher("WEB-INF/relatorios/usuariosRelatorio.jsp").forward(req, resp);
        }

        if ("ticketsCliente".equalsIgnoreCase(tipo)){
            ClienteDAO clienteDAO = new ClienteDAOImpl();
            UsuarioDAO usuarioDAO = new UsuarioDAOImpl();
            TicketDAO ticketDAO = new TicketDAOImpl();
            List<ClienteDTO> listaClientes = clienteDAO.listarClientes();
            List<UsuarioDTO> listaUsuarios = usuarioDAO.listarUsuarios();
            List<TicketDTO> listaTickets = ticketDAO.listarTickets("todos");
        }
    }
}
