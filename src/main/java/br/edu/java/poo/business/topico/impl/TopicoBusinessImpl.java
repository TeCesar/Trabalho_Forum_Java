package br.edu.java.poo.business.topico.impl;

import br.edu.java.poo.business.topico.TopicoBusiness;
import br.edu.java.poo.dao.topico.TopicoDAO;
import br.edu.java.poo.dao.topico.impl.TopicoDAOImpl;
import br.edu.java.poo.model.topico.TopicoDTO;

public class TopicoBusinessImpl implements TopicoBusiness {
    TopicoDAO topicoDAO;

    public TopicoBusinessImpl(){
        topicoDAO = new TopicoDAOImpl();
    }

    @Override
    public boolean fecharTopico(int id) {
        TopicoDTO topicoDTO = topicoDAO.buscaTopico(id);
        if (topicoDTO != null){
            topicoDTO.setSituacao("Fechado");
            if (topicoDAO.mudarSituacaoTopico(topicoDTO)){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean reabrirTopico(int id) {
        TopicoDTO topicoDTO = topicoDAO.buscaTopico(id);
        if (topicoDTO != null){
            topicoDTO.setSituacao("Aberto");
            if (topicoDAO.mudarSituacaoTopico(topicoDTO)){
                return true;
            }
        }
        return false;
    }
}
