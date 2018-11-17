package br.edu.java.poo.servlets.thread;

import br.edu.java.poo.dao.thread.ThreadDAO;
import br.edu.java.poo.dao.thread.impl.ThreadDAOImpl;
import br.edu.java.poo.model.thread.ThreadDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (urlPatterns = "/thread")
public class ThreadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("threadTopico".equalsIgnoreCase(tipo)){

        }

        if ("threadTicket".equalsIgnoreCase(tipo)){

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("mostrarTopico".equalsIgnoreCase(tipo)){
            ThreadDAO threadDAO = new ThreadDAOImpl();
            String idTopico = req.getParameter("id");
            List<ThreadDTO> listaThread = threadDAO.listarThread("topico", Integer.parseInt(idTopico));
            req.setAttribute("listaThread", listaThread);
            req.getRequestDispatcher("WEB-INF/thread/mostraThread.jsp").forward(req, resp);
        }

        if ("threadTicket".equalsIgnoreCase(tipo)){

        }
    }
}
