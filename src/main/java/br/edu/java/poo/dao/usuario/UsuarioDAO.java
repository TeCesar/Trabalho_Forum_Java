package br.edu.java.poo.dao.usuario;

import br.edu.java.poo.model.usuario.UsuarioDTO;

public interface UsuarioDAO {

    UsuarioDTO buscarUsuario(UsuarioDTO usuarioDTO) throws ClassNotFoundException;

    boolean alteraSenha(String senha, String nomeConta);

    int criarUsuarioCliente(UsuarioDTO usuarioDTO);



}
