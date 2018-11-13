package br.edu.java.poo.dao.cliente.impl;

import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;
import br.edu.java.poo.model.endereco.UfDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAOImpl implements ClienteDAO {

    @Override
    public boolean cadastrarCliente(ClienteDTO clienteDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO clientes(cliente_nome, cliente_sobrenome, cliente_dtNascimento," +
                    "cliente_sexo, endereco_id, empresa_id, usuario_id) VALUES (?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, clienteDTO.getNome());
            preparedStatement.setString(2, clienteDTO.getSobrenome());
            preparedStatement.setDate(3, new java.sql.Date(clienteDTO.getDtNascimento().getTime()));
            preparedStatement.setString(4, clienteDTO.getSexo());
            preparedStatement.setInt(5, clienteDTO.getEnderecoDTO().getId());
            preparedStatement.setInt(6, clienteDTO.getEmpresaDTO().getId());
            preparedStatement.setInt(7, clienteDTO.getUsuarioDTO().getId());

            int sucesso = preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();

            if (sucesso != 0) {
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
    public List<ClienteDTO> listarClientes() {
        List<ClienteDTO> listaClientes = new ArrayList<ClienteDTO>();
        String sql = "SELECT clientes.cliente_id, clientes.cliente_nome, clientes.cliente_sobrenome," +
                " clientes.cliente_dtNascimento, clientes.cliente_sexo, empresas.empresa_id, empresas.empresa_nomeFantasia," +
                " empresas.empresa_cnpj, empresas.empresa_razaoSocial, enderecos.endereco_id, enderecos.endereco_rua," +
                " enderecos.endereco_numero, enderecos.endereco_bairro, enderecos.endereco_cidade," +
                " ufs.uf_id, ufs.uf_sigla, ufs.uf_nome, usuarios.usuario_id, usuarios.usuario_nomeConta," +
                " usuarios.usuario_tipoAcesso, usuarios.usuario_dataDeCadastro, usuarios.usuario_dataDeAlteracao, usuarios.usuario_apelido," +
                " usuarios.usuario_errosLogin, usuarios.usuario_ticketResolvidos FROM clientes INNER JOIN enderecos ON clientes.endereco_id = enderecos.endereco_id" +
                " INNER JOIN empresas ON clientes.empresa_id = empresas.empresa_id INNER JOIN usuarios ON clientes.usuario_id = usuarios.usuario_id" +
                " INNER JOIN ufs ON enderecos.uf_id = ufs.uf_id";

        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ClienteDTO clienteDTO = new ClienteDTO();
                clienteDTO.setId(resultSet.getInt("cliente_id"));
                clienteDTO.setNome(resultSet.getString("cliente_nome"));
                clienteDTO.setSobrenome(resultSet.getString("cliente_sobrenome"));
                clienteDTO.setDtNascimento(resultSet.getDate("cliente_dtNascimento"));
                clienteDTO.setSexo(resultSet.getString("cliente_sexo"));
                EmpresaDTO empresaDTO = new EmpresaDTO();
                empresaDTO.setId(resultSet.getInt("empresa_id"));
                empresaDTO.setNomeFantasia(resultSet.getString("empresa_nomeFantasia"));
                empresaDTO.setCnpj(resultSet.getString("empresa_cnpj"));
                empresaDTO.setRazaoSocial(resultSet.getString("empresa_razaoSocial"));
                clienteDTO.setEmpresaDTO(empresaDTO);
                EnderecoDTO enderecoDTO = new EnderecoDTO();
                enderecoDTO.setId(resultSet.getInt("endereco_id"));
                enderecoDTO.setRua(resultSet.getString("endereco_rua"));
                enderecoDTO.setNumeroEndereco(resultSet.getString("endereco_numero"));
                enderecoDTO.setBairro(resultSet.getString("endereco_bairro"));
                enderecoDTO.setCidade(resultSet.getString("endereco_cidade"));
                UfDTO ufDTO = new UfDTO();
                ufDTO.setId(resultSet.getInt("uf_id"));
                ufDTO.setSigla(resultSet.getString("uf_sigla"));
                ufDTO.setNome(resultSet.getString("uf_nome"));
                enderecoDTO.setUfDTO(ufDTO);
                clienteDTO.setEnderecoDTO(enderecoDTO);
                UsuarioDTO usuarioDTO = new UsuarioDTO();
                usuarioDTO.setId(resultSet.getInt("usuario_id"));
                usuarioDTO.setNomeConta(resultSet.getString("usuario_nomeConta"));
                usuarioDTO.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
                usuarioDTO.setDataDeCadastro(resultSet.getDate("usuario_dataDeCadastro"));
                usuarioDTO.setDataDeAlteracao(resultSet.getDate("usuario_dataDeAlteracao"));
                usuarioDTO.setUsuarioApelido(resultSet.getString("usuario_apelido"));
                usuarioDTO.setErrosLogin(resultSet.getInt("usuario_errosLogin"));
                usuarioDTO.setTicketsResolvidos(resultSet.getInt("usuario_ticketResolvidos"));
                clienteDTO.setUsuarioDTO(usuarioDTO);
                listaClientes.add(clienteDTO);
            }

            return listaClientes;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listaClientes;
    }

    @Override
    public ClienteDTO buscaCliente(int id) {
        ClienteDTO clienteDTO = new ClienteDTO();
        String sql = "SELECT clientes.cliente_id, clientes.cliente_nome, clientes.cliente_sobrenome," +
                " clientes.cliente_dtNascimento, clientes.cliente_sexo, empresas.empresa_id, empresas.empresa_nomeFantasia," +
                " empresas.empresa_cnpj, empresas.empresa_razaoSocial, enderecos.endereco_id, enderecos.endereco_rua," +
                " enderecos.endereco_numero, enderecos.endereco_bairro, enderecos.endereco_cidade," +
                " ufs.uf_id, ufs.uf_sigla, ufs.uf_nome, usuarios.usuario_id, usuarios.usuario_nomeConta, usuarios.usuario_senha, " +
                " usuarios.usuario_tipoAcesso, usuarios.usuario_dataDeCadastro, usuarios.usuario_dataDeAlteracao, usuarios.usuario_apelido," +
                " usuarios.usuario_errosLogin, usuarios.usuario_ticketResolvidos FROM clientes INNER JOIN enderecos ON clientes.endereco_id = enderecos.endereco_id" +
                " INNER JOIN empresas ON clientes.empresa_id = empresas.empresa_id INNER JOIN usuarios ON clientes.usuario_id = usuarios.usuario_id" +
                " INNER JOIN ufs ON enderecos.uf_id = ufs.uf_id WHERE clientes.cliente_id = ?";

        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                clienteDTO.setId(resultSet.getInt("cliente_id"));
                clienteDTO.setNome(resultSet.getString("cliente_nome"));
                clienteDTO.setSobrenome(resultSet.getString("cliente_sobrenome"));
                clienteDTO.setDtNascimento(resultSet.getDate("cliente_dtNascimento"));
                clienteDTO.setSexo(resultSet.getString("cliente_sexo"));
                EmpresaDTO empresaDTO = new EmpresaDTO();
                empresaDTO.setId(resultSet.getInt("empresa_id"));
                empresaDTO.setNomeFantasia(resultSet.getString("empresa_nomeFantasia"));
                empresaDTO.setCnpj(resultSet.getString("empresa_cnpj"));
                empresaDTO.setRazaoSocial(resultSet.getString("empresa_razaoSocial"));
                clienteDTO.setEmpresaDTO(empresaDTO);
                EnderecoDTO enderecoDTO = new EnderecoDTO();
                enderecoDTO.setId(resultSet.getInt("endereco_id"));
                enderecoDTO.setRua(resultSet.getString("endereco_rua"));
                enderecoDTO.setNumeroEndereco(resultSet.getString("endereco_numero"));
                enderecoDTO.setBairro(resultSet.getString("endereco_bairro"));
                enderecoDTO.setCidade(resultSet.getString("endereco_cidade"));
                UfDTO ufDTO = new UfDTO();
                ufDTO.setId(resultSet.getInt("uf_id"));
                ufDTO.setSigla(resultSet.getString("uf_sigla"));
                ufDTO.setNome(resultSet.getString("uf_nome"));
                enderecoDTO.setUfDTO(ufDTO);
                clienteDTO.setEnderecoDTO(enderecoDTO);
                UsuarioDTO usuarioDTO = new UsuarioDTO();
                usuarioDTO.setId(resultSet.getInt("usuario_id"));
                usuarioDTO.setNomeConta(resultSet.getString("usuario_nomeConta"));
                usuarioDTO.setTipoAcesso(resultSet.getString("usuario_tipoAcesso"));
                usuarioDTO.setSenha(resultSet.getString("usuario_senha"));
                usuarioDTO.setDataDeCadastro(resultSet.getDate("usuario_dataDeCadastro"));
                usuarioDTO.setDataDeAlteracao(resultSet.getDate("usuario_dataDeAlteracao"));
                usuarioDTO.setUsuarioApelido(resultSet.getString("usuario_apelido"));
                usuarioDTO.setErrosLogin(resultSet.getInt("usuario_errosLogin"));
                usuarioDTO.setTicketsResolvidos(resultSet.getInt("usuario_ticketResolvidos"));
                clienteDTO.setUsuarioDTO(usuarioDTO);
            }

            return clienteDTO;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return clienteDTO;
    }

    @Override
    public boolean atualizaCliente(ClienteDTO clienteDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE clientes SET cliente_nome = ?, cliente_sobrenome = ?, cliente_dtNascimento = ?, " +
                    "cliente_sexo = ?, empresa_id = ? WHERE cliente_id = ?");

            preparedStatement.setString(1, clienteDTO.getNome());
            preparedStatement.setString(2, clienteDTO.getSobrenome());
            preparedStatement.setDate(3, new java.sql.Date(clienteDTO.getDtNascimento().getTime()));
            preparedStatement.setString(4, clienteDTO.getSexo());
            preparedStatement.setInt(5, clienteDTO.getEmpresaDTO().getId());
            preparedStatement.setInt(6, clienteDTO.getId());

            boolean sucesso = preparedStatement.execute();


            if (!sucesso) {
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
    public boolean excluirCliente(int id) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM clientes WHERE cliente_id = ?");

            preparedStatement.setInt(1, id);

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
    public boolean mudarEmpresaClientes(int id) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE clientes SET empresa_id = 6 WHERE empresa_id = ?");

            preparedStatement.setInt(1, id);

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


}
