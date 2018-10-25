package br.edu.java.poo.dao.endereco;

import br.edu.java.poo.model.endereco.EnderecoDTO;

public interface EnderecoDAO {

    EnderecoDTO buscaEndereco(EnderecoDTO enderecoDTO, int ufId);
}
