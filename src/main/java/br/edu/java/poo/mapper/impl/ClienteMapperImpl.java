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
        String tipoAcao = req.getParameter("tipoAcao");
        String idUf = req.getParameter("idUfCliente");
        String nomeRua = req.getParameter("nomeRuaCliente");
        String numeroCasa = req.getParameter("numeroCasaCliente");
        String bairro = req.getParameter("bairroCliente");
        String cidade = req.getParameter("cidadeCliente");
        String idEmpresa = req.getParameter("idEmpresaCliente");
        String nome = req.getParameter("nomeCliente");
        String sobrenome = req.getParameter("sobrenomeCliente");
        String dtNasc = req.getParameter("dtNascCliente");
        String sexo = req.getParameter("sexoCliente");
        String nomeUsuario = req.getParameter("nomeUsuarioCliente");

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

        clienteDTO.setNome(nome);
        clienteDTO.setSobrenome(sobrenome);

        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        try {
            clienteDTO.setDtNascimento(dateFormat.parse(dtNasc));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        clienteDTO.setSexo(sexo);

        if ("edicao".equalsIgnoreCase(tipoAcao)){
            String idCliente = req.getParameter("idCliente");
            String idUsuario = req.getParameter("idUsuarioCliente");
            String idEndereco = req.getParameter("idEnderecoCliente");
            String senha = req.getParameter("senhaUsuarioCliente");
            usuarioDTO.setId(Integer.parseInt(idUsuario));
            usuarioDTO.setSenha(senha);
            enderecoDTO.setId(Integer.parseInt(idEndereco));
            clienteDTO.setId(Integer.parseInt(idCliente));
        }

        clienteDTO.setUsuarioDTO(usuarioDTO);
        clienteDTO.setEnderecoDTO(enderecoDTO);
        clienteDTO.setEmpresaDTO(empresaDTO);

        return clienteDTO;
    }
}
