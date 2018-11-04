package br.edu.java.poo.servlets.exclusao;

import br.edu.java.poo.services.exclusao.ExcluirClienteService;
import br.edu.java.poo.services.exclusao.ExcluirEmpresaService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (urlPatterns = "/excluir")
public class ExclusaoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("empresa".equalsIgnoreCase(tipo)){

        }

        if ("cliente".equalsIgnoreCase(tipo)){
            ExcluirClienteService excluirClienteService = new ExcluirClienteService();
            String idCliente = req.getParameter("idCliente");
            excluirClienteService.excluirCliente(Integer.parseInt(idCliente));
            req.getRequestDispatcher("listar?tipo=clientes").forward(req, resp);
        }

        if ("empresa".equalsIgnoreCase(tipo)){
            ExcluirEmpresaService excluirEmpresaService = new ExcluirEmpresaService();
            String idEmpresa = req.getParameter("idEmpresa");
            excluirEmpresaService.mudarEmpresaClientes(Integer.parseInt(idEmpresa));
            excluirEmpresaService.excluirEmpresa(Integer.parseInt(idEmpresa));
            req.getRequestDispatcher("listar?tipo=empresas").forward(req, resp);
        }
    }
}
