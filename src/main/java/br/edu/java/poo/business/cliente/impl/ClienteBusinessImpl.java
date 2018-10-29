package br.edu.java.poo.business.cliente.impl;

import br.edu.java.poo.business.cliente.ClienteBusiness;
import br.edu.java.poo.business.exceptions.CadastrarClienteException;
import br.edu.java.poo.model.cliente.ClienteDTO;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ClienteBusinessImpl implements ClienteBusiness {

    @Override
    public boolean validaCliente(String nome, String sobrenome, String dtNasc, String sexo) throws CadastrarClienteException {
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

            if (!dtNasc.substring(2, 3).equalsIgnoreCase("/") || !dtNasc.substring(5, 6).equalsIgnoreCase("/")) {
                throw new CadastrarClienteException("Data inválida.");
            }
        }
        return false;
    }
}
