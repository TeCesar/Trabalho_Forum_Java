package br.edu.java.poo.services.exclusao;

import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;

public class ExcluirClienteService {
    ClienteDAO clienteDAO;

    public ExcluirClienteService(){
        clienteDAO = new ClienteDAOImpl();
    }

    public boolean excluirCliente(int id) {
        if (id != 0) {
            clienteDAO.excluirCliente(id);
            return true;
        }
        return false;
    }

}
