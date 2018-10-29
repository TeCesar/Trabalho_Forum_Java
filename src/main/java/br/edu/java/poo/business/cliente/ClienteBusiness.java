package br.edu.java.poo.business.cliente;

import br.edu.java.poo.business.exceptions.CadastrarClienteException;

public interface ClienteBusiness {

    boolean validaCliente(String nome, String sobrenome, String dtNasc, String sexo) throws CadastrarClienteException;
}
