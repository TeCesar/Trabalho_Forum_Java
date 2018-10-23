package br.edu.java.poo.controller;

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

        if ("novaSenha".equalsIgnoreCase(acao)){
            req.getRequestDispatcher("novaSenha").forward(req, resp);
        }
        if("criarTicket".equalsIgnoreCase(acao)){
            req.getRequestDispatcher("ticket?tipo=fimTicket").forward(req, resp);
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String acao = req.getParameter("acao");

        if ("ticket".equalsIgnoreCase(acao)){
            req.getRequestDispatcher("ticket?tipo=inicioTicket").forward(req, resp);
        }

    }
}
