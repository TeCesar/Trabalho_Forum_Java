package br.edu.java.poo.validators.cliente.impl;

import br.edu.java.poo.business.exceptions.CadastrarClienteException;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.validators.cliente.ClienteValidator;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class ClienteValidatorImpl implements ClienteValidator {

    @Override
    public boolean validaCliente(ClienteDTO clienteDTO) throws CadastrarClienteException {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        if (clienteDTO != null) {
            for (char c : clienteDTO.getNome().toCharArray()) {
                if (Character.isDigit(c)) {
                    throw new CadastrarClienteException("O nome não pode conter números.");
                }
            }

            for (char c : clienteDTO.getSobrenome().toCharArray()) {
                if (Character.isDigit(c)) {
                    throw new CadastrarClienteException("O sobrenome não pode conter números.");
                }
            }

            if (!dateFormat.format(clienteDTO.getDtNascimento()).substring(2, 3).equalsIgnoreCase("/") || !dateFormat.format(clienteDTO.getDtNascimento()).substring(5, 6).equalsIgnoreCase("/")) {
                throw new CadastrarClienteException("Data inválida.");
            }

            return true;
        }
        return false;
    }
}
