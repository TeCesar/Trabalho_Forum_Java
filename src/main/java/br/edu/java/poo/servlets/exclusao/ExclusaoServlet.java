package br.edu.java.poo.servlets.exclusao;

import br.edu.java.poo.services.exclusao.ExcluirClienteService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (urlPatterns = "/excluir")
public class ExclusaoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String acao = req.getParameter("acao");

        if ("empresa".equalsIgnoreCase(acao)){

        }

        if ("cliente".equalsIgnoreCase(acao)){
            ExcluirClienteService excluirClienteService = new ExcluirClienteService();
        }
    }
}
