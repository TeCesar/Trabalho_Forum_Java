package br.edu.java.poo.dao.thread.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.thread.ThreadDAO;
import br.edu.java.poo.model.thread.ThreadDTO;
import br.edu.java.poo.model.ticket.TicketDTO;
import br.edu.java.poo.model.topico.TopicoDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ThreadDAOImpl implements ThreadDAO {

    @Override
    public int criarThread(ThreadDTO threadDTO) {
        int id = 0;
        int idSQL;
        String sql;
        if (threadDTO.getTicketDTO() != null) {
            sql = "INSERT INTO threads (thread_mensagem, thread_autor, thread_autorPergunta, thread_dataPostagem, ticket_id, usuario_id) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
            idSQL = threadDTO.getTicketDTO().getId();
        } else {
            sql = "INSERT INTO threads (thread_mensagem, thread_autor, thread_autorPergunta, thread_dataPostagem, topico_id, usuario_id) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
            idSQL = threadDTO.getTopicoDTO().getId();
        }
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, threadDTO.getMensagem());
            preparedStatement.setString(2, threadDTO.getAutor());
            preparedStatement.setInt(3, threadDTO.getAutorPergunta());
            preparedStatement.setTimestamp(4, new java.sql.Timestamp(threadDTO.getDataPostagem().getTime()));
            preparedStatement.setInt(5, idSQL);
            preparedStatement.setInt(6, threadDTO.getUsuarioDTO().getId());

            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            if (resultSet.next()) {
                id = resultSet.getInt(1);
            }

            return id;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public List<ThreadDTO> listarThread(String tipo, int id) {
        List<ThreadDTO> listaThread = new ArrayList<>();
        String sql;
        if ("topico".equalsIgnoreCase(tipo)) {
            sql = "SELECT threads.thread_id, threads.thread_mensagem, threads.thread_autor, threads.thread_autorPergunta, threads.thread_dataPostagem, " +
                    "threads.thread_dataAlteracao, threads.thread_usuarioEdicao, topicos.topico_id, topicos.topico_titulo, topicos.topico_status, topicos.topico_dataCriacao, topicos.topico_dataTermino, " +
                    "topicos.topico_situacao, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso, usuarios.usuario_apelido " +
                    "FROM threads INNER JOIN topicos ON threads.topico_id = topicos.topico_id INNER JOIN usuarios ON threads.usuario_id = usuarios.usuario_id " +
                    "WHERE threads.topico_id = ?";
        } else {
            sql = "SELECT threads.thread_id, threads.thread_mensagem, threads.thread_autor, threads.thread_autorPergunta, threads.thread_dataPostagem, " +
                    "threads.thread_dataAlteracao, threads.thread_usuarioEdicao, tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_status, tickets.ticket_tempoInicio, tickets.ticket_tempoFim, " +
                    "tickets.ticket_situacao, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso, usuarios.usuario_apelido " +
                    "FROM threads INNER JOIN tickets ON threads.ticket_id = tickets.ticket_id INNER JOIN usuarios ON threads.usuario_id = usuarios.usuario_id " +
                    "WHERE threads.ticket_id = ?";
        }
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ThreadDTO threadDTO = fillThread(resultSet, tipo);
                listaThread.add(threadDTO);
            }

            return listaThread;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return listaThread;
    }

    @Override
    public String buscaNomeAutor(String tipo, int id) {
        String sql;
        if ("topico".equalsIgnoreCase(tipo)) {
            sql = "SELECT usuarios.usuario_nomeConta, topicos.topico_id FROM topicos INNER JOIN usuarios ON topicos.usuario_id = usuarios.usuario_id " +
                    "WHERE topicos.topico_id = ?";
        } else {
            sql = "SELECT usuarios.usuario_nomeConta, tickets.ticket_id FROM tickets INNER JOIN usuarios ON tickets.usuario_id = usuarios.usuario_id " +
                    "WHERE tickets.ticket_id = ?";
        }

        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getString("usuario_nomeConta");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return "Falha";
    }

    @Override
    public ThreadDTO buscaThread(int id, String tipo) {
        String sql;
        if ("topico".equalsIgnoreCase(tipo)) {
            sql = "SELECT threads.thread_id, threads.thread_mensagem, threads.thread_autor, threads.thread_autorPergunta, threads.thread_dataPostagem, " +
                    "threads.thread_dataAlteracao, threads.thread_usuarioEdicao, topicos.topico_id, topicos.topico_titulo, topicos.topico_status, topicos.topico_dataCriacao, topicos.topico_dataTermino, " +
                    "topicos.topico_situacao, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso, usuarios.usuario_apelido " +
                    "FROM threads INNER JOIN topicos ON threads.topico_id = topicos.topico_id INNER JOIN usuarios ON threads.usuario_id = usuarios.usuario_id " +
                    "WHERE threads.thread_id = ?";
        } else {
            sql = "SELECT threads.thread_id, threads.thread_mensagem, threads.thread_autor, threads.thread_autorPergunta, threads.thread_dataPostagem, " +
                    "threads.thread_dataAlteracao, threads.thread_usuarioEdicao, tickets.ticket_id, tickets.ticket_titulo, tickets.ticket_status, tickets.ticket_tempoInicio, tickets.ticket_tempoFim, " +
                    "tickets.ticket_situacao, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_tipoAcesso, usuarios.usuario_apelido " +
                    "FROM threads INNER JOIN tickets ON threads.ticket_id = tickets.ticket_id INNER JOIN usuarios ON threads.usuario_id = usuarios.usuario_id " +
                    "WHERE threads.thread_id = ?";
        }
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                ThreadDTO threadBusca = fillThread(resultSet, tipo);
                return threadBusca;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean atualizaEdicaoThread(ThreadDTO threadDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE threads SET thread_mensagem = ?, thread_dataAlteracao = ?, " +
                    "thread_usuarioEdicao = ? WHERE thread_id = ?");

            preparedStatement.setString(1, threadDTO.getMensagem());
            preparedStatement.setTimestamp(2, new java.sql.Timestamp(threadDTO.getDataAlteracao().getTime()));
            preparedStatement.setString(3, threadDTO.getUsuarioEdicao());
            preparedStatement.setInt(4, threadDTO.getId());

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

    private ThreadDTO fillThread(ResultSet resultSet, String tipo) throws SQLException {
        ThreadDTO threadBusca = new ThreadDTO();
        if ("topico".equalsIgnoreCase(tipo)) {
            TopicoDTO topicoDTO = new TopicoDTO();
            topicoDTO.setId(resultSet.getInt("topico_id"));
            topicoDTO.setTitulo(resultSet.getString("topico_titulo"));
            topicoDTO.setStatus(resultSet.getString("topico_status"));
            topicoDTO.setDataCriacao(resultSet.getTimestamp("topico_dataCriacao"));
            topicoDTO.setDataTermino(resultSet.getTimestamp("topico_dataTermino"));
            topicoDTO.setSituacao(resultSet.getString("topico_situacao"));
            threadBusca.setTopicoDTO(topicoDTO);
        } else {
            TicketDTO ticketDTO = new TicketDTO();
            ticketDTO.setId(resultSet.getInt("ticket_id"));
            ticketDTO.setTitulo(resultSet.getString("ticket_titulo"));
            ticketDTO.setStatus(resultSet.getString("ticket_status"));
            ticketDTO.setTempoInicio(resultSet.getTimestamp("ticket_tempoInicio"));
            ticketDTO.setTempoFim(resultSet.getTimestamp("ticket_tempoFim"));
            ticketDTO.setSituacao(resultSet.getString("ticket_situacao"));
            threadBusca.setTicketDTO(ticketDTO);
        }
        UsuarioDTO usuarioDTO = new UsuarioDTO();
        usuarioDTO.setId(resultSet.getInt("usuario_id"));
        usuarioDTO.setNomeConta(resultSet.getString("usuario_nomeConta"));
        usuarioDTO.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
        usuarioDTO.setApelido(resultSet.getString("usuario_apelido"));
        threadBusca.setUsuarioDTO(usuarioDTO);
        threadBusca.setId(resultSet.getInt("thread_id"));
        threadBusca.setMensagem(resultSet.getString("thread_mensagem"));
        threadBusca.setAutor(resultSet.getString("thread_autor"));
        threadBusca.setAutorPergunta(resultSet.getInt("thread_autorPergunta"));
        threadBusca.setDataPostagem(resultSet.getTimestamp("thread_dataPostagem"));
        threadBusca.setDataAlteracao(resultSet.getTimestamp("thread_dataAlteracao"));
        threadBusca.setUsuarioEdicao(resultSet.getString("thread_usuarioEdicao"));
        return threadBusca;
    }
}
