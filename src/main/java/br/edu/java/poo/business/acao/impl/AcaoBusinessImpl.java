package br.edu.java.poo.business.acao.impl;

import br.edu.java.poo.business.acao.AcaoBusiness;
import br.edu.java.poo.dao.acao.AcaoDAO;
import br.edu.java.poo.dao.acao.impl.AcaoDAOImpl;
import br.edu.java.poo.model.acao.AcaoDTO;

public class AcaoBusinessImpl implements AcaoBusiness {
    AcaoDAO acaoDAO;

    public AcaoBusinessImpl() {
        acaoDAO = new AcaoDAOImpl();
    }

    @Override
    public boolean insereAcao(AcaoDTO acaoDTO) {
        if (acaoDTO != null) {
            acaoDAO.insereAcao(acaoDTO);
        }
        return false;
    }
}
