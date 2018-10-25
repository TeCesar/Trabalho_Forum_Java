package br.edu.java.poo.servlets.cadastro;

import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.endereco.EnderecoDAO;
import br.edu.java.poo.dao.uf.UfDAO;
import br.edu.java.poo.dao.uf.impl.UfDAOImpl;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;
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
    ClienteDAO clienteDAO;
    UsuarioDAO usuarioDAO;
    EnderecoDAO enderecoDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ufDAO = new UfDAOImpl();
        empresaDAO = new EmpresaDAOImpl();
        clienteDAO = new ClienteDAOImpl();
        usuarioDAO = new UsuarioDAOImpl();

        String nome = req.getParameter("clienteNome");
        String sobrenome = req.getParameter("clienteSobrenome");
        String dtNasc = req.getParameter("clienteDtNasc");
        String sexo = req.getParameter("clienteSexo");
        String nomeRua = req.getParameter("clienteNomeRua");
        String numeroCasa = req.getParameter("clienteNumeroCasa");
        String bairro = req.getParameter("clienteBairro");
        String cidade = req.getParameter("clienteCidade");
        String idUf = req.getParameter("clienteUfId");
        String idEmpresa = req.getParameter("clienteEmpresaId");
        String nomeUsuario = req.getParameter("clienteNomeUsuario");

        ClienteDTO clienteDTO = new ClienteDTO();
        clienteDTO.setNome(nome);
        clienteDTO.setSobrenome(sobrenome);
        clienteDTO.setDtNascimento(dtNasc);
        clienteDTO.setSexo(sexo.charAt(0));

        EnderecoDTO enderecoBusca = new EnderecoDTO();
        enderecoBusca.setRua(nomeRua);
        enderecoBusca.setNumeroCasa(Integer.parseInt(numeroCasa));
        enderecoBusca.setBairro(bairro);
        enderecoBusca.setCidade(cidade);
        enderecoBusca = enderecoDAO.buscaEndereco(enderecoBusca, Integer.parseInt(idUf));
        UfDTO ufBusca = ufDAO.buscarUf(Integer.parseInt(idUf));
        EmpresaDTO empresaBusca = empresaDAO.buscarEmpresa(Integer.parseInt(idEmpresa));


        clienteDTO.getUsuarioDTO().setNomeConta(nomeUsuario);
        clienteDTO.getUsuarioDTO().setSenha("12345");
        clienteDTO.getUsuarioDTO().setTipoAcesso("Cliente");
        clienteDTO.getUsuarioDTO().setId(usuarioDAO.criarUsuarioCliente(clienteDTO.getUsuarioDTO()));

        clienteDTO.setEnderecoDTO(enderecoBusca);
        clienteDTO.setEmpresaDTO(empresaBusca);
        clienteDTO.getEnderecoDTO().setUfDTO(ufBusca);

        clienteDAO.cadastrarCliente(clienteDTO);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("cliente".equalsIgnoreCase(tipo)) {
            ufDAO = new UfDAOImpl();
            empresaDAO = new EmpresaDAOImpl();
            List<UfDTO> listaUfs = ufDAO.buscarListaUfs();
            List<EmpresaDTO> listaEmpresas = empresaDAO.buscarListaEmpresas();
            req.getSession().setAttribute("listaUfs", listaUfs);
            req.getSession().setAttribute("listaEmpresas", listaEmpresas);
            req.getRequestDispatcher("WEB-INF/cadastros/cadastroCliente.jsp").forward(req, resp);
        }
    }
}
