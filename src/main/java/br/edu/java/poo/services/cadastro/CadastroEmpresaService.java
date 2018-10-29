package br.edu.java.poo.services.cadastro;

import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.endereco.EnderecoDAO;
import br.edu.java.poo.dao.endereco.impl.EnderecoDAOImpl;
import br.edu.java.poo.dao.uf.UfDAO;
import br.edu.java.poo.dao.uf.impl.UfDAOImpl;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;
import br.edu.java.poo.model.endereco.UfDTO;

public class CadastroEmpresaService {
    EmpresaDAO empresaDAO;
    UfDAO ufDAO;
    EnderecoDAO enderecoDAO;

    public CadastroEmpresaService(){
        empresaDAO = new EmpresaDAOImpl();
        ufDAO = new UfDAOImpl();
        enderecoDAO = new EnderecoDAOImpl();
    }

    public boolean cadastroEmpresa(String razaoSocial, String nomeFantasia, String cnpj, String nomeRua, String numeroEndereco, String bairro, String cidade, String ufId){

        UfDTO ufBusca = ufDAO.buscarUf(Integer.parseInt(ufId));

        EnderecoDTO enderecoBusca = new EnderecoDTO();
        enderecoBusca.setRua(nomeRua);
        enderecoBusca.setNumeroEndereco(numeroEndereco);
        enderecoBusca.setBairro(bairro);
        enderecoBusca.setCidade(cidade);
        enderecoBusca = enderecoDAO.buscaEndereco(enderecoBusca, Integer.parseInt(ufId));
        enderecoBusca.setUfDTO(ufBusca);

        EmpresaDTO empresaDTO = new EmpresaDTO();
        empresaDTO.setRazaoSocial(razaoSocial);
        empresaDTO.setNomeFantasia(nomeFantasia);
        empresaDTO.setCnpj(cnpj);
        empresaDTO.setEnderecoDTO(enderecoBusca);

        if (empresaDAO.cadastrarEmpresa(empresaDTO)){
            return true;
        }
        return false;
    }
}
