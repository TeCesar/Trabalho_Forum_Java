package br.edu.java.poo.business.impl;

import br.edu.java.poo.business.UsuarioBusiness;
import br.edu.java.poo.model.usuario.UsuarioDTO;

public class UsuarioBusinessImpl implements UsuarioBusiness {

    @Override
    public boolean conferePrimeiroLogin(UsuarioDTO usuarioDTO) {
        if ("12345".equalsIgnoreCase(usuarioDTO.getSenha()) && !"administrador".equalsIgnoreCase(usuarioDTO.getTipoAcesso())){
            return true;
        }
        return false;
    }
}
