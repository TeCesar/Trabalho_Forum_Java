package br.edu.java.poo.services.edicao;

import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.model.empresa.EmpresaDTO;

public class EditaEmpresaService {
    EmpresaDAO empresaDAO;

    public EditaEmpresaService(){
        empresaDAO = new EmpresaDAOImpl();
    }

    public boolean editaEmpresa(EmpresaDTO empresaDTO){


        return false;
    }
}
