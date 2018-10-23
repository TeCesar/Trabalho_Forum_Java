package br.edu.java.poo.business.usuario;

import br.edu.java.poo.model.usuario.UsuarioDTO;

public interface UsuarioBusiness {

    boolean conferePrimeiroLogin(UsuarioDTO usuarioDTO);
    String confereNovaSenha(String senha, String confirmaSenha);

}
