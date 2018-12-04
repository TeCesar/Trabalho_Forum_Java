package br.edu.java.poo.filters.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtils {

    public static String getUsuarioLogado(HttpServletRequest req){
        Cookie cookie = getCookieUsuarioLogado(req);
        if (cookie != null){
            return cookie.getValue();
        }
        return "<deslogado>";
    }

    public static Cookie getCookieUsuarioLogado(HttpServletRequest req){
        Cookie[] cookies = req.getCookies();
        if (cookies != null){
            for (Cookie cookie : cookies){
                if ("usuarioLogado".equalsIgnoreCase(cookie.getName())){
                    return cookie;
                }
            }
        }
        return null;
    }

}
