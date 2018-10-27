package br.edu.java.poo.servlets.cadastro;

import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.endereco.EnderecoDAO;
import br.edu.java.poo.dao.endereco.impl.EnderecoDAOImpl;
import br.edu.java.poo.dao.uf.UfDAO;
import br.edu.java.poo.dao.uf.impl.UfDAOImpl;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.UfDTO;
import br.edu.java.poo.services.cadastro.CadastroClienteService;

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
        cadastroClienteService = new CadastroClienteService();

        String idUf = req.getParameter("clienteUfId");
        //UfDTO ufBusca = ufDAO.buscarUf(Integer.parseInt(idUf));

        String nomeRua = req.getParameter("clienteNomeRua");
        String numeroCasa = req.getParameter("clienteNumeroCasa");
        String bairro = req.getParameter("clienteBairro");
        String cidade = req.getParameter("clienteCidade");
//        EnderecoDTO enderecoBusca = new EnderecoDTO();
//        enderecoBusca.setRua(nomeRua);
//        enderecoBusca.setNumeroCasa(numeroCasa);
//        enderecoBusca.setBairro(bairro);
//        enderecoBusca.setCidade(cidade);
//        enderecoBusca = enderecoDAO.buscaEndereco(enderecoBusca, Integer.parseInt(idUf));

        String idEmpresa = req.getParameter("clienteEmpresaId");
//        EmpresaDTO empresaBusca = empresaDAO.buscarEmpresa(Integer.parseInt(idEmpresa));

        String nome = req.getParameter("clienteNome");
        String sobrenome = req.getParameter("clienteSobrenome");
        String dtNasc = req.getParameter("clienteDtNasc");
        String sexo = req.getParameter("clienteSexo");

//        ClienteDTO clienteDTO = new ClienteDTO();
//        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//        clienteDTO.setNome(nome);
//        clienteDTO.setSobrenome(sobrenome);
//        try {
//            clienteDTO.setDtNascimento(dateFormat.parse(dtNasc));
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        clienteDTO.setSexo(sexo.charAt(0));

        String nomeUsuario = req.getParameter("clienteNomeUsuario");
//        UsuarioDTO usuarioDTO = new UsuarioDTO();
//        usuarioDTO.setNomeConta(nomeUsuario);
//        usuarioDTO.setSenha("12345");
//        usuarioDTO.setTipoAcesso("Cliente");
//        Date date = new Date();
//        String data = dateFormat.format(date);
//        try {
//            usuarioDTO.setDataDeCadastro(dateFormat.parse(data));
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        usuarioDTO.setId(usuarioDAO.criarUsuarioCliente(usuarioDTO));
//
//        clienteDTO.setUsuarioDTO(usuarioDTO);
//        clienteDTO.setEnderecoDTO(enderecoBusca);
//        clienteDTO.setEmpresaDTO(empresaBusca);
//        clienteDTO.getEnderecoDTO().setUfDTO(ufBusca);
//
//        clienteDAO.cadastrarCliente(clienteDTO);
        if(cadastroClienteService.cadastroCliente(idUf, nomeRua, numeroCasa, bairro, cidade, idEmpresa, nome, sobrenome, dtNasc, sexo, nomeUsuario)){
            req.getSession().setAttribute("cadastroSucess", "Cadastro Realizado com sucesso.");
            req.getRequestDispatcher("WEB-INF/cadastros/cadastroCliente.jsp").forward(req, resp);
        }

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
