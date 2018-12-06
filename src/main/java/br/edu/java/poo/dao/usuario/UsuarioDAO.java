package br.edu.java.poo.dao.usuario;

import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.util.List;

public interface UsuarioDAO {

    UsuarioDTO validarUsuario(UsuarioDTO usuarioDTO) throws ClassNotFoundException;

    boolean alteraSenha(String senha, String nomeConta);

    int criarUsuarioCliente(UsuarioDTO usuarioDTO);

    boolean atualizaUsuario(UsuarioDTO usuarioDTO);

    UsuarioDTO buscarUsuario(int id);

    UsuarioDTO buscarUsuarioPorNome(String nomeConta);

    boolean atualizaErrosLogin(UsuarioDTO usuarioDTO);

    List<UsuarioDTO> listarUsuarios(String tipo);

    boolean mudarBloqueioUsuario(UsuarioDTO usuarioDTO);

    boolean criarUsuario(UsuarioDTO usuarioDTO);

    boolean aumentaTicketsResolvidos(UsuarioDTO usuarioDTO);

    boolean aumentaTicketsReabertos(UsuarioDTO usuarioDTO);
}
