package br.edu.java.poo.servlets.cadastro;

import br.edu.java.poo.dao.empresa.EmpresaDAO;
import br.edu.java.poo.dao.empresa.impl.EmpresaDAOImpl;
import br.edu.java.poo.dao.uf.UfDAO;
import br.edu.java.poo.dao.uf.impl.UfDAOImpl;
import br.edu.java.poo.model.cliente.ClienteDTO;
import br.edu.java.poo.model.empresa.EmpresaDTO;
import br.edu.java.poo.model.endereco.UfDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (urlPatterns = "/cadastro")
public class CadastroServlet extends HttpServlet {
    UfDAO ufDAO;
    EmpresaDAO empresaDAO;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nome = req.getParameter("clienteNome");
        String sobrenome = req.getParameter("clienteSobrenome");
        String dtNasc = req.getParameter("clienteDtNasc");
        String sexo = req.getParameter("clienteSexo");
        String nomeRua = req.getParameter("clienteNomeRua");
        String numeroCasa = req.getParameter("clienteNumeroCasa");
        String bairro = req.getParameter("clienteBairro");
        String cidade = req.getParameter("clienteCidade");
        String uf = req.getParameter("clienteUf");
        String empresa = req.getParameter("clienteEmpresa");

        ClienteDTO clienteDTO = new ClienteDTO();
        clienteDTO.setNome(nome);
        clienteDTO.setSobrenome(sobrenome);
        clienteDTO.setDtNascimento(dtNasc);
        clienteDTO.setSexo(sexo.charAt(0));
        clienteDTO.getEnderecoDTO().setRua(nomeRua);
        clienteDTO.getEnderecoDTO().setNumeroCasa(Integer.parseInt(numeroCasa));

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("cliente".equalsIgnoreCase(tipo)){
            ufDAO = new UfDAOImpl();
            empresaDAO = new EmpresaDAOImpl();
            List<UfDTO> listaUfs = ufDAO.buscarUfs();
            List<EmpresaDTO> listaEmpresas = empresaDAO.buscarEmpresas();
            req.getSession().setAttribute("listaUfs", listaUfs);
            req.getSession().setAttribute("listaEmpresas", listaEmpresas);
            req.getRequestDispatcher("WEB-INF/cadastros/cadastroCliente.jsp").forward(req, resp);
        }
    }
}
