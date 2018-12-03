package br.edu.java.poo.business.empresa.impl;

import br.edu.java.poo.business.empresa.EmpresaBusiness;
import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.model.empresa.EmpresaDTO;

public class EmpresaBusinessImpl implements EmpresaBusiness {
    EmpresaDAO empresaDAO;
    ClienteDAO clienteDAO;

    public EmpresaBusinessImpl(){
        empresaDAO = new EmpresaDAOImpl();
        clienteDAO = new ClienteDAOImpl();
    }

    @Override
    public boolean cadastrarEmpresa(EmpresaDTO empresaDTO) {
        if (empresaDTO != null){
            if (empresaDAO.cadastrarEmpresa(empresaDTO)){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean excluirEmpresa(int id) {
        if (id != 0){
            int idEmpresaVazia = empresaDAO.buscaEmpresaNA();

            if (!clienteDAO.mudarEmpresaClientes(idEmpresaVazia, id)){
                return false;
            }

            if (empresaDAO.excluirEmpresa(id)){
                return true;
            }
        }
        return false;
    }
}
