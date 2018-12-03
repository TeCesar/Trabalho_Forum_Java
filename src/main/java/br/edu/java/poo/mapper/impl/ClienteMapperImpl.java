package br.edu.java.poo.mapper.impl;

import br.edu.java.poo.mapper.BaseMapper;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.EnderecoDTO;
import br.edu.java.poo.model.endereco.UfDTO;
import br.edu.java.poo.model.usuario.UsuarioDTO;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ClienteMapperImpl implements BaseMapper<HttpServletRequest, ClienteDTO> {

    @Override
    public ClienteDTO doMap(HttpServletRequest req) {
        ClienteDTO clienteDTO = new ClienteDTO();
        String idUf = req.getParameter("clienteUfId");
        String nomeRua = req.getParameter("clienteNomeRua");
        String numeroCasa = req.getParameter("clienteNumeroCasa");
        String bairro = req.getParameter("clienteBairro");
        String cidade = req.getParameter("clienteCidade");
        String idEmpresa = req.getParameter("clienteEmpresaId");
        String nome = req.getParameter("clienteNome");
        String sobrenome = req.getParameter("clienteSobrenome");
        String dtNasc = req.getParameter("clienteDtNasc");
        String sexo = req.getParameter("clienteSexo");
        String nomeUsuario = req.getParameter("clienteNomeUsuario");

        UfDTO ufDTO = new UfDTO();
        ufDTO.setId(Integer.parseInt(idUf));

        EnderecoDTO enderecoDTO = new EnderecoDTO();
        enderecoDTO.setUfDTO(ufDTO);
        enderecoDTO.setRua(nomeRua);
        enderecoDTO.setNumeroEndereco(numeroCasa);
        enderecoDTO.setBairro(bairro);
        enderecoDTO.setCidade(cidade);

        EmpresaDTO empresaDTO = new EmpresaDTO();
        empresaDTO.setId(Integer.parseInt(idEmpresa));

        UsuarioDTO usuarioDTO = new UsuarioDTO();
        usuarioDTO.setNomeConta(nomeUsuario);

        clienteDTO.setUsuarioDTO(usuarioDTO);
        clienteDTO.setEnderecoDTO(enderecoDTO);
        clienteDTO.setEmpresaDTO(empresaDTO);
        clienteDTO.setNome(nome);
        clienteDTO.setSobrenome(sobrenome);

        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String dataNasc = dateFormat.format(dtNasc);
        try {
            clienteDTO.setDtNascimento(dateFormat.parse(dataNasc));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        clienteDTO.setSexo(sexo);

        return clienteDTO;
    }
}
