package br.edu.java.poo.filters;

import br.edu.java.poo.business.acao.AcaoBusiness;
import br.edu.java.poo.business.acao.impl.AcaoBusinessImpl;
import br.edu.java.poo.filters.utils.CookieUtils;
import br.edu.java.poo.model.acao.AcaoDTO;
import br.edu.java.poo.model.usuario.UsuarioSession;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@WebFilter(urlPatterns = "/*")
public class AcoesFilter implements Filter {
    AcaoBusiness acaoBusiness;

    public AcoesFilter(){
        acaoBusiness = new AcaoBusinessImpl();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HashMap<String, String> map = new HashMap<>();

        if (req.getParameterMap() != null) {
            req.getParameterMap().forEach((key, value) -> map.put(key, Arrays.toString(value)));
        }
        AcaoDTO acaoDTO = new AcaoDTO();
        for (Map.Entry<String, String> entry : map.entrySet()){
            if (entry.getKey().equalsIgnoreCase("acao")){
                acaoDTO.setAcao(entry.getValue());
            }
            if (entry.getKey().equalsIgnoreCase("tipo")){
                acaoDTO.setTipo(entry.getValue());
            }
        }

        UsuarioSession usuarioSession = (UsuarioSession) req.getSession().getAttribute("usuarioLogado");
        if (usuarioSession != null){
            acaoDTO.setUsuarioSession(usuarioSession);
            acaoBusiness.insereAcao(acaoDTO);
        }

        chain.doFilter(request, response);
    }

    private String checkUser(HttpServletRequest req) {
        Cookie cookie = CookieUtils.getCookieUsuarioLogado(req);
        if (cookie == null) {
            return "<deslogado>";
        }
        return cookie.getValue();
    }
}
