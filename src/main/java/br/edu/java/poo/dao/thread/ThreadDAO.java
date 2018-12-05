package br.edu.java.poo.dao.thread;

import br.edu.java.poo.model.thread.ThreadDTO;

import java.util.List;

public interface ThreadDAO {

    int criarThread(ThreadDTO threadDTO);

    List<ThreadDTO> listarThread(String tipo, int id);

    String buscaNomeAutor(String tipo, int id);

    ThreadDTO buscaThread(int id, String tipo);

    boolean atualizaEdicaoThread(ThreadDTO threadDTO);

}
