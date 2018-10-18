package br.edu.java.poo.dao;

import br.edu.java.poo.model.usuario.UsuarioDTO;

public interface UsuarioDAO {

    UsuarioDTO buscarUsuario(UsuarioDTO usuarioDTO) throws ClassNotFoundException;

}
