package br.edu.java.poo.servlets.alteraSenha;

import br.edu.java.poo.model.usuario.UsuarioSession;
import br.edu.java.poo.services.alteraSenha.AlteraSenhaService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/novaSenha")
public class AlteraSenhaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    AlteraSenhaService alteraSenhaService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String senha = req.getParameter("novaSenha");
        String confirmaSenha = req.getParameter("confirmaSenha");
        UsuarioSession usuario = (UsuarioSession) req.getSession().getAttribute("usuario");
        alteraSenhaService = new AlteraSenhaService();
        String sucesso = alteraSenhaService.atualizaSenha(senha, confirmaSenha, usuario.getNomeConta());

        if ("sucesso".equalsIgnoreCase(sucesso)) {
            if ("administrador".equalsIgnoreCase(usuario.getTipoAcesso())) {
                req.getRequestDispatcher("WEB-INF/menus/menuAdministrador.jsp").forward(req, resp);
            } else if ("operador".equalsIgnoreCase(usuario.getTipoAcesso())) {
                req.getRequestDispatcher("WEB-INF/menus/menuOperador.jsp").forward(req, resp);
            } else if ("cliente".equalsIgnoreCase(usuario.getTipoAcesso())) {
                req.getRequestDispatcher("WEB-INF/menus/menuCliente.jsp").forward(req, resp);
            } else if ("usuario".equalsIgnoreCase(usuario.getTipoAcesso())) {
                req.getRequestDispatcher("WEB-INF/menus/menuUsuario.jsp").forward(req, resp);
            }
        } else if ("caracteres".equalsIgnoreCase(sucesso)) {
            req.getSession().setAttribute("erro", "É necessário digitar pelo menos 8 caracteres.");
            req.getRequestDispatcher("WEB-INF/novaSenha.jsp").forward(req, resp);
        } else if ("caractereEspecial".equalsIgnoreCase(sucesso)) {
            req.getSession().setAttribute("erro", "É necessário ter ao menos 1(um) caractere especial (@, # ou .)");
            req.getRequestDispatcher("WEB-INF/novaSenha.jsp").forward(req, resp);
        } else if ("senhasDiferentes".equalsIgnoreCase(sucesso)) {
            req.getSession().setAttribute("erro", "As senhas não conferem");
            req.getRequestDispatcher("WEB-INF/novaSenha.jsp").forward(req, resp);
        } else {
            req.getSession().setAttribute("erro", "");
        }

    }
}
