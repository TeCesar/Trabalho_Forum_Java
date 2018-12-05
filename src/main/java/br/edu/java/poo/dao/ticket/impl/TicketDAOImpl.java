package br.edu.java.poo.dao.ticket.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.ticket.TicketDAO;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketDAOImpl implements TicketDAO {

    @Override
    public int inicioTicket(TicketDTO ticketDTO) {
        int resultado = 0;
        String sql = "INSERT INTO tickets (ticket_tempoInicio, ticket_status, usuario_id) VALUES (?, ?, ?)";
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setTimestamp(1, new java.sql.Timestamp(ticketDTO.getTempoInicio().getTime()));
            preparedStatement.setString(2, ticketDTO.getStatus());
            preparedStatement.setInt(3, ticketDTO.getUsuarioDTO().getId());

            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            if (resultSet.next()) {
                resultado = resultSet.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultado;
    }

    @Override
    public boolean finalizaTicket(TicketDTO ticketDTO) {
        String sql = "UPDATE tickets SET ticket_titulo = ?, ticket_status = ?, ticket_tempoFim = ?, ticket_situacao = ?, " +
                "ticket_respondido = ? WHERE ticket_id = ?";
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, ticketDTO.getTitulo());
            preparedStatement.setString(2, ticketDTO.getStatus());
            preparedStatement.setTimestamp(3, new java.sql.Timestamp(ticketDTO.getTempoFim().getTime()));
            preparedStatement.setString(4, ticketDTO.getSituacao());
            preparedStatement.setString(5, ticketDTO.getRespondido());
            preparedStatement.setInt(6, ticketDTO.getId());

            int resultado = preparedStatement.executeUpdate();

            if (resultado != 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<TicketDTO> listarTicketsSituacao(String situacao) {
        List<TicketDTO> listaTickets = new ArrayList<>();
        String sql;
        String aux;
        if ("todos".equalsIgnoreCase(situacao)) {
            sql = "SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                    "tickets.ticket_tempoFim, tickets.ticket_situacao, tickets.ticket_respondido, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
                    "FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id";

            try (Connection connection = SQLConnectionProvider.openConnection()) {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);

                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()){
                    TicketDTO ticketDTO = fillTicket(resultSet);
                    listaTickets.add(ticketDTO);
                }


            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            return listaTickets;
        } else if ("Sem Resposta".equalsIgnoreCase(situacao)) {
            sql = "SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                    "tickets.ticket_tempoFim, tickets.ticket_situacao, tickets.ticket_respondido, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
                    "FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id WHERE ticket_respondido = ?";

            aux = "Nao";
        } else {
            sql = "SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                    "tickets.ticket_tempoFim, tickets.ticket_situacao, tickets.ticket_respondido, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
                    "FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id WHERE ticket_situacao = ?";

            aux = situacao;
        }
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, aux);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                TicketDTO ticketDTO = fillTicket(resultSet);
                listaTickets.add(ticketDTO);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listaTickets;
    }

    @Override
    public List<TicketDTO> listarTicketsUser(int idUsuario) {
        List<TicketDTO> listaTickets = new ArrayList<>();
        String sql = "SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                "tickets.ticket_tempoFim, tickets.ticket_situacao, tickets.ticket_respondido, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
                "FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id WHERE usuarios.usuario_id = ?";

        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, idUsuario);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                TicketDTO ticketDTO = fillTicket(resultSet);
                listaTickets.add(ticketDTO);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listaTickets;
    }

    @Override
    public TicketDTO buscarTicket(int id) {
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_status, tickets.ticket_tempoInicio, " +
                    "tickets.ticket_tempoFim, tickets.ticket_situacao, tickets.ticket_respondido, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso " +
                    "FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id WHERE tickets.ticket_id = ?");

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                TicketDTO ticketBusca = fillTicket(resultSet);
                return ticketBusca;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean mudaSituacaoTicket(TicketDTO ticketDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE tickets SET ticket_situacao = ? WHERE ticket_id = ?");

            preparedStatement.setString(1, ticketDTO.getSituacao());
            preparedStatement.setInt(2, ticketDTO.getId());

            int resultado = preparedStatement.executeUpdate();

            if (resultado != 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    private TicketDTO fillTicket(ResultSet resultSet) throws SQLException {
        UsuarioDTO usuarioDTO = new UsuarioDTO();
        usuarioDTO.setId(resultSet.getInt("usuario_id"));
        usuarioDTO.setNomeConta(resultSet.getString("usuario_nomeConta"));
        usuarioDTO.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
        TicketDTO ticketDTO = new TicketDTO();
        ticketDTO.setUsuarioDTO(usuarioDTO);
        ticketDTO.setId(resultSet.getInt("ticket_id"));
        ticketDTO.setTitulo(resultSet.getString("ticket_titulo"));
        ticketDTO.setStatus(resultSet.getString("ticket_status"));
        ticketDTO.setTempoInicio(resultSet.getDate("ticket_tempoInicio"));
        ticketDTO.setTempoFim(resultSet.getDate("ticket_tempoFim"));
        ticketDTO.setSituacao(resultSet.getString("ticket_situacao"));
        ticketDTO.setRespondido(resultSet.getString("ticket_respondido"));
        return ticketDTO;
    }
}
