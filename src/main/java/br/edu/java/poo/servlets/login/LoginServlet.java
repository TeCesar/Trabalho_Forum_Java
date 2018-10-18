package br.edu.java.poo.servlets.login;

import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.services.login.LoginService;

import javax.servlet.RequestDispatcher;
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

        boolean logado = false;
        try {
            logado = loginService.login(usuarioDTO);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        if (logado) {
            req.getSession().setAttribute("usuario.logado", usuarioDTO);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("WEB-INF/menus/menuOperador.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/erro.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
}