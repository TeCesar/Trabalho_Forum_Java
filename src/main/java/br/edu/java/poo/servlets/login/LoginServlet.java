package br.edu.java.poo.servlets.login;

import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;
import br.edu.java.poo.services.login.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private LoginService loginService = new LoginService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("nomeUsuario");
        String senha = req.getParameter("senha");

        UsuarioDTO usuarioDTO = new UsuarioDTO();

        usuarioDTO.setNomeConta(login);
        usuarioDTO.setSenha(senha);

        String logado = "";

        try {
            logado = loginService.login(usuarioDTO);
            UsuarioSession usuarioSession = new UsuarioSession(usuarioDTO.getId(), usuarioDTO.getNomeConta(), usuarioDTO.getTipoAcesso());
            req.getSession().setAttribute("usuario", usuarioSession);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Falha na conexao");
        }

        if ("administrador".equalsIgnoreCase(logado)) {
            req.getRequestDispatcher("WEB-INF/menus/menuAdministrador.jsp").forward(req, resp);
        } else  if ("usuarioInexistente".equalsIgnoreCase(logado)){
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else if ("primeiroAcesso".equalsIgnoreCase(logado)){
            req.getRequestDispatcher("WEB-INF/novaSenha.jsp").forward(req, resp);
        } else if ("operador".equalsIgnoreCase(logado)){
            req.getRequestDispatcher("WEB-INF/menus/menuOperador.jsp").forward(req, resp);
        } else if ("cliente".equalsIgnoreCase(logado)){
            req.getRequestDispatcher("WEB-INF/menus/menuCliente.jsp").forward(req, resp);
        }
    }
}
