package br.edu.java.poo.business.empresa;

import br.edu.java.poo.model.empresa.EmpresaDTO;

public interface EmpresaBusiness {

    boolean cadastrarEmpresa(EmpresaDTO empresaDTO);

    boolean excluirEmpresa(int id);

}
