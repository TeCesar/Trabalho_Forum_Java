package br.edu.java.poo.mapper.impl;

import br.edu.java.poo.mapper.BaseMapper;
import br.edu.java.poo.model.thread.ThreadDTO;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.topico.TopicoDTO;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ThreadMapperImpl implements BaseMapper<HttpServletRequest, ThreadDTO> {

    @Override
    public ThreadDTO doMap(HttpServletRequest req) {
        ThreadDTO threadBusca = new ThreadDTO();
        DateFormat dateFormat = new SimpleDateFormat();
        String tipoThreadMapper = (String) req.getAttribute("tipoThreadMapper");
        if ("topico".equalsIgnoreCase(tipoThreadMapper)) {
            TopicoDTO topicoDTO = (TopicoDTO) req.getAttribute("threadMapperTopico");
            String mensagem = req.getParameter("mensagemTopico");

            threadBusca.setMensagem(mensagem);
            threadBusca.setAutor(topicoDTO.getUsuarioDTO().getNomeConta());
            threadBusca.setAutorPergunta(1);
            threadBusca.setTopicoDTO(topicoDTO);
            threadBusca.setUsuarioDTO(topicoDTO.getUsuarioDTO());
        } else {
            String mensagem = req.getParameter("mensagemTicket");

            TicketDTO ticketDTO = (TicketDTO) req.getAttribute("threadMapperTicket");

            threadBusca.setMensagem(mensagem);
            threadBusca.setAutor(ticketDTO.getUsuarioDTO().getNomeConta());
            threadBusca.setAutorPergunta(1);
            threadBusca.setTicketDTO(ticketDTO);
            threadBusca.setUsuarioDTO(ticketDTO.getUsuarioDTO());
        }

        String data = dateFormat.format(new Date());

        try {
            threadBusca.setDataPostagem(dateFormat.parse(data));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return threadBusca;
    }
}
