package br.edu.java.poo.services.edicao;

import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.endereco.EnderecoDAO;
import br.edu.java.poo.dao.endereco.impl.EnderecoDAOImpl;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.cliente.ClienteDTO;

public class EditaClienteService {
    ClienteDAO clienteDAO;
    EnderecoDAO enderecoDAO;
    UsuarioDAO usuarioDAO;

    public EditaClienteService(){
        clienteDAO = new ClienteDAOImpl();
        enderecoDAO = new EnderecoDAOImpl();
        usuarioDAO = new UsuarioDAOImpl();
    }

    public boolean editaCliente(ClienteDTO clienteDTO, boolean altera){
        if (clienteDTO != null){
            enderecoDAO.atualizaEndereco(clienteDTO.getEnderecoDTO());
            usuarioDAO.atualizaUsuario(clienteDTO.getUsuarioDTO(), altera);
            clienteDAO.atualizaCliente(clienteDTO);
        }
        return false;
    }
}
