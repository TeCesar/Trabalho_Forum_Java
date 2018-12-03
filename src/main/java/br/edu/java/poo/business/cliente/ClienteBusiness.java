package br.edu.java.poo.business.cliente;

import br.edu.java.poo.model.cliente.ClienteDTO;

public interface ClienteBusiness {

    boolean cadastrarCliente(ClienteDTO clienteDTO);

    boolean excluirCliente(int id);

    boolean editarCliente(ClienteDTO clienteDTO, String nomeUsuarioAntigo, String senhaUsuarioAntiga);

}
