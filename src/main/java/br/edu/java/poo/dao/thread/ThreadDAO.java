package br.edu.java.poo.dao.thread;

import br.edu.java.poo.model.thread.ThreadDTO;

import java.util.List;

public interface ThreadDAO {

    int criarThread(ThreadDTO threadDTO);

    List<ThreadDTO> listarThread(String tipo, int id);

}
