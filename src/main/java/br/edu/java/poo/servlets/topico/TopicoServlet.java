package br.edu.java.poo.servlets.topico;

import br.edu.java.poo.dao.topico.TopicoDAO;
import br.edu.java.poo.dao.topico.impl.TopicoDAOImpl;
import br.edu.java.poo.model.topico.TopicoDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;

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
import java.util.List;

@WebServlet(urlPatterns = "/topico")
public class TopicoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("finalizaTopico".equalsIgnoreCase(tipo)) {
            TopicoDAO topicoDAO = new TopicoDAOImpl();
            TopicoDTO topicoDTO = (TopicoDTO) req.getSession().getAttribute("novoTopico");
            req.getSession().removeAttribute("novoTopico");
            String titulo = req.getParameter("tituloTopico");
            String mensagem = req.getParameter("mensagemTopico");

            topicoDTO.setTitulo(titulo);
            topicoDTO.setMensagem(mensagem);
            topicoDTO.setStatus("Completo");

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String data = dateFormat.format(new Date());

            try {
                topicoDTO.setDataTermino(dateFormat.parse(data));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            if (topicoDAO.finalizaTopico(topicoDTO)) {
                req.getRequestDispatcher("WEB-INF/topico/novoTopico.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("criaTopico".equalsIgnoreCase(tipo)) {
            TopicoDAO topicoDAO = new TopicoDAOImpl();
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            TopicoDTO topicoDTO = new TopicoDTO();
            UsuarioDTO usuarioDTO = new UsuarioDTO();
            UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuario");
            usuarioDTO.setId(usuarioSession.getId());
            usuarioDTO.setNomeConta(usuarioSession.getNomeConta());
            usuarioDTO.setTipoAcesso(usuarioSession.getTipoAcesso());
            topicoDTO.setStatus("Incompleto");
            String data = dateFormat.format(new Date());

            try {
                topicoDTO.setDataCriacao(dateFormat.parse(data));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            topicoDTO.setUsuarioDTO(usuarioDTO);

            topicoDTO.setId(topicoDAO.iniciaTopico(topicoDTO));

            req.getSession().setAttribute("novoTopico", topicoDTO);

            req.getRequestDispatcher("WEB-INF/topico/novoTopico.jsp").forward(req, resp);
        }

        if ("listarTopicos".equalsIgnoreCase(tipo)) {
            TopicoDAO topicoDAO = new TopicoDAOImpl();
            List<TopicoDTO> listaTopicos = topicoDAO.listarTopicos();
            req.setAttribute("listaTopicos", listaTopicos);
        }
    }
}
