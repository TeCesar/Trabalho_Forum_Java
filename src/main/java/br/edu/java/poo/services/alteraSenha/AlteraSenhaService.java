package br.edu.java.poo.services.alteraSenha;

import br.edu.java.poo.business.UsuarioBusiness;
import br.edu.java.poo.business.impl.UsuarioBusinessImpl;
import br.edu.java.poo.dao.UsuarioDAO;
import br.edu.java.poo.dao.impl.UsuarioDAOImpl;

public class AlteraSenhaService {

    UsuarioBusiness usuarioBusiness;
    UsuarioDAO usuarioDAO;

    public AlteraSenhaService (){
        this.usuarioBusiness = new UsuarioBusinessImpl();
        this.usuarioDAO = new UsuarioDAOImpl();
    }

    public boolean atualizaSenha (String senha, String confirmaSenha, String nomeConta){

        boolean senhaValida = usuarioBusiness.confereNovaSenha(senha, confirmaSenha);
        if (senhaValida){
            if(usuarioDAO.alteraSenha(senha, nomeConta)){
               return true;
            }
        }
        return false;

    }
}
