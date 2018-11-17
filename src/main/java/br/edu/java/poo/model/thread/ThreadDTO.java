package br.edu.java.poo.model.thread;

import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.topico.TopicoDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.util.Date;

public class ThreadDTO {
    private int id;
    private String mensagem;
    private String autor;
    private int autorPergunta;
    private Date dataPostagem;
    private TopicoDTO topicoDTO;
    private TicketDTO ticketDTO;
    private UsuarioDTO usuarioDTO;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public int getAutorPergunta() {
        return autorPergunta;
    }

    public void setAutorPergunta(int autorPergunta) {
        this.autorPergunta = autorPergunta;
    }

    public Date getDataPostagem() {
        return dataPostagem;
    }

    public void setDataPostagem(Date dataPostagem) {
        this.dataPostagem = dataPostagem;
    }

    public TopicoDTO getTopicoDTO() {
        return topicoDTO;
    }

    public void setTopicoDTO(TopicoDTO topicoDTO) {
        this.topicoDTO = topicoDTO;
    }

    public TicketDTO getTicketDTO() {
        return ticketDTO;
    }

    public void setTicketDTO(TicketDTO ticketDTO) {
        this.ticketDTO = ticketDTO;
    }

    public UsuarioDTO getUsuarioDTO() {
        return usuarioDTO;
    }

    public void setUsuarioDTO(UsuarioDTO usuarioDTO) {
        this.usuarioDTO = usuarioDTO;
    }
}
