package br.edu.java.poo.servlets.cadastro;

import br.edu.java.poo.business.cliente.ClienteBusiness;
import br.edu.java.poo.business.cliente.impl.ClienteBusinessImpl;
import br.edu.java.poo.business.empresa.EmpresaBusiness;
import br.edu.java.poo.business.empresa.impl.EmpresaBusinessImpl;
import br.edu.java.poo.business.usuario.UsuarioBusiness;
import br.edu.java.poo.business.usuario.impl.UsuarioBusinessImpl;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.uf.UfDAO;
import br.edu.java.poo.dao.uf.impl.UfDAOImpl;
import br.edu.java.poo.mapper.BaseMapper;
import br.edu.java.poo.mapper.impl.ClienteMapperImpl;
import br.edu.java.poo.mapper.impl.EmpresaMapperImpl;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.UfDTO;

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
    EmpresaBusiness empresaBusiness;
    ClienteBusiness clienteBusiness;
    UsuarioBusiness usuarioBusiness;
    BaseMapper<HttpServletRequest, ClienteDTO> clienteMapper;
    BaseMapper<HttpServletRequest, EmpresaDTO> empresaMapper;

    public CadastroServlet() {
        ufDAO = new UfDAOImpl();
        empresaDAO = new EmpresaDAOImpl();
        empresaBusiness = new EmpresaBusinessImpl();
        clienteBusiness = new ClienteBusinessImpl();
        usuarioBusiness = new UsuarioBusinessImpl();
        clienteMapper = new ClienteMapperImpl();
        empresaMapper = new EmpresaMapperImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("cliente".equalsIgnoreCase(tipo)) {
            ClienteDTO clienteDTO = clienteMapper.doMap(req);

            if (clienteBusiness.cadastrarCliente(clienteDTO)) {
                req.getRequestDispatcher("WEB-INF/cadastros/cadastroCliente.jsp").forward(req, resp);
            }
//            req.setAttribute("erro", e.getMessage());
//            req.setAttribute("mostraErroGet", "sim");
//            req.getRequestDispatcher("WEB-INF/cadastros/cadastroCliente.jsp").forward(req, resp);
        }

        if ("empresa".equalsIgnoreCase(tipo)) {
            EmpresaDTO empresaDTO = empresaMapper.doMap(req);
            if (empresaBusiness.cadastrarEmpresa(empresaDTO)) {
                req.getRequestDispatcher("WEB-INF/cadastros/cadastroEmpresa.jsp").forward(req, resp);
            }
        }

        if ("operador".equalsIgnoreCase(tipo)) {
            String nomeUsuario = req.getParameter("nomeUsuario");
            if (usuarioBusiness.criarOperador(nomeUsuario)) {
                req.getRequestDispatcher("listar?tipo=usuarios").forward(req, resp);
            }
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

        if ("operador".equalsIgnoreCase(tipo)) {
            req.getRequestDispatcher("WEB-INF/cadastros/cadastroOperador.jsp").forward(req, resp);
        }
    }
}
