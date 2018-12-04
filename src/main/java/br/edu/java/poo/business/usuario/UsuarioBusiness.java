package br.edu.java.poo.business.usuario;

import br.edu.java.poo.model.usuario.UsuarioDTO;

public interface UsuarioBusiness {

    UsuarioDTO criarClientePadrao(UsuarioDTO usuarioDTO);

    String alteraSenha(String senha, String confirmaSenha, String nomeConta);

}
