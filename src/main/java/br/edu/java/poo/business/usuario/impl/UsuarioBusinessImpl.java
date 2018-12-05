package br.edu.java.poo.business.usuario.impl;

import br.edu.java.poo.business.usuario.UsuarioBusiness;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.validators.usuario.UsuarioValidator;
import br.edu.java.poo.validators.usuario.impl.UsuarioValidatorImpl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UsuarioBusinessImpl implements UsuarioBusiness {
    UsuarioDAO usuarioDAO;
    UsuarioValidator usuarioValidator;

    public UsuarioBusinessImpl() {
        usuarioDAO = new UsuarioDAOImpl();
        usuarioValidator = new UsuarioValidatorImpl();
    }

    @Override
    public UsuarioDTO criarClientePadrao(UsuarioDTO usuarioDTO) {
        if (usuarioDTO != null) {
            usuarioDTO.setSenha("12345");
            usuarioDTO.setTipoAcesso("Cliente");
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String dataAtual = dateFormat.format(new Date());

            try {
                usuarioDTO.setDataDeCadastro(dateFormat.parse(dataAtual));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            usuarioDTO.setId(usuarioDAO.criarUsuarioCliente(usuarioDTO));

            return usuarioDTO;
        }
        return null;
    }

    @Override
    public String alteraSenha(String senha, String confirmaSenha, String nomeConta) {
        String senhaValida = usuarioValidator.confereNovaSenha(senha, confirmaSenha);
        if (senhaValida == "sucesso") {
            if (usuarioDAO.alteraSenha(senha, nomeConta)) {
                return "sucesso";
            }
        } else if ("caracteres".equalsIgnoreCase(senhaValida)) {
            return "caracteres";
        } else if ("caractereEspecial".equalsIgnoreCase(senhaValida)) {
            return "caractereEspecial";
        } else if ("senhasDiferentes".equalsIgnoreCase(senhaValida)) {
            return "senhasDiferentes";
        }
        return "invalida";
    }

    @Override
    public void aumentaErroLogin(String nomeConta) {
        UsuarioDTO usuarioBusca = usuarioDAO.buscarUsuarioPorNome(nomeConta);
        if (usuarioBusca != null) {
            usuarioBusca.setErrosLogin(usuarioBusca.getErrosLogin() + 1);
            usuarioDAO.atualizaErrosLogin(usuarioBusca);
        }
    }

    @Override
    public boolean mudarBloqueioUsuario(int id) {
        UsuarioDTO usuarioDTO = usuarioDAO.buscarUsuario(id);
        if (usuarioDTO.getBloqueado() == 0) {
            usuarioDTO.setBloqueado(1);
        } else {
            usuarioDTO.setBloqueado(0);
        }

        if (usuarioDAO.mudarBloqueioUsuario(usuarioDTO)) {
            return true;
        }
        return false;
    }

    @Override
    public boolean criarOperador(String nomeUsuario) {
        UsuarioDTO usuarioDTO = new UsuarioDTO();
        usuarioDTO.setNomeConta(nomeUsuario);
        usuarioDTO.setSenha("12345");
        usuarioDTO.setTipoAcesso("Operador");
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String dataAtual = dateFormat.format(new Date());
        try {
            usuarioDTO.setDataDeCadastro(dateFormat.parse(dataAtual));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (usuarioDAO.criarOperador(usuarioDTO)) {
            return true;
        }
        return false;
    }

    @Override
    public boolean ticketRespondido(int id) {
        UsuarioDTO usuarioDTO = usuarioDAO.buscarUsuario(id);
        if (usuarioDTO != null){
            usuarioDTO.setTicketsResolvidos(usuarioDTO.getTicketsResolvidos()+1);
            if (usuarioDAO.aumentaTicketsResolvidos(usuarioDTO)){
                return true;
            }
        }
        return false;
    }
}
