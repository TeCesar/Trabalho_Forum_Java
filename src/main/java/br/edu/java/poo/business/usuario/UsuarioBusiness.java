package br.edu.java.poo.business.usuario;

import br.edu.java.poo.model.usuario.UsuarioDTO;

public interface UsuarioBusiness {

    UsuarioDTO criarClientePadrao(UsuarioDTO usuarioDTO);

    String alteraSenha(String senha, String confirmaSenha, String nomeConta);

    void aumentaErroLogin(String nomeConta);

    boolean mudarBloqueioUsuario(int id);

    boolean criarOperador(String nomeUsuario);

    boolean ticketRespondido(int id);

    boolean novoUsuario(String nomeConta);

}
