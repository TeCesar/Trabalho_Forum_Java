package br.edu.java.poo.servlets.relatorios;

import br.edu.java.poo.business.ticket.TicketBusiness;
import br.edu.java.poo.business.ticket.impl.TicketBusinessImpl;
import br.edu.java.poo.dao.acao.AcaoDAO;
import br.edu.java.poo.dao.acao.impl.AcaoDAOImpl;
import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.ticket.TicketDAO;
import br.edu.java.poo.dao.ticket.impl.TicketDAOImpl;
import br.edu.java.poo.dao.topico.TopicoDAO;
import br.edu.java.poo.dao.topico.impl.TopicoDAOImpl;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.acao.AcaoDTO;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.topico.TopicoDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/relatorio")
public class RelatoriosServlet extends HttpServlet {
    ClienteDAO clienteDAO;
    EmpresaDAO empresaDAO;
    UsuarioDAO usuarioDAO;
    TicketDAO ticketDAO;
    TopicoDAO topicoDAO;
    AcaoDAO acaoDAO;
    TicketBusiness ticketBusiness;

    public RelatoriosServlet() {
        clienteDAO = new ClienteDAOImpl();
        empresaDAO = new EmpresaDAOImpl();
        usuarioDAO = new UsuarioDAOImpl();
        ticketDAO = new TicketDAOImpl();
        topicoDAO = new TopicoDAOImpl();
        acaoDAO = new AcaoDAOImpl();
        ticketBusiness = new TicketBusinessImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("clienteEmpresa".equalsIgnoreCase(tipo)) {
            List<EmpresaDTO> listaEmpresas = empresaDAO.buscarListaEmpresas();
            List<ClienteDTO> listaClientes = clienteDAO.listarClientes();
            req.setAttribute("listaEmpresas", listaEmpresas);
            req.setAttribute("listaClientes", listaClientes);
            req.getRequestDispatcher("WEB-INF/relatorios/clienteEmpresaRelatorio.jsp").forward(req, resp);
        }

        if ("listaUsuarios".equalsIgnoreCase(tipo)) {
            List<UsuarioDTO> listaUsuarios = usuarioDAO.listarUsuarios("todos");
            req.setAttribute("listaUsuarios", listaUsuarios);
            req.getRequestDispatcher("WEB-INF/relatorios/usuariosRelatorio.jsp").forward(req, resp);
        }

        if ("ticketsCliente".equalsIgnoreCase(tipo)) {
            List<TicketDTO> listaTickets;
            String situacao = req.getParameter("situacao");
            List<ClienteDTO> listaClientes = clienteDAO.listarClientes();
            if ("semResposta".equalsIgnoreCase(situacao)) {
                listaTickets = ticketDAO.listarTicketsSituacao("Sem Resposta");
            } else if ("listaSemResposta".equalsIgnoreCase(situacao)) {
                listaTickets = ticketDAO.listarTicketsSituacao("Sem Resposta");
            } else {
                listaTickets = ticketDAO.listarTicketsSituacao(situacao);
            }
            req.setAttribute("listaClientes", listaClientes);
            req.setAttribute("listaTickets", listaTickets);
            req.getRequestDispatcher("WEB-INF/relatorios/ticketsPorClienteRelatorio.jsp").forward(req, resp);
        }

        if ("logAcesso".equalsIgnoreCase(tipo)) {
            List<AcaoDTO> listaAcoes = acaoDAO.listaLogAcesso();
            req.setAttribute("listaAcoes", listaAcoes);
            req.setAttribute("tipoLog", "acesso");
            req.getRequestDispatcher("WEB-INF/relatorios/logs.jsp").forward(req, resp);
        }

        if ("acoes".equalsIgnoreCase(tipo)) {
            List<AcaoDTO> listaAcoes = acaoDAO.listaAcoes();
            req.setAttribute("listaAcoes", listaAcoes);
            req.setAttribute("tipoLog", "acao");
            req.getRequestDispatcher("WEB-INF/relatorios/logs.jsp").forward(req, resp);
        }

        if ("duracaoTT".equalsIgnoreCase(tipo)) {
            List<TopicoDTO> listaTopicos = topicoDAO.listarTopicosTempo();
            req.setAttribute("listaTopicos", listaTopicos);
            List<TicketDTO> listaTickets = ticketDAO.listarTicketsTempo();
            req.setAttribute("listaTickets", listaTickets);
            req.getRequestDispatcher("WEB-INF/relatorios/duracaoTT.jsp").forward(req, resp);
        }

        if ("errosLoginTckResolvido".equalsIgnoreCase(tipo)) {
            List<UsuarioDTO> listaUsuarios = usuarioDAO.listarUsuarios("todos");
            req.setAttribute("listaUsuarios", listaUsuarios);
            req.getRequestDispatcher("WEB-INF/relatorios/errosLoginTcksResolvidos.jsp").forward(req, resp);
        }

        if ("qtdTicketsCliente".equalsIgnoreCase(tipo)){
            List<ClienteDTO> listaClientes = clienteDAO.listarClientes();
            req.setAttribute("listaClientes", listaClientes);
            req.setAttribute("mostraDetalhe", "nao");
            req.getRequestDispatcher("WEB-INF/relatorios/relatorioQuantidades.jsp").forward(req, resp);
        }

        if ("pesquisaClienteQtd".equalsIgnoreCase(tipo)){
            String idCliente = req.getParameter("selecionaCliente");
            req.setAttribute("mostraDetalhe", "sim");
            ClienteDTO clienteDTO = clienteDAO.buscaCliente(Integer.parseInt(idCliente));
            req.setAttribute("clienteBusca", clienteDTO);
            List<TicketDTO> listaTickets = ticketDAO.listarTicketsUser(clienteDTO.getUsuarioDTO().getId());
            int quantidadeTickets = listaTickets.size();
            req.setAttribute("quantidadeTickets", quantidadeTickets);
            listaTickets = ticketDAO.listarTicketsUserSit(clienteDTO.getUsuarioDTO().getId(), "Aberto");
            int quantidadeTicketsSemResposta = listaTickets.size();
            req.setAttribute("quantidadeTicketsSemResposta", quantidadeTicketsSemResposta);
            listaTickets = ticketDAO.listarTicketsUserSit(clienteDTO.getUsuarioDTO().getId(), "Fechado");
            int quantidadeTicketsRespondidos = listaTickets.size();
            req.setAttribute("quantidadeTicketsRespondidos", quantidadeTicketsRespondidos);
            List<ClienteDTO> listaClientes = clienteDAO.listarClientes();
            req.setAttribute("listaClientes", listaClientes);
            req.getRequestDispatcher("WEB-INF/relatorios/relatorioQuantidades.jsp").forward(req, resp);
        }
    }
}
