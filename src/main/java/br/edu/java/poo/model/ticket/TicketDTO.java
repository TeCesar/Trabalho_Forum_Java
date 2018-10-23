package br.edu.java.poo.model.ticket;

import java.util.Date;

public class TicketDTO {
    private int id;
    private String titulo;
    private String mensagem;
    private String status;
    private String estado;
    private java.util.Date tempoInicio;
    private Date tempoFim;

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

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
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
}
