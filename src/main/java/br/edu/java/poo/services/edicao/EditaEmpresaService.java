package br.edu.java.poo.services.edicao;

import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.endereco.EnderecoDAO;
import br.edu.java.poo.dao.endereco.impl.EnderecoDAOImpl;
import br.edu.java.poo.model.empresa.EmpresaDTO;

public class EditaEmpresaService {
    EmpresaDAO empresaDAO;
    EnderecoDAO enderecoDAO;

    public EditaEmpresaService() {
        empresaDAO = new EmpresaDAOImpl();
        enderecoDAO = new EnderecoDAOImpl();
    }

    public boolean editaEmpresa(EmpresaDTO empresaDTO) {
        if (enderecoDAO.atualizaEndereco(empresaDTO.getEnderecoDTO())) {
            if (empresaDAO.atualizaEmpresa(empresaDTO)) {
                return true;
            }
        }
        return false;
    }
}
