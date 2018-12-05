package br.edu.java.poo.business.acao;

import br.edu.java.poo.model.acao.AcaoDTO;

public interface AcaoBusiness {

    boolean insereAcao(AcaoDTO acaoDTO);

    boolean insereAcaoLogin(AcaoDTO acaoDTO);

}
