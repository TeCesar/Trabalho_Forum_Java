package br.edu.java.poo.business.usuario.impl;

import br.edu.java.poo.business.usuario.UsuarioBusiness;
import br.edu.java.poo.dao.usuario.UsuarioDAO;
import br.edu.java.poo.dao.usuario.impl.UsuarioDAOImpl;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UsuarioBusinessImpl implements UsuarioBusiness {
    UsuarioDAO usuarioDAO;

    public UsuarioBusinessImpl(){
        usuarioDAO = new UsuarioDAOImpl();
    }

    @Override
    public UsuarioDTO criarClientePadrao(UsuarioDTO usuarioDTO) {
        if (usuarioDTO != null){
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
}
