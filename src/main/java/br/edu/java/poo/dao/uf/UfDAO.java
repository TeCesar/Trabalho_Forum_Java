package br.edu.java.poo.dao.uf;

import br.edu.java.poo.model.endereco.UfDTO;

import java.util.List;

public interface UfDAO {

    List<UfDTO> buscarListaUfs();

    UfDTO buscarUf(int id);

}
