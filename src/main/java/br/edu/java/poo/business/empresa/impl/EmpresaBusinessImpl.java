package br.edu.java.poo.business.empresa.impl;

import br.edu.java.poo.business.empresa.EmpresaBusiness;
import br.edu.java.poo.model.empresa.EmpresaDTO;

public class EmpresaBusinessImpl implements EmpresaBusiness {

    @Override
    public boolean validaEmpresa(EmpresaDTO empresaDTO) {
        if (empresaDTO != null){
            return true;
        }
        return false;
    }
}
