package br.edu.java.poo.validators.cliente;

import br.edu.java.poo.business.exceptions.CadastrarClienteException;
import br.edu.java.poo.model.cliente.ClienteDTO;

public interface ClienteValidator {

    boolean validaCliente(ClienteDTO clienteDTO) throws CadastrarClienteException;
}
