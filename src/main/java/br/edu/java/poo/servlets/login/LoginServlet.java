package br.edu.java.poo.servlets.login;

import br.edu.java.poo.business.acao.AcaoBusiness;
import br.edu.java.poo.business.acao.impl.AcaoBusinessImpl;
import br.edu.java.poo.business.usuario.UsuarioBusiness;
import br.edu.java.poo.business.usuario.impl.UsuarioBusinessImpl;
import br.edu.java.poo.model.acao.AcaoDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;
import br.edu.java.poo.services.login.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private LoginService loginService;
    UsuarioBusiness usuarioBusiness;
    AcaoBusiness acaoBusiness;

    public LoginServlet(){
        loginService = new LoginService();
        usuarioBusiness = new UsuarioBusinessImpl();
        acaoBusiness = new AcaoBusinessImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("logar".equalsIgnoreCase(tipo)) {
            String login = req.getParameter("nomeUsuario");
            String senha = req.getParameter("senha");

            UsuarioDTO usuarioDTO = new UsuarioDTO();

            usuarioDTO.setNomeConta(login);
            usuarioDTO.setSenha(senha);

            String logado = "";
            UsuarioSession usuarioSession = null;

            try {
                logado = loginService.login(usuarioDTO);
                usuarioSession = new UsuarioSession(usuarioDTO.getId(), usuarioDTO.getNomeConta(), usuarioDTO.getTipoAcesso());
                req.getSession().setAttribute("usuarioLogado", usuarioSession);
                Cookie cookieUsuarioLogado = new Cookie("usuarioLogado", usuarioDTO.getNomeConta());
                resp.addCookie(cookieUsuarioLogado);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                System.out.println("Falha na conexao");
            }
            if ("usuarioBloqueado".equalsIgnoreCase(logado)){
                req.setAttribute("erro", logado);
                logado = "/login.jsp";
            } else if ("loginSenhaErrados".equalsIgnoreCase(logado)){
                req.setAttribute("erro", logado);
                logado = "/login.jsp";
            } else {
                AcaoDTO acaoDTO = new AcaoDTO();
                acaoDTO.setUsuarioSession(usuarioSession);
                acaoBusiness.insereAcaoLogin(acaoDTO);
            }
            req.getRequestDispatcher(logado).forward(req, resp);
        }

        if ("alteraSenha".equalsIgnoreCase(tipo)){
            String novaSenha = req.getParameter("novaSenha");
            String confirmaSenha = req.getParameter("confirmaSenha");
            UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuarioLogado");
            String sucesso = usuarioBusiness.alteraSenha(novaSenha, confirmaSenha, usuarioSession.getNomeConta());
            if ("sucesso".equalsIgnoreCase(sucesso)){
                req.getRequestDispatcher("WEB-INF/menus/menuPrincipal.jsp").forward(req, resp);
            } else {
                req.setAttribute("erro", sucesso);
                req.getRequestDispatcher("WEB-INF/novaSenha.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("logoff".equalsIgnoreCase(tipo)){
            req.getSession().removeAttribute("usuarioLogado");
            resp.sendRedirect("login.jsp");
        }
    }
}
