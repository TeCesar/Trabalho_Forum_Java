package br.edu.java.poo.servlets.alteraSenha;

import br.edu.java.poo.services.alteraSenha.AlteraSenhaService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (urlPatterns = "/novaSenha")
public class AlteraSenhaServlet extends HttpServlet  {

    private static final long serialVersionUID = 1L;

    AlteraSenhaService alteraSenhaService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String senha = req.getParameter("novaSenha");
        String confirmaSenha = req.getParameter("confirmaSenha");
        String nomeConta = req.getParameter("nomeConta");

        alteraSenhaService = new AlteraSenhaService();
        boolean sucesso = alteraSenhaService.atualizaSenha(senha,confirmaSenha, nomeConta);

        if (sucesso){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(req, resp);
        }

    }
}
