package br.edu.java.poo.servlets.cadastro;

import br.edu.java.poo.business.exceptions.CadastrarClienteException;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.uf.UfDAO;
import br.edu.java.poo.dao.uf.impl.UfDAOImpl;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.UfDTO;
import br.edu.java.poo.services.cadastro.CadastroClienteService;
import br.edu.java.poo.services.cadastro.CadastroEmpresaService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/cadastro")
public class CadastroServlet extends HttpServlet {
    UfDAO ufDAO;
    EmpresaDAO empresaDAO;
    CadastroClienteService cadastroClienteService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");
        if ("cliente".equalsIgnoreCase(tipo)) {
            cadastroClienteService = new CadastroClienteService();

            String idUf = req.getParameter("clienteUfId");
            String nomeRua = req.getParameter("clienteNomeRua");
            String numeroCasa = req.getParameter("clienteNumeroCasa");
            String bairro = req.getParameter("clienteBairro");
            String cidade = req.getParameter("clienteCidade");
            String idEmpresa = req.getParameter("clienteEmpresaId");
            String nome = req.getParameter("clienteNome");
            String sobrenome = req.getParameter("clienteSobrenome");
            String dtNasc = req.getParameter("clienteDtNasc");
            String sexo = req.getParameter("clienteSexo");
            String nomeUsuario = req.getParameter("clienteNomeUsuario");

            try {
                if (cadastroClienteService.cadastroCliente(idUf, nomeRua, numeroCasa, bairro, cidade, idEmpresa, nome, sobrenome, dtNasc, sexo, nomeUsuario)) {
                    req.getRequestDispatcher("WEB-INF/cadastros/cadastroCliente.jsp").forward(req, resp);
                }
            } catch (CadastrarClienteException e) {
                e.printStackTrace();
                req.getSession().setAttribute("erro", e.getMessage());
                req.getSession().setAttribute("mostraErroGet", "sim");
                req.getRequestDispatcher("WEB-INF/cadastros/cadastroCliente.jsp").forward(req, resp);
            }

        }

        if ("empresa".equalsIgnoreCase(tipo)) {
            CadastroEmpresaService cadastroEmpresaService = new CadastroEmpresaService();

            String razaoSocial = req.getParameter("razaoSocial");
            String nomeFantasia = req.getParameter("nomeFantasia");
            String cnpj = req.getParameter("cnpj");
            String nomeRua = req.getParameter("empresaNomeRua");
            String numeroEndereco = req.getParameter("empresaNumeroEndereco");
            String bairro = req.getParameter("empresaBairro");
            String cidade = req.getParameter("empresaCidade");
            String ufId = req.getParameter("empresaUfId");

            cadastroEmpresaService.cadastroEmpresa(razaoSocial, nomeFantasia, cnpj, nomeRua, numeroEndereco, bairro, cidade, ufId);
            req.getRequestDispatcher("WEB-INF/cadastros/cadastroEmpresa.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");
        String mostraErroGet = req.getParameter("mostraErroGet");
        req.getSession().setAttribute("mostraErro", "naoMostrar");

        if ("cliente".equalsIgnoreCase(tipo)) {
            ufDAO = new UfDAOImpl();
            empresaDAO = new EmpresaDAOImpl();
            List<UfDTO> listaUfs = ufDAO.buscarListaUfs();
            List<EmpresaDTO> listaEmpresas = empresaDAO.buscarListaEmpresas();
            req.getSession().setAttribute("listaUfs", listaUfs);
            req.getSession().setAttribute("listaEmpresas", listaEmpresas);
            req.getRequestDispatcher("WEB-INF/cadastros/cadastroCliente.jsp").forward(req, resp);
        }

        if ("sim".equalsIgnoreCase(mostraErroGet)) {
            req.getSession().setAttribute("mostraErro", "mostrar");
            req.getSession().setAttribute("mostraErroGet", false);
        }

        if ("empresa".equalsIgnoreCase(tipo)) {
            ufDAO = new UfDAOImpl();
            List<UfDTO> listaUfs = ufDAO.buscarListaUfs();
            req.getSession().setAttribute("listaUfs", listaUfs);
            req.getRequestDispatcher("WEB-INF/cadastros/cadastroEmpresa.jsp").forward(req, resp);
        }
    }
}
