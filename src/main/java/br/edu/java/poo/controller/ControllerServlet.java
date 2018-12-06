package br.edu.java.poo.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/controller")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String acao = req.getParameter("acao");

        if ("login".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("login?tipo=logar").forward(req, resp);
        }

        if ("novaSenha".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("login?tipo=alteraSenha").forward(req, resp);
        }

        if ("ticket".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("finalizarTicket".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("ticket?tipo=fimTicket").forward(req, resp);
            }
        }

        if ("cadastroCliente".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("cadastro?tipo=cliente").forward(req, resp);
        }

        if ("cadastroEmpresa".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("cadastro?tipo=empresa").forward(req, resp);
        }

        if ("editarEmpresa".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("editar?tipo=empresa").forward(req, resp);
        }

        if ("editarCliente".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("editar?tipo=cliente").forward(req, resp);
        }

        if ("topico".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("finalizaTopico".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("topico?tipo=finalizaTopico").forward(req, resp);
            }
        }

        if ("respostaPostagemThread".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("thread?tipo=respostaPostagemThread").forward(req, resp);
        }

        if ("responderThread".equalsIgnoreCase(acao)) {

        }

        if ("cadastro".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("operador".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("cadastro?tipo=operador").forward(req, resp);
            } else if ("usuario".equalsIgnoreCase(tipo)){
                req.getRequestDispatcher("cadastro?tipo=usuario").forward(req, resp);
            }
        }

        if ("thread".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("alterarMensagem".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("thread?tipo=alterarMensagem").forward(req, resp);
            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String acao = req.getParameter("acao");

        if ("ticket".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("iniciarTicket".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("ticket?tipo=inicioTicket").forward(req, resp);
            } else if ("mostrarTicket".equalsIgnoreCase(tipo)) {
                req.getSession().setAttribute("tt", "ticket");
                req.getRequestDispatcher("thread?tipo=mostrar").forward(req, resp);
            }
        }

//        if ("menuPrincipal".equalsIgnoreCase(acao)) {
//            UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuario");
//            String tipo = "";
//            if ("operador".equalsIgnoreCase(usuarioSession.getTipoAcesso())) {
//                tipo = "menuOperador.jsp";
//            } else if ("cliente".equalsIgnoreCase(usuarioSession.getTipoAcesso())) {
//                tipo = "menuPrincipal.jsp";
//            } else if ("usuario".equalsIgnoreCase(usuarioSession.getTipoAcesso())) {
//                tipo = "menuUsuario.jsp";
//            } else if ("administrador".equalsIgnoreCase(usuarioSession.getTipoAcesso())) {
//                tipo = "menuAdministrador.jsp";
//            }
//            req.getRequestDispatcher("WEB-INF/menus/" + tipo).forward(req, resp);
//        }

        if ("cadastro".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("cliente".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("cadastro?tipo=cliente").forward(req, resp);
            } else if ("empresa".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("cadastro?tipo=empresa").forward(req, resp);
            } else if ("operador".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("cadastro?tipo=operador").forward(req, resp);
            }
        }


        if ("listarTickets".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            req.getRequestDispatcher("listar?tipo=tickets&situacao=" + tipo).forward(req, resp);
        }

        if ("listar".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("clientes".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("listar?tipo=clientes").forward(req, resp);
            } else if ("empresas".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("listar?tipo=empresas").forward(req, resp);
            } else if ("usuarios".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("listar?tipo=usuarios").forward(req, resp);
            } else if ("usuariosBloqueados".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("listar?tipo=usuariosBloqueados").forward(req, resp);
            }
        }

        if ("editarEmpresa".equalsIgnoreCase(acao)) {
            String id = req.getParameter("idEmpresa");
            req.getRequestDispatcher("editar?tipo=empresa&idEmpresa=" + id).forward(req, resp);
        }

        if ("editarCliente".equalsIgnoreCase(acao)) {
            String id = req.getParameter("idCliente");
            req.getRequestDispatcher("editar?tipo=cliente&idCliente=" + id).forward(req, resp);
        }

        if ("excluirCliente".equalsIgnoreCase(acao)) {
            String id = req.getParameter("idCliente");
            req.getRequestDispatcher("excluir?tipo=cliente&idCliente=" + id).forward(req, resp);
        }

        if ("excluirEmpresa".equalsIgnoreCase(acao)) {
            String id = req.getParameter("idEmpresa");
            req.getRequestDispatcher("excluir?tipo=empresa&idEmpresa=" + id).forward(req, resp);
        }

        if ("relatorio".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("clienteEmpresa".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("relatorio?tipo=clienteEmpresa").forward(req, resp);
            } else if ("listaUsuarios".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("relatorio?tipo=listaUsuarios").forward(req, resp);
            } else if ("ticketsCliente".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("relatorio?tipo=ticketsCliente&situacao=todos").forward(req, resp);
            } else if ("ticketsClienteSemResposta".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("relatorio?tipo=ticketsCliente&situacao=semResposta").forward(req, resp);
            } else if ("listaTicketsSemRespCliente".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("relatorio?tipo=ticketsCliente&situacao=listaSemResposta").forward(req, resp);
            } else if ("logAcesso".equalsIgnoreCase(tipo)){
                req.getRequestDispatcher("relatorio?tipo=logAcesso").forward(req, resp);
            } else if ("acoes".equalsIgnoreCase(tipo)){
                req.getRequestDispatcher("relatorio?tipo=acoes").forward(req, resp);
            } else if ("duracaoTT".equalsIgnoreCase(tipo)){
                req.getRequestDispatcher("relatorio?tipo=duracaoTT").forward(req, resp);
            } else if ("errosLoginTckResolvido".equalsIgnoreCase(tipo)){
                req.getRequestDispatcher("relatorio?tipo=errosLoginTckResolvido").forward(req, resp);
            }
        }

        if ("topico".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("criaTopico".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("topico?tipo=criaTopico").forward(req, resp);
            } else if ("pesquisarTopico".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("topico?tipo=pesquisarTopico").forward(req, resp);
            } else if ("listarTopicos".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("topico?tipo=listarTopicos").forward(req, resp);
            } else if ("mostrarTopico".equalsIgnoreCase(tipo)) {
                req.setAttribute("tt", "topico");
                req.getRequestDispatcher("thread?tipo=mostrar").forward(req, resp);
            }
        }

        if ("responderPostagemThread".equalsIgnoreCase(acao)) {
            req.getRequestDispatcher("thread?tipo=responderPostagem").forward(req, resp);
        }

        if ("responderThread".equalsIgnoreCase(acao)) {
            String titulo = req.getParameter("titulo");
            String id = req.getParameter("idPostagem");
            req.getRequestDispatcher("thread?tipo=responder&titulo=" + titulo + "&mensagem=&id=" + id).forward(req, resp);
        }

        if ("usuario".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("bloquearUsuario".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("editar?tipo=bloquearUsuario").forward(req, resp);
            }
        }

        if ("ticket".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("ticketRespondido".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("thread?tipo=ticketRespondido").forward(req, resp);
            }
        }

        if ("thread".equalsIgnoreCase(acao)) {
            String tipo = req.getParameter("tipo");
            if ("reabrir".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("thread?tipo=reabrirThread").forward(req, resp);
            } else if ("fecharTopico".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("thread?tipo=fecharTopico").forward(req, resp);
            } else if ("editaMensagemOperador".equalsIgnoreCase(tipo)) {
                req.getRequestDispatcher("thread?tipo=editaMensagemOperador").forward(req, resp);
            }
        }

        if ("login".equalsIgnoreCase(acao)){
            String tipo = req.getParameter("tipo");
            if ("logoff".equalsIgnoreCase(tipo)){
                req.getRequestDispatcher("login?tipo=logoff").forward(req, resp);
            }
        }

    }
}
