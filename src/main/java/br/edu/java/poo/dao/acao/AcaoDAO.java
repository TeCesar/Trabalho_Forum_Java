package br.edu.java.poo.dao.acao;

import br.edu.java.poo.model.acao.AcaoDTO;

public interface AcaoDAO {

    boolean insereAcao(AcaoDTO acaoDTO);

    boolean insereAcaoLogin(AcaoDTO acaoDTO);
}
