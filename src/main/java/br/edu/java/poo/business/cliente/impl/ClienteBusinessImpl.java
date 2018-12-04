package br.edu.java.poo.business.cliente.impl;

import br.edu.java.poo.business.cliente.ClienteBusiness;
import br.edu.java.poo.business.exceptions.CadastrarClienteException;
import br.edu.java.poo.business.usuario.UsuarioBusiness;
import br.edu.java.poo.business.usuario.impl.UsuarioBusinessImpl;
import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.endereco.EnderecoDAO;
import br.edu.java.poo.dao.endereco.impl.EnderecoDAOImpl;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.validators.cliente.ClienteValidator;
import br.edu.java.poo.validators.cliente.impl.ClienteValidatorImpl;
import br.edu.java.poo.validators.usuario.UsuarioValidator;
import br.edu.java.poo.validators.usuario.impl.UsuarioValidatorImpl;

public class ClienteBusinessImpl implements ClienteBusiness {
    ClienteValidator clienteValidator;
    UsuarioValidator usuarioValidator;
    ClienteDAO clienteDAO;
    EnderecoDAO enderecoDAO;
    UsuarioDAO usuarioDAO;
    UsuarioBusiness usuarioBusiness;

    public ClienteBusinessImpl() {
        clienteValidator = new ClienteValidatorImpl();
        usuarioValidator = new UsuarioValidatorImpl();
        clienteDAO = new ClienteDAOImpl();
        enderecoDAO = new EnderecoDAOImpl();
        usuarioDAO = new UsuarioDAOImpl();
        usuarioBusiness = new UsuarioBusinessImpl();
    }

    @Override
    public boolean cadastrarCliente(ClienteDTO clienteDTO) {
        if (clienteDTO != null) {
            try {
                clienteValidator.validaCliente(clienteDTO);
            } catch (CadastrarClienteException e) {
                e.printStackTrace();
                return false;
            }

            EnderecoDTO enderecoBusca = enderecoDAO.buscaEndereco(clienteDTO.getEnderecoDTO(), clienteDTO.getEnderecoDTO().getUfDTO().getId());
            UsuarioDTO usuarioBusca = usuarioBusiness.criarClientePadrao(clienteDTO.getUsuarioDTO());

            clienteDTO.setEnderecoDTO(enderecoBusca);
            clienteDTO.setUsuarioDTO(usuarioBusca);

            if (clienteDAO.cadastrarCliente(clienteDTO)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean excluirCliente(int id) {
        if (id != 0) {
            if (clienteDAO.excluirCliente(id)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean editarCliente(ClienteDTO clienteDTO, String nomeUsuarioAntigo, String senhaUsuarioAntiga) {
        if (clienteDTO != null) {
//            if (!usuarioValidator.confereAlteraUsuario(clienteDTO.getUsuarioDTO(), nomeUsuarioAntigo, senhaUsuarioAntiga)) {
//                return false;
//            }

            if (clienteDAO.atualizaCliente(clienteDTO)) {
                enderecoDAO.atualizaEndereco(clienteDTO.getEnderecoDTO());
                usuarioDAO.atualizaUsuario(clienteDTO.getUsuarioDTO());
                return true;
            }
        }
        return false;
    }
}
