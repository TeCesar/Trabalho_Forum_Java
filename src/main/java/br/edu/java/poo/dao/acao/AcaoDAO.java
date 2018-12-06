package br.edu.java.poo.dao.acao;

import br.edu.java.poo.model.acao.AcaoDTO;

import java.util.List;

public interface AcaoDAO {

    boolean insereAcao(AcaoDTO acaoDTO);

    boolean insereAcaoLogin(AcaoDTO acaoDTO);

    List<AcaoDTO> listaLogAcesso();

    List<AcaoDTO> listaAcoes();
}
