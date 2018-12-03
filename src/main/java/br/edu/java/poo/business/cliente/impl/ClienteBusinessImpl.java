package br.edu.java.poo.business.cliente.impl;

import br.edu.java.poo.business.cliente.ClienteBusiness;
import br.edu.java.poo.business.exceptions.CadastrarClienteException;
import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.validators.cliente.ClienteValidator;
import br.edu.java.poo.validators.cliente.impl.ClienteValidatorImpl;

public class ClienteBusinessImpl implements ClienteBusiness {
    ClienteValidator clienteValidator;
    ClienteDAO clienteDAO;

    public ClienteBusinessImpl() {
        clienteValidator = new ClienteValidatorImpl();
        clienteDAO = new ClienteDAOImpl();
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
        if (id != 0){
            if (clienteDAO.excluirCliente(id)){
                return true;
            }
        }
        return false;
    }
}
