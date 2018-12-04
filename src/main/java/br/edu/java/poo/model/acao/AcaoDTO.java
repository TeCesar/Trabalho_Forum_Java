package br.edu.java.poo.model.acao;

import br.edu.java.poo.model.usuario.UsuarioSession;

public class AcaoDTO {
    private int id;
    private String acao;
    private String tipo;
    private UsuarioSession usuarioSession;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAcao() {
        return acao;
    }

    public void setAcao(String acao) {
        this.acao = acao;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public UsuarioSession getUsuarioSession() {
        return usuarioSession;
    }

    public void setUsuarioSession(UsuarioSession usuarioSession) {
        this.usuarioSession = usuarioSession;
    }
}
