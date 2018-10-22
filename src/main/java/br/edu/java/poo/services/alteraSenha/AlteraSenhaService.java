package br.edu.java.poo.services.alteraSenha;

import br.edu.java.poo.business.UsuarioBusiness;
import br.edu.java.poo.business.impl.UsuarioBusinessImpl;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;

public class AlteraSenhaService {

    UsuarioBusiness usuarioBusiness;
    UsuarioDAO usuarioDAO;

    public AlteraSenhaService() {
        this.usuarioBusiness = new UsuarioBusinessImpl();
        this.usuarioDAO = new UsuarioDAOImpl();
    }

    public String atualizaSenha(String senha, String confirmaSenha, String nomeConta) {
        String senhaValida = usuarioBusiness.confereNovaSenha(senha, confirmaSenha);
        if (senhaValida == "sucesso") {
            if (usuarioDAO.alteraSenha(senha, nomeConta)) {
                return "sucesso";
            }
        } else if ("caracteres".equalsIgnoreCase(senhaValida)) {
            return "caracteres";
        } else if ("caractereEspecial".equalsIgnoreCase(senhaValida)) {
            return "caractereEspecial";
        } else if ("senhasDiferentes".equalsIgnoreCase(senhaValida)){
            return "senhasDiferentes";
        }
        return "invalida";
    }
}
