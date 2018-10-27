package br.edu.java.poo.model.usuario;

import java.util.Date;

public class UsuarioDTO {
    private int Id;
    private String nomeConta;
    private String senha;
    private String tipoAcesso;
    private Date dataDeCadastro;
    private Date dataDeAlteracao;
    private String usuarioApelido;
    private int errosLogin;
    private int ticketsResolvidos;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getNomeConta() {
        return nomeConta;
    }

    public void setNomeConta(String nomeConta) {
        this.nomeConta = nomeConta;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTipoAcesso() {
        return tipoAcesso;
    }

    public void setTipoAcesso(String tipoAcesso) {
        this.tipoAcesso = tipoAcesso;
    }

    public Date getDataDeCadastro() {
        return dataDeCadastro;
    }

    public void setDataDeCadastro(Date dataDeCadastro) {
        this.dataDeCadastro = dataDeCadastro;
    }

    public Date getDataDeAlteracao() {
        return dataDeAlteracao;
    }

    public void setDataDeAlteracao(Date dataDeAlteracao) {
        this.dataDeAlteracao = dataDeAlteracao;
    }

    public String getUsuarioApelido() {
        return usuarioApelido;
    }

    public void setUsuarioApelido(String usuarioApelido) {
        this.usuarioApelido = usuarioApelido;
    }

    public int getErrosLogin() {
        return errosLogin;
    }

    public void setErrosLogin(int errosLogin) {
        this.errosLogin = errosLogin;
    }

    public int getTicketsResolvidos() {
        return ticketsResolvidos;
    }

    public void setTicketsResolvidos(int ticketsResolvidos) {
        this.ticketsResolvidos = ticketsResolvidos;
    }
}
