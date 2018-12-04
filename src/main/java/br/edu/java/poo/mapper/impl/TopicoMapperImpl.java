package br.edu.java.poo.mapper.impl;

import br.edu.java.poo.mapper.BaseMapper;
import br.edu.java.poo.model.topico.TopicoDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TopicoMapperImpl implements BaseMapper<HttpServletRequest, TopicoDTO> {

    @Override
    public TopicoDTO doMap(HttpServletRequest req) {
        String tipoTopicoMapper = (String) req.getSession().getAttribute("tipoTopicoMapper");
        TopicoDTO topicoDTO = new TopicoDTO();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        if ("criaTopico".equalsIgnoreCase(tipoTopicoMapper)){
            UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuarioLogado");
            UsuarioDTO usuarioDTO = new UsuarioDTO();
            topicoDTO.setStatus("Incompleto");
            usuarioDTO.setId(usuarioSession.getId());
            usuarioDTO.setNomeConta(usuarioSession.getNomeConta());
            usuarioDTO.setTipoAcesso(usuarioSession.getTipoAcesso());
            topicoDTO.setUsuarioDTO(usuarioDTO);

            String data = dateFormat.format(new Date());
            try {
                topicoDTO.setDataCriacao(dateFormat.parse(data));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } else {
            topicoDTO = (TopicoDTO) req.getSession().getAttribute("novoTopico");
            String titulo = req.getParameter("tituloTopico");
            topicoDTO.setTitulo(titulo);
            topicoDTO.setStatus("Completo");
            topicoDTO.setSituacao("Aberto");
            String data = dateFormat.format(new Date());

            try {
                topicoDTO.setDataTermino(dateFormat.parse(data));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return topicoDTO;
    }
}
