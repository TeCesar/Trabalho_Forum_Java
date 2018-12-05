package br.edu.java.poo.business.acao.impl;

import br.edu.java.poo.business.acao.AcaoBusiness;
import br.edu.java.poo.dao.acao.AcaoDAO;
import br.edu.java.poo.dao.acao.impl.AcaoDAOImpl;
import br.edu.java.poo.model.acao.AcaoDTO;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AcaoBusinessImpl implements AcaoBusiness {
    AcaoDAO acaoDAO;

    public AcaoBusinessImpl() {
        acaoDAO = new AcaoDAOImpl();
    }

    @Override
    public boolean insereAcao(AcaoDTO acaoDTO) {
        if (acaoDTO != null) {
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String dataAtual = dateFormat.format(new Date());
            try {
                acaoDTO.setDataAcao(dateFormat.parse(dataAtual));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            acaoDAO.insereAcao(acaoDTO);
        }
        return false;
    }

    @Override
    public boolean insereAcaoLogin(AcaoDTO acaoDTO) {
        if (acaoDTO != null){
            acaoDTO.setAcao("login");
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String dataAtual = dateFormat.format(new Date());
            try {
                acaoDTO.setDataAcao(dateFormat.parse(dataAtual));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            if (acaoDAO.insereAcaoLogin(acaoDTO)){
                return true;
            }
        }
        return false;
    }
}
