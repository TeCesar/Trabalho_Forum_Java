package br.edu.java.poo.business.usuario.impl;

import br.edu.java.poo.business.usuario.UsuarioBusiness;
import br.edu.java.poo.model.usuario.UsuarioDTO;

public class UsuarioBusinessImpl implements UsuarioBusiness {

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

    public boolean confereAlteraUsuario(String nomeContaNovo, String senhaNovo, String nomeContaAntigo, String senhaAntigo){
        if (!nomeContaNovo.equalsIgnoreCase(nomeContaAntigo) || !senhaNovo.equalsIgnoreCase(senhaAntigo)){
            return true;
        }
        return false;
    }

}
