package br.edu.java.poo.mapper.impl;

import br.edu.java.poo.mapper.BaseMapper;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TicketMapperImpl implements BaseMapper<HttpServletRequest, TicketDTO> {

    @Override
    public TicketDTO doMap(HttpServletRequest req) {
        String tipoTicketMapper = (String) req.getAttribute("tipoTicketMapper");
        TicketDTO ticketBusca = new TicketDTO();
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        if ("inicioTicket".equalsIgnoreCase(tipoTicketMapper)){
            String data = dateFormat.format(new Date());

            UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuarioLogado");

            UsuarioDTO usuarioDTO = new UsuarioDTO();

            usuarioDTO.setId(usuarioSession.getId());
            usuarioDTO.setNomeConta(usuarioSession.getNomeConta());
            usuarioDTO.setTipoAcesso(usuarioSession.getTipoAcesso());
            ticketBusca.setUsuarioDTO(usuarioDTO);
            ticketBusca.setStatus("Incompleto");

            try {
                ticketBusca.setTempoInicio(dateFormat.parse(data));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } else {
            String titulo = req.getParameter("tituloTicket");
            ticketBusca = (TicketDTO) req.getSession().getAttribute("novoTicket");
            ticketBusca.setTitulo(titulo);
            ticketBusca.setStatus("Completo");
            ticketBusca.setRespondido("Nao");
            ticketBusca.setSituacao("Aberto");
            String data = dateFormat.format(new Date());

            try {
                ticketBusca.setTempoFim(dateFormat.parse(data));
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        return ticketBusca;
    }
}
