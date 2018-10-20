package br.edu.java.poo.business.impl;

import br.edu.java.poo.business.UsuarioBusiness;
import br.edu.java.poo.model.usuario.UsuarioDTO;

public class UsuarioBusinessImpl implements UsuarioBusiness  {

    @Override
    public boolean conferePrimeiroLogin(UsuarioDTO usuarioDTO) {
        if ("12345".equalsIgnoreCase(usuarioDTO.getSenha())){
            return true;
        }
        return false;
    }

    @Override
    public boolean confereNovaSenha(String senha, String confirmaSenha) {
        if (senha != null && confirmaSenha != null){
            if (senha.equalsIgnoreCase(confirmaSenha)){
                if (!"12345".equalsIgnoreCase(senha)){
                    return true;
                }
            }
        }
        return false;
    }

}
