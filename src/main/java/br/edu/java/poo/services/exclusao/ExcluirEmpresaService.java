package br.edu.java.poo.services.exclusao;

import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;

public class ExcluirEmpresaService {
    EmpresaDAO empresaDAO;
    ClienteDAO clienteDAO;

    public ExcluirEmpresaService(){
        empresaDAO = new EmpresaDAOImpl();
        clienteDAO = new ClienteDAOImpl();
    }

    public boolean excluirEmpresa(int id){
        if (id != 0){
            empresaDAO.excluirEmpresa(id);
            return true;
        }
        return false;
    }

    public boolean mudarEmpresaClientes(int id){
        if (id != 0){
            clienteDAO.mudarEmpresaClientes(id);
        }
        return false;
    }

}
