package br.edu.java.poo.validators.usuario;

import br.edu.java.poo.model.usuario.UsuarioDTO;

public interface UsuarioValidator {

    boolean conferePrimeiroLogin(UsuarioDTO usuarioDTO);

    String confereNovaSenha(String senha, String confirmaSenha);

    boolean confereAlteraUsuario(UsuarioDTO usuarioDTO, String nomeContaAntigo, String senhaAntigo);

}
