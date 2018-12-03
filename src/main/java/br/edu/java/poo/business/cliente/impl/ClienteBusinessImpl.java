package br.edu.java.poo.business.cliente.impl;

import br.edu.java.poo.business.cliente.ClienteBusiness;
import br.edu.java.poo.business.exceptions.CadastrarClienteException;
import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.endereco.EnderecoDAO;
import br.edu.java.poo.dao.endereco.impl.EnderecoDAOImpl;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.validators.cliente.ClienteValidator;
import br.edu.java.poo.validators.cliente.impl.ClienteValidatorImpl;
import br.edu.java.poo.validators.usuario.UsuarioValidator;
import br.edu.java.poo.validators.usuario.impl.UsuarioValidatorImpl;

public class ClienteBusinessImpl implements ClienteBusiness {
    ClienteValidator clienteValidator;
    UsuarioValidator usuarioValidator;
    ClienteDAO clienteDAO;
    EnderecoDAO enderecoDAO;

    public ClienteBusinessImpl() {
        clienteValidator = new ClienteValidatorImpl();
        usuarioValidator = new UsuarioValidatorImpl();
        clienteDAO = new ClienteDAOImpl();
        enderecoDAO = new EnderecoDAOImpl();
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
            if (!usuarioValidator.confereAlteraUsuario(clienteDTO.getUsuarioDTO(), nomeUsuarioAntigo, senhaUsuarioAntiga)) {
                return false;
            }

            if (clienteDAO.atualizaCliente(clienteDTO)) {
                enderecoDAO.atualizaEndereco(clienteDTO.getEnderecoDTO());
                return true;
            }
        }
        return false;
    }
}
