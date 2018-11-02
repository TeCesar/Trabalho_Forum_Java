package br.edu.java.poo.servlets.edicao;

import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.uf.UfDAO;
import br.edu.java.poo.dao.uf.impl.UfDAOImpl;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;
import br.edu.java.poo.model.endereco.UfDTO;
import br.edu.java.poo.services.edicao.EditaEmpresaService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/editar")
public class EdicaoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("empresa".equalsIgnoreCase(tipo)) {
            EditaEmpresaService editaEmpresaService = new EditaEmpresaService();
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
            EnderecoDTO enderecoDTO = new EnderecoDTO();
            UfDTO ufDTO = new UfDTO();

            ufDTO.setId(Integer.parseInt(idUf));

            enderecoDTO.setId(Integer.parseInt(enderecoIdEmpresa));
            enderecoDTO.setRua(ruaEmpresa);
            enderecoDTO.setNumeroEndereco(numeroEmpresa);
            enderecoDTO.setBairro(bairroEmpresa);
            enderecoDTO.setCidade(cidadeEmpresa);

            empresaDTO.setId(Integer.parseInt(idEmpresa));
            empresaDTO.setNomeFantasia(nomeEmpresa);
            empresaDTO.setCnpj(cnpjEmpresa);
            empresaDTO.setRazaoSocial(razaoSocialEmpresa);
            empresaDTO.setEnderecoDTO(enderecoDTO);

            empresaDTO.getEnderecoDTO().setUfDTO(ufDTO);

            editaEmpresaService.editaEmpresa(empresaDTO);

            req.getRequestDispatcher("listar?tipo=empresas").forward(req, resp);
        }

        if ("cliente".equalsIgnoreCase(tipo)) {

        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");
        UfDAO ufDAO = new UfDAOImpl();
        List<UfDTO> listaUfs = ufDAO.buscarListaUfs();
        req.getSession().setAttribute("listaUfs", listaUfs);

        if ("empresa".equalsIgnoreCase(tipo)) {
            String id = req.getParameter("idEmpresa");
            EmpresaDAO empresaDAO = new EmpresaDAOImpl();
            EmpresaDTO empresaBusca = empresaDAO.buscarEmpresa(Integer.parseInt(id));
            req.getSession().setAttribute("empresaBusca", empresaBusca);
            req.getRequestDispatcher("WEB-INF/edicao/editarEmpresa.jsp").forward(req, resp);
        }

        if ("cliente".equalsIgnoreCase(tipo)) {
            String id = req.getParameter("idCliente");
            ClienteDAO clienteDAO = new ClienteDAOImpl();
            ClienteDTO clienteBusca = clienteDAO.buscaCliente(Integer.parseInt(id));
            req.getSession().setAttribute("clienteBusca", clienteBusca);
            req.getRequestDispatcher("WEB-INF/edicao/editarCliente.jsp").forward(req, resp);
        }
    }
}
