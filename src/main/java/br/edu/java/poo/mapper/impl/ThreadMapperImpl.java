package br.edu.java.poo.mapper.impl;

import br.edu.java.poo.mapper.BaseMapper;
import br.edu.java.poo.model.thread.ThreadDTO;
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
        TopicoDTO topicoDTO = (TopicoDTO) req.getAttribute("threadMapperTopico");
        String mensagem = req.getParameter("mensagemTopico");

        DateFormat dateFormat = new SimpleDateFormat();
        String data = dateFormat.format(new Date());

        try {
            threadBusca.setDataPostagem(dateFormat.parse(data));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        threadBusca.setMensagem(mensagem);
        threadBusca.setAutor(topicoDTO.getUsuarioDTO().getNomeConta());
        threadBusca.setAutorPergunta(1);
        threadBusca.setTopicoDTO(topicoDTO);
        threadBusca.setUsuarioDTO(topicoDTO.getUsuarioDTO());

        return threadBusca;
    }
}
