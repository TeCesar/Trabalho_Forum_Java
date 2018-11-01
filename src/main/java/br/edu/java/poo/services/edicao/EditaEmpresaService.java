package br.edu.java.poo.services.edicao;

import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.endereco.EnderecoDAO;
import br.edu.java.poo.dao.endereco.impl.EnderecoDAOImpl;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;

public class EditaEmpresaService {
    EmpresaDAO empresaDAO;
    EnderecoDAO enderecoDAO;

    public EditaEmpresaService() {
        empresaDAO = new EmpresaDAOImpl();
        enderecoDAO = new EnderecoDAOImpl();
    }

    public boolean editaEmpresa(EmpresaDTO empresaDTO) {
        EnderecoDTO enderecoBusca = enderecoDAO.buscaEndereco(empresaDTO.getEnderecoDTO(), empresaDTO.getEnderecoDTO().getUfDTO().getId());
        empresaDTO.setEnderecoDTO(enderecoBusca);

        if (empresaDAO.atualizaEmpresa(empresaDTO)) {
            return true;
        }
        return false;
    }
}
