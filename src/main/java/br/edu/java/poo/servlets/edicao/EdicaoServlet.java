package br.edu.java.poo.servlets.edicao;

import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.uf.UfDAO;
import br.edu.java.poo.dao.uf.impl.UfDAOImpl;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.UfDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (urlPatterns = "/editar")
public class EdicaoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("empresa".equalsIgnoreCase(tipo)){
            String idEmpresa = req.getParameter("idEmpresaEdit");
            String nomeEmpresa = req.getParameter("nomeEmpresaEdit");
            String cnpjEmpresa = req.getParameter("cnpjEmpresaEdit");
            String razaoSocialEmpresa = req.getParameter("razaoSocialEmpresaEdit");
            String enderecoIdEmpresa = req.getParameter("enderecoIdEmpresaEdit");
            String ruaEmpresa = req.getParameter("ruaEmpresaEdit");
            String numeroEmpresa = req.getParameter("numeroEmpresaEdit");
            String bairroEmpresa = req.getParameter("bairroEmpresaEdit");
            String cidadeEmpresa = req.getParameter("cidadeEmpresaEdit");
            String idUf = req.getParameter("ufIdEmpresaEdit");

            EmpresaDTO empresaDTO = new EmpresaDTO();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");
        String id = req.getParameter("id");

        if ("empresa".equalsIgnoreCase(tipo)){
            EmpresaDAO empresaDAO = new EmpresaDAOImpl();
            UfDAO ufDAO = new UfDAOImpl();
            EmpresaDTO empresaBusca = empresaDAO.buscarEmpresa(Integer.parseInt(id));
            List<UfDTO> listaUfs = ufDAO.buscarListaUfs();
            req.getSession().setAttribute("empresaBusca", empresaBusca);
            req.getSession().setAttribute("listaUfs", listaUfs);
            req.getRequestDispatcher("WEB-INF/edicao/editarEmpresa.jsp").forward(req, resp);
        }
    }
}
