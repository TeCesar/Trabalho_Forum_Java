package br.edu.java.poo.servlets.topico;

import br.edu.java.poo.dao.topico.TopicoDAO;
import br.edu.java.poo.dao.topico.impl.TopicoDAOImpl;
import br.edu.java.poo.model.topico.TopicoDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = "/topico")
public class TopicoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("criacao".equalsIgnoreCase(tipo)) {
            TopicoDAO topicoDAO = new TopicoDAOImpl();
            TopicoDTO topicoDTO = (TopicoDTO) req.getAttribute("novoTopico");
            String idTopico = req.getParameter("idTopico");
            String titulo = req.getParameter("tituloTopico");
            String mensagem = req.getParameter("mensagemTopico");

            topicoDTO.setId(Integer.parseInt(idTopico));
            topicoDTO.setTitulo(titulo);
            topicoDTO.setMensagem(mensagem);

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String data = dateFormat.format(new Date());

            try {
                topicoDTO.setDataAlteracao(dateFormat.parse(data));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            topicoDAO.finalizaTopico(topicoDTO);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("novoTopico".equalsIgnoreCase(tipo)) {
            TopicoDAO topicoDAO = new TopicoDAOImpl();
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            TopicoDTO topicoDTO = new TopicoDTO();
            UsuarioDTO usuarioDTO = (UsuarioDTO) req.getAttribute("usuarioSession");
            topicoDTO.setStatus("Incompleto");
            String data = dateFormat.format(new Date());

            try {
                topicoDTO.setDataCriacao(dateFormat.parse(data));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            topicoDTO.setUsuarioDTO(usuarioDTO);

            topicoDAO.iniciaTopico(topicoDTO);

            req.setAttribute("novoTopico", topicoDTO);

            req.getRequestDispatcher("WEB-INF/topico/novoTopico.jsp").forward(req, resp);
        }
    }
}
