package br.edu.java.poo.dao.usuario;

import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.util.List;

public interface UsuarioDAO {

    UsuarioDTO validarUsuario(UsuarioDTO usuarioDTO) throws ClassNotFoundException;

    boolean alteraSenha(String senha, String nomeConta);

    int criarUsuarioCliente(UsuarioDTO usuarioDTO);

    boolean atualizaUsuario(UsuarioDTO usuarioDTO, boolean altera);

    UsuarioDTO buscarUsuario(int id);

    List<UsuarioDTO> listarUsuarios();
}
