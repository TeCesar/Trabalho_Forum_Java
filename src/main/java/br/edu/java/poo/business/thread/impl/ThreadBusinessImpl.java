package br.edu.java.poo.business.thread.impl;

import br.edu.java.poo.business.thread.ThreadBusiness;
import br.edu.java.poo.dao.thread.ThreadDAO;
import br.edu.java.poo.dao.thread.impl.ThreadDAOImpl;
import br.edu.java.poo.model.thread.ThreadDTO;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ThreadBusinessImpl implements ThreadBusiness {
    ThreadDAO threadDAO;

    public ThreadBusinessImpl(){
        threadDAO = new ThreadDAOImpl();
    }

    @Override
    public boolean alteraMensagem(int id, String mensagem, String tipo, String editor) {
        ThreadDTO threadDTO = threadDAO.buscaThread(id, tipo);
        if (threadDTO != null){
            threadDTO.setMensagem(mensagem);

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String dataAtual = dateFormat.format(new Date());

            try {
                threadDTO.setDataAlteracao(dateFormat.parse(dataAtual));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            threadDTO.setUsuarioEdicao(editor);

            if (threadDAO.atualizaEdicaoThread(threadDTO)){
                return true;
            }
        }
        return false;
    }
}
