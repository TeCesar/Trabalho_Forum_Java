package br.edu.java.poo.dao.cliente;

import br.edu.java.poo.model.cliente.ClienteDTO;

import java.util.List;

public interface ClienteDAO {

    boolean cadastrarCliente(ClienteDTO clienteDTO);

    List<ClienteDTO> listarClientes();

    ClienteDTO buscaCliente(int id);

    boolean atualizaCliente(ClienteDTO clienteDTO);

    boolean excluirCliente(int id);

    boolean mudarEmpresaClientes(int idEmpresaVazia, int idEmpresa);

}
