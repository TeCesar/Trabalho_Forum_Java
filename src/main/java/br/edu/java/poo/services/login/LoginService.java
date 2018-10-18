package br.edu.java.poo.services.login;

import br.edu.java.poo.dao.UsuarioDAO;
import br.edu.java.poo.dao.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.usuario.UsuarioDTO;

public class LoginService {
    UsuarioDAO usuarioDAO;

    public LoginService() {
        this.usuarioDAO = new UsuarioDAOImpl();
    }

    public boolean login(UsuarioDTO usuarioDTO) {
        UsuarioDTO confere = usuarioDAO.buscarUsuario(usuarioDTO);
        if (confere != null) {
            return true;
        }
        return false;
    }

}
