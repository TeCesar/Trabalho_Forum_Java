package br.edu.java.poo.servlets.edicao;

import br.edu.java.poo.business.usuario.UsuarioBusiness;
import br.edu.java.poo.business.usuario.impl.UsuarioBusinessImpl;
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
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.services.edicao.EditaClienteService;
import br.edu.java.poo.services.edicao.EditaEmpresaService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
            UsuarioBusiness usuarioBusiness = new UsuarioBusinessImpl();
            EditaClienteService editaClienteService = new EditaClienteService();
            String idCliente = req.getParameter("idClienteEdit");
            String nomeCliente = req.getParameter("nomeClienteEdit");
            String sobrenomeCliente = req.getParameter("sobrenomeClienteEdit");
            String dtNascCliente = req.getParameter("dtNascClienteEdit");
            String sexoCliente = req.getParameter("sexoClienteEdit");
            String idEnderecoCliente = req.getParameter("idEnderecoClienteEdit");
            String nomeRuaCliente = req.getParameter("nomeRuaClienteEdit");
            String bairroCliente = req.getParameter("bairroClienteEdit");
            String cidadeCliente = req.getParameter("cidadeClienteEdit");
            String idUfCliente = req.getParameter("idUfClienteEdit");
            String idEmpresaCliente = req.getParameter("idEmpresaClienteEdit");
            String idUsuarioCliente = req.getParameter("idUsuarioClienteEdit");
            String nomeContaCliente = req.getParameter("nomeContaUsuarioClienteEdit");
            String senhaCliente = req.getParameter("senhaUsuarioClienteEdit");
            String nomeContaAntigoCliente = req.getParameter("nomeContaUsuarioAntigoClienteEdit");
            String senhaAntigoCliente = req.getParameter("senhaAntigoClienteEdit");

            boolean altera = usuarioBusiness.confereAlteraUsuario(nomeCliente, senhaCliente, nomeContaAntigoCliente, senhaAntigoCliente);

            ClienteDTO clienteDTO = new ClienteDTO();
            EnderecoDTO enderecoDTO = new EnderecoDTO();
            EmpresaDTO empresaDTO = new EmpresaDTO();
            UfDTO ufDTO = new UfDTO();
            UsuarioDTO usuarioDTO = new UsuarioDTO();

            clienteDTO.setId(Integer.parseInt(idCliente));
            clienteDTO.setNome(nomeCliente);
            clienteDTO.setSobrenome(sobrenomeCliente);
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            try {
                clienteDTO.setDtNascimento(dateFormat.parse(dtNascCliente));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            clienteDTO.setSexo(sexoCliente);

            enderecoDTO.setId(Integer.parseInt(idEnderecoCliente));
            enderecoDTO.setRua(nomeRuaCliente);
            enderecoDTO.setBairro(bairroCliente);
            enderecoDTO.setCidade(cidadeCliente);
            ufDTO.setId(Integer.parseInt(idUfCliente));
            enderecoDTO.setUfDTO(ufDTO);

            empresaDTO.setId(Integer.parseInt(idEmpresaCliente));

            usuarioDTO.setId(Integer.parseInt(idUsuarioCliente));
            usuarioDTO.setNomeConta(nomeContaCliente);
            usuarioDTO.setSenha(senhaCliente);

            clienteDTO.setEnderecoDTO(enderecoDTO);
            clienteDTO.setEmpresaDTO(empresaDTO);

            editaClienteService.editaCliente(clienteDTO, altera);
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
            EmpresaDAO empresaDAO = new EmpresaDAOImpl();
            String id = req.getParameter("idCliente");
            List<EmpresaDTO> listaEmpresas = empresaDAO.buscarListaEmpresas();
            ClienteDAO clienteDAO = new ClienteDAOImpl();
            ClienteDTO clienteBusca = clienteDAO.buscaCliente(Integer.parseInt(id));
            req.getSession().setAttribute("clienteBusca", clienteBusca);
            req.getSession().setAttribute("listaEmpresas", listaEmpresas);
            req.getRequestDispatcher("WEB-INF/edicao/editarCliente.jsp").forward(req, resp);
        }
    }
}
