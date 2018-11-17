package br.edu.java.poo.model.ticket;

import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.util.Date;

public class TicketDTO {
    private int id;
    private String titulo;
    private String status;
    private String situacao;
    private java.util.Date tempoInicio;
    private Date tempoFim;
    private String respondido;
    private UsuarioDTO usuarioDTO;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public Date getTempoFim() {
        return tempoFim;
    }

    public void setTempoFim(Date tempoFim) {
        this.tempoFim = tempoFim;
    }

    public Date getTempoInicio() {

        return tempoInicio;
    }

    public void setTempoInicio(Date tempoInicio) {
        this.tempoInicio = tempoInicio;
    }

    public String getRespondido() {
        return respondido;
    }

    public void setRespondido(String respondido) {
        this.respondido = respondido;
    }

    public UsuarioDTO getUsuarioDTO() {
        return usuarioDTO;
    }

    public void setUsuarioDTO(UsuarioDTO usuarioDTO) {
        this.usuarioDTO = usuarioDTO;
    }
}
