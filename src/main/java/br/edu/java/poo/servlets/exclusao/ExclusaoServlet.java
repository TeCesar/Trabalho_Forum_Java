package br.edu.java.poo.servlets.exclusao;

import br.edu.java.poo.business.cliente.ClienteBusiness;
import br.edu.java.poo.business.cliente.impl.ClienteBusinessImpl;
import br.edu.java.poo.business.empresa.EmpresaBusiness;
import br.edu.java.poo.business.empresa.impl.EmpresaBusinessImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/excluir")
public class ExclusaoServlet extends HttpServlet {
    ClienteBusiness clienteBusiness;
    EmpresaBusiness empresaBusiness;

    public ExclusaoServlet() {
        clienteBusiness = new ClienteBusinessImpl();
        empresaBusiness = new EmpresaBusinessImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipo = req.getParameter("tipo");

        if ("cliente".equalsIgnoreCase(tipo)) {
            String idCliente = req.getParameter("idCliente");
            clienteBusiness.excluirCliente(Integer.parseInt(idCliente));
            req.getRequestDispatcher("listar?tipo=clientes").forward(req, resp);
        }

        if ("empresa".equalsIgnoreCase(tipo)) {
            String idEmpresa = req.getParameter("idEmpresa");
            empresaBusiness.excluirEmpresa(Integer.parseInt(idEmpresa));
            req.getRequestDispatcher("listar?tipo=empresas").forward(req, resp);
        }
    }
}
