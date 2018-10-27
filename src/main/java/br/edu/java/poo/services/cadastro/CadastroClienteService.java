package br.edu.java.poo.services.cadastro;

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
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;
import br.edu.java.poo.model.endereco.UfDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CadastroClienteService {
    UfDAO ufDAO;
    EnderecoDAO enderecoDAO;
    EmpresaDAO empresaDAO;
    UsuarioDAO usuarioDAO;
    ClienteDAO clienteDAO;

    public CadastroClienteService(){
        ufDAO = new UfDAOImpl();
        enderecoDAO = new EnderecoDAOImpl();
        empresaDAO = new EmpresaDAOImpl();
        usuarioDAO = new UsuarioDAOImpl();
        clienteDAO = new ClienteDAOImpl();
    }

    public boolean cadastroCliente(String idUf, String nomeRua, String numeroCasa, String bairro, String cidade, String idEmpresa, String nome, String sobrenome, String dtNasc, String sexo, String nomeUsuario) {
        UfDTO ufBusca = ufDAO.buscarUf(Integer.parseInt(idUf));

        EnderecoDTO enderecoBusca = new EnderecoDTO();
        enderecoBusca.setRua(nomeRua);
        enderecoBusca.setNumeroCasa(numeroCasa);
        enderecoBusca.setBairro(bairro);
        enderecoBusca.setCidade(cidade);
        enderecoBusca = enderecoDAO.buscaEndereco(enderecoBusca, Integer.parseInt(idUf));

        EmpresaDTO empresaBusca = empresaDAO.buscarEmpresa(Integer.parseInt(idEmpresa));

        ClienteDTO clienteDTO = new ClienteDTO();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        clienteDTO.setNome(nome);
        clienteDTO.setSobrenome(sobrenome);
        try {
            clienteDTO.setDtNascimento(dateFormat.parse(dtNasc));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        clienteDTO.setSexo(sexo.charAt(0));

        UsuarioDTO usuarioDTO = new UsuarioDTO();
        usuarioDTO.setNomeConta(nomeUsuario);
        usuarioDTO.setSenha("12345");
        usuarioDTO.setTipoAcesso("Cliente");
        Date date = new Date();
        String data = dateFormat.format(date);
        try {
            usuarioDTO.setDataDeCadastro(dateFormat.parse(data));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        usuarioDTO.setId(usuarioDAO.criarUsuarioCliente(usuarioDTO));

        clienteDTO.setUsuarioDTO(usuarioDTO);
        clienteDTO.setEnderecoDTO(enderecoBusca);
        clienteDTO.setEmpresaDTO(empresaBusca);
        clienteDTO.getEnderecoDTO().setUfDTO(ufBusca);

        if (clienteDAO.cadastrarCliente(clienteDTO)){
            return true;
        }
        return false;
    }

}
