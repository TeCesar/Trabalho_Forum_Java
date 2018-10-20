package br.edu.java.poo.model.usuario;

public class UsuarioSession {

    private int id;
    private String nomeConta;
    private String tipoAcesso;
    private boolean logado;

    public UsuarioSession(int id, String nomeConta, String tipoAcesso) {
        this.id = id;
        this.nomeConta = nomeConta;
        this.tipoAcesso = tipoAcesso;
        logado = true;
    }

    public void setLogado(boolean logado) {
        this.logado = logado;
    }

    public int getId() {
        return id;
    }

    public String getNomeConta() {
        return nomeConta;
    }

    public String getTipoAcesso() {
        return tipoAcesso;
    }

    public boolean isLogado() {
        return logado;
    }
}
