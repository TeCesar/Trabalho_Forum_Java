package br.edu.java.poo.business.empresa.impl;

import br.edu.java.poo.business.empresa.EmpresaBusiness;
import br.edu.java.poo.dao.cliente.ClienteDAO;
import br.edu.java.poo.dao.cliente.impl.ClienteDAOImpl;
import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.endereco.EnderecoDAO;
import br.edu.java.poo.dao.endereco.impl.EnderecoDAOImpl;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;

public class EmpresaBusinessImpl implements EmpresaBusiness {
    EmpresaDAO empresaDAO;
    ClienteDAO clienteDAO;
    EnderecoDAO enderecoDAO;

    public EmpresaBusinessImpl(){
        empresaDAO = new EmpresaDAOImpl();
        clienteDAO = new ClienteDAOImpl();
        enderecoDAO = new EnderecoDAOImpl();
    }

    @Override
    public boolean cadastrarEmpresa(EmpresaDTO empresaDTO) {
        if (empresaDTO != null){
            EnderecoDTO enderecoBusca = enderecoDAO.buscaEndereco(empresaDTO.getEnderecoDTO(), empresaDTO.getEnderecoDTO().getUfDTO().getId());
            empresaDTO.setEnderecoDTO(enderecoBusca);
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
