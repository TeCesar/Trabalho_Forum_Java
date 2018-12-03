package br.edu.java.poo.validators.usuario.impl;

import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.validators.usuario.UsuarioValidator;

public class UsuarioValidatorImpl implements UsuarioValidator {

    @Override
    public boolean conferePrimeiroLogin(UsuarioDTO usuarioDTO) {
        if ("12345".equalsIgnoreCase(usuarioDTO.getSenha())) {
            return true;
        }
        return false;
    }

    @Override
    public String confereNovaSenha(String senha, String confirmaSenha) {
        if (senha != null && confirmaSenha != null) {
            if (senha.equalsIgnoreCase(confirmaSenha)) {
                if (!"12345".equalsIgnoreCase(senha)) {
                    if (senha.length() < 8) {
                        return "caracteres";
                    }

                    if (!senha.contains("@") && !senha.contains(".") && !senha.contains("#")) {
                        return "caractereEspecial";
                    }

                    return "sucesso";
                }

            } else {
                return "senhasDiferentes";
            }
        }
        return "vazia";
    }

    @Override
    public boolean confereAlteraUsuario(UsuarioDTO usuarioDTO, String nomeContaAntigo, String senhaAntigo) {
        if (usuarioDTO.getNomeConta().equalsIgnoreCase(nomeContaAntigo) && usuarioDTO.getSenha().equalsIgnoreCase(senhaAntigo)){
            return true;
        }
        return false;
    }
}
