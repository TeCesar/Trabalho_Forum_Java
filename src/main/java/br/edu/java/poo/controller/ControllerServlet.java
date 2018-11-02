package br.edu.java.poo.controller;

import br.edu.java.poo.model.usuario.UsuarioSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/controller")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String acao = req.getParameter("acao");

        if ("login".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("login").forward(req, resp);
        }

        if ("novaSenha".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("novaSenha").forward(req, resp);
        }

        if ("criarTicket".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("ticket?tipo=fimTicket").forward(req, resp);
        }

        if ("cadastroCliente".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("cadastro?tipo=cliente").forward(req, resp);
        }

        if ("cadastroEmpresa".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("cadastro?tipo=empresa").forward(req, resp);
        }

        if ("editarEmpresa".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("editar?tipo=empresa").forward(req, resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String acao = req.getParameter("acao");

        if ("ticket".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("ticket?tipo=inicioTicket").forward(req, resp);
        }

        if ("menuPrincipal".equalsIgnoreCase(acao)) {
            UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuario");
            String tipo = "";
            if ("operador".equalsIgnoreCase(usuarioSession.getTipoAcesso())) {
                tipo = "menuOperador.jsp";
            } else if ("cliente".equalsIgnoreCase(usuarioSession.getTipoAcesso())) {
                tipo = "menuCliente.jsp";
            } else if ("usuario".equalsIgnoreCase(usuarioSession.getTipoAcesso())) {
                tipo = "menuUsuario.jsp";
            } else if ("administrador".equalsIgnoreCase(usuarioSession.getTipoAcesso())) {
                tipo = "menuAdministrador.jsp";
            }
            req.getRequestDispatcher("WEB-INF/menus/" + tipo).forward(req, resp);
        }

        if ("cadastroCliente".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("cadastro?tipo=cliente").forward(req, resp);
        }

        if ("cadastroEmpresa".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("cadastro?tipo=empresa").forward(req, resp);
        }

        if ("tickets".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("WEB-INF/ticket/ticket.jsp").forward(req, resp);
        }

        if ("listarClientes".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("listar?tipo=clientes").forward(req, resp);
        }

        if ("listarEmpresas".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("listar?tipo=empresas").forward(req, resp);
        }

        if ("editarEmpresa".equalsIgnoreCase(acao)) {
            String id = req.getParameter("idEmpresa");
            req.getRequestDispatcher("editar?tipo=empresa&idEmpresa=" + id).forward(req, resp);
        }

        if ("editarCliente".equalsIgnoreCase(acao)) {
            String id = req.getParameter("idCliente");
            req.getRequestDispatcher("editar?tipo=cliente&idCliente=" + id).forward(req, resp);
        }

    }
}
