package br.edu.java.poo.dao.topico;

import br.edu.java.poo.model.topico.TopicoDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.util.List;

public interface TopicoDAO {

    int iniciaTopico(TopicoDTO topicoDTO);

    TopicoDTO pesquisaTopico(String palavraChave);

    List<TopicoDTO> listarTopicos();

    boolean finalizaTopico(TopicoDTO topicoDTO);
}
