package br.edu.java.poo.services.login;

import br.edu.java.poo.business.usuario.UsuarioBusiness;
import br.edu.java.poo.business.usuario.impl.UsuarioBusinessImpl;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.validators.usuario.UsuarioValidator;
import br.edu.java.poo.validators.usuario.impl.UsuarioValidatorImpl;

public class LoginService {
    UsuarioDAO usuarioDAO;
    UsuarioValidator usuarioValidator;
    UsuarioBusiness usuarioBusiness;

    public LoginService() {
        this.usuarioDAO = new UsuarioDAOImpl();
        usuarioValidator = new UsuarioValidatorImpl();
        usuarioBusiness = new UsuarioBusinessImpl();
    }

    public String login(UsuarioDTO usuarioDTO) throws ClassNotFoundException {
        UsuarioDTO usuarioBusca = usuarioDAO.validarUsuario(usuarioDTO);

        if (usuarioBusca != null) {
            boolean primeiroAcesso = usuarioValidator.conferePrimeiroLogin(usuarioBusca);

            if (primeiroAcesso) {
                return "WEB-INF/novaSenha.jsp";
            } else {
                return "WEB-INF/menus/menuPrincipal.jsp";
            }
        } else {
            usuarioBusiness.aumentaErroLogin(usuarioDTO.getNomeConta());
        }
        return "/login.jsp";
    }

}
