package br.edu.java.poo.dao.empresa;

import br.edu.java.poo.model.empresa.EmpresaDTO;

import java.util.List;

public interface EmpresaDAO {

    boolean cadastrarEmpresa(EmpresaDTO empresaDTO);

    List<EmpresaDTO> buscarListaEmpresas();

    EmpresaDTO buscarEmpresa(int id);

}
