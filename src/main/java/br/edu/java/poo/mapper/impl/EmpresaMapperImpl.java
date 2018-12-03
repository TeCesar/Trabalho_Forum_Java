package br.edu.java.poo.mapper.impl;

import br.edu.java.poo.mapper.BaseMapper;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;
import br.edu.java.poo.model.endereco.UfDTO;

import javax.servlet.http.HttpServletRequest;

public class EmpresaMapperImpl implements BaseMapper<HttpServletRequest, EmpresaDTO> {

    @Override
    public EmpresaDTO doMap(HttpServletRequest req) {
        EmpresaDTO empresaDTO = new EmpresaDTO();
        String razaoSocial = req.getParameter("razaoSocial");
        String nomeFantasia = req.getParameter("nomeFantasia");
        String cnpj = req.getParameter("cnpj");
        String nomeRua = req.getParameter("empresaNomeRua");
        String numeroEndereco = req.getParameter("empresaNumeroEndereco");
        String bairro = req.getParameter("empresaBairro");
        String cidade = req.getParameter("empresaCidade");
        String ufId = req.getParameter("empresaUfId");

        UfDTO ufDTO = new UfDTO();
        ufDTO.setId(Integer.parseInt(ufId));

        EnderecoDTO enderecoDTO = new EnderecoDTO();
        enderecoDTO.setUfDTO(ufDTO);
        enderecoDTO.setRua(nomeRua);
        enderecoDTO.setNumeroEndereco(numeroEndereco);
        enderecoDTO.setBairro(bairro);
        enderecoDTO.setCidade(cidade);

        empresaDTO.setEnderecoDTO(enderecoDTO);
        empresaDTO.setRazaoSocial(razaoSocial);
        empresaDTO.setNomeFantasia(nomeFantasia);
        empresaDTO.setCnpj(cnpj);

        return empresaDTO;
    }
}
