package br.edu.java.poo.dao.empresa.impl;

import br.edu.java.poo.dao.conexao.SQLConnectionProvider;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.model.empresa.EmpresaDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpresaDAOImpl implements EmpresaDAO {

    @Override
    public boolean cadastrarEmpresa(EmpresaDTO empresaDTO) {
        try (Connection connection = SQLConnectionProvider.openConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO empresas(empresa_nomeFantasia, empresa_cnpj, empresa_razaoSocial, endereco_id)" +
                    "VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, empresaDTO.getNomeFantasia());
            preparedStatement.setString(2, empresaDTO.getCnpj());
            preparedStatement.setString(3, empresaDTO.getRazaoSocial());
            preparedStatement.setInt(4, empresaDTO.getEnderecoDTO().getId());

            if (preparedStatement.execute()){
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
        List<EmpresaDTO> listaEmpresas = null;

        try (Connection connection = SQLConnectionProvider.openConnection()) {
            listaEmpresas = new ArrayList<EmpresaDTO>();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM empresas");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                EmpresaDTO empresaDTO = new EmpresaDTO();
                empresaDTO.setId(resultSet.getInt("empresa_id"));
                empresaDTO.setNomeFantasia(resultSet.getString("empresa_nomeFantasia"));
                empresaDTO.setCnpj(resultSet.getString("empresa_cnpj"));
                empresaDTO.setRazaoSocial(resultSet.getString("empresa_razaoSocial"));
                listaEmpresas.add(empresaDTO);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return listaEmpresas;
    }

    @Override
    public EmpresaDTO buscarEmpresa(int id) {
        EmpresaDTO empresa = null;
        try (Connection connection = SQLConnectionProvider.openConnection()) {
            empresa = new EmpresaDTO();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM empresas WHERE empresa_id = ?");

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                empresa.setId(resultSet.getInt("empresa_id"));
                empresa.setNomeFantasia(resultSet.getString("empresa_nomeFantasia"));
                empresa.setCnpj(resultSet.getString("empresa_cnpj"));
                empresa.setRazaoSocial(resultSet.getString("empresa_razaoSocial"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return empresa;
    }
}
