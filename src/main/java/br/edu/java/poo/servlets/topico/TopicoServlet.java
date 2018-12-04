package br.edu.java.poo.servlets.topico;

import br.edu.java.poo.dao.thread.ThreadDAO;
import br.edu.java.poo.dao.thread.impl.ThreadDAOImpl;
import br.edu.java.poo.dao.topico.TopicoDAO;
import br.edu.java.poo.dao.topico.impl.TopicoDAOImpl;
import br.edu.java.poo.mapper.BaseMapper;
import br.edu.java.poo.mapper.impl.ThreadMapperImpl;
import br.edu.java.poo.mapper.impl.TopicoMapperImpl;
import br.edu.java.poo.model.thread.ThreadDTO;
import br.edu.java.poo.model.topico.TopicoDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/topico")
public class TopicoServlet extends HttpServlet {
    BaseMapper<HttpServletRequest, TopicoDTO> topicoMapper;
    BaseMapper<HttpServletRequest, ThreadDTO> threadMapper;
    TopicoDAO topicoDAO;
    ThreadDAO threadDAO;

    public TopicoServlet() {
        topicoMapper = new TopicoMapperImpl();
        threadMapper = new ThreadMapperImpl();
        topicoDAO = new TopicoDAOImpl();
        threadDAO = new ThreadDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("finalizaTopico".equalsIgnoreCase(tipo)) {
            req.getSession().setAttribute("tipoTopicoMapper", tipo);
            TopicoDTO topicoDTO = topicoMapper.doMap(req);
            req.setAttribute("threadMapperTopico", topicoDTO);
            req.setAttribute("tipoThreadMapper", "topico");
            ThreadDTO threadDTO = threadMapper.doMap(req);
            req.getSession().removeAttribute("novoTopico");

            if (topicoDAO.finalizaTopico(topicoDTO)) {
                threadDAO.criarThread(threadDTO);
                List<TopicoDTO> listaTopicos = topicoDAO.listarTopicos();
                req.setAttribute("listaTopicos", listaTopicos);
                req.getRequestDispatcher("WEB-INF/topico/listagemDeTopicos.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("criaTopico".equalsIgnoreCase(tipo)) {
            TopicoDAO topicoDAO = new TopicoDAOImpl();
            req.getSession().setAttribute("tipoTopicoMapper", tipo);
            TopicoDTO topicoDTO = topicoMapper.doMap(req);

            topicoDTO.setId(topicoDAO.iniciaTopico(topicoDTO));

            req.getSession().setAttribute("novoTopico", topicoDTO);

            req.getRequestDispatcher("WEB-INF/topico/novoTopico.jsp").forward(req, resp);
        }

        if ("listarTopicos".equalsIgnoreCase(tipo)) {
            TopicoDAO topicoDAO = new TopicoDAOImpl();
            List<TopicoDTO> listaTopicos = topicoDAO.listarTopicos();
            req.setAttribute("listaTopicos", listaTopicos);
            req.getRequestDispatcher("WEB-INF/topico/listagemDeTopicos.jsp").forward(req, resp);
        }
    }
}
