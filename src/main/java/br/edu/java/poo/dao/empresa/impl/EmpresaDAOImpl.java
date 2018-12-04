package br.edu.java.poo.dao.empresa.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;
import br.edu.java.poo.model.endereco.UfDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpresaDAOImpl implements EmpresaDAO {

    @Override
    public boolean cadastrarEmpresa(EmpresaDTO empresaDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO empresas(empresa_nomeFantasia, empresa_cnpj, empresa_razaoSocial, endereco_id)" +
                    "VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, empresaDTO.getNomeFantasia());
            preparedStatement.setString(2, empresaDTO.getCnpj());
            preparedStatement.setString(3, empresaDTO.getRazaoSocial());
            preparedStatement.setInt(4, empresaDTO.getEnderecoDTO().getId());

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
    public List<EmpresaDTO> buscarListaEmpresas() {
        List<EmpresaDTO> listaEmpresas = new ArrayList<>();
        String sql = "SELECT empresas.empresa_id, empresas.empresa_nomeFantasia, empresas.empresa_cnpj, empresas.empresa_razaoSocial," +
                " enderecos.endereco_id, enderecos.endereco_rua, enderecos.endereco_numero, enderecos.endereco_bairro, enderecos.endereco_cidade," +
                " ufs.uf_id, ufs.uf_sigla, ufs.uf_nome FROM empresas INNER JOIN enderecos ON" +
                " empresas.endereco_id = enderecos.endereco_id INNER JOIN ufs ON enderecos.uf_id = ufs.uf_id";

        try (Connection connection = SQLConnectionProvider.openConnection()) {

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                EmpresaDTO empresaDTO = fillEmpresa(resultSet);
                listaEmpresas.add(empresaDTO);
            }

            return listaEmpresas;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public EmpresaDTO buscarEmpresa(int id) {
        EmpresaDTO empresaBusca = new EmpresaDTO();
        String sql = "SELECT empresas.empresa_id, empresas.empresa_nomeFantasia, empresas.empresa_cnpj, empresas.empresa_razaoSocial," +
                "enderecos.endereco_id, enderecos.endereco_rua, enderecos.endereco_numero, enderecos.endereco_bairro, enderecos.endereco_cidade," +
                "ufs.uf_id, ufs.uf_sigla, ufs.uf_nome FROM empresas INNER JOIN enderecos ON empresas.endereco_id = enderecos.endereco_id " +
                "INNER JOIN ufs ON enderecos.uf_id = ufs.uf_id WHERE empresas.empresa_id = ?";

        try (Connection connection = SQLConnectionProvider.openConnection()) {

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                empresaBusca = fillEmpresa(resultSet);
                return empresaBusca;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean atualizaEmpresa(EmpresaDTO empresaDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE empresas SET empresa_nomeFantasia = ?, " +
                    "empresa_cnpj = ?, empresa_razaoSocial = ?, endereco_id = ? WHERE empresa_id = ?");

            preparedStatement.setString(1, empresaDTO.getNomeFantasia());
            preparedStatement.setString(2, empresaDTO.getCnpj());
            preparedStatement.setString(3, empresaDTO.getRazaoSocial());
            preparedStatement.setInt(4, empresaDTO.getEnderecoDTO().getId());
            preparedStatement.setInt(5, empresaDTO.getId());

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
    public boolean excluirEmpresa(int idEmpresa) {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM empresas WHERE empresa_id = ?");

            preparedStatement.setInt(1, idEmpresa);

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
    public int buscaEmpresaNA() {
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT empresa_id FROM empresas WHERE empresa_nomeFantasia = 'N/A'");

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("empresa_id");
                return id;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private EmpresaDTO fillEmpresa(ResultSet resultSet) throws SQLException {
        EmpresaDTO empresaBusca = new EmpresaDTO();
        empresaBusca.setId(resultSet.getInt("empresa_id"));
        empresaBusca.setNomeFantasia(resultSet.getString("empresa_nomeFantasia"));
        empresaBusca.setCnpj(resultSet.getString("empresa_cnpj"));
        empresaBusca.setRazaoSocial(resultSet.getString("empresa_razaoSocial"));
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
        empresaBusca.setEnderecoDTO(enderecoDTO);
        return empresaBusca;
    }
}
