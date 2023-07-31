package com.example.proyecto_iweb.models.filters;


import com.example.proyecto_iweb.models.beans.Cuentas;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/* TODO: Este filtro sirve para manager ,cuando se cierra session*/



@WebFilter(filterName = "FiltroLogout",
        servletNames = {"ManagerCuentasServlet","ManagerJuegosServlet","UsuariosJuegosServlet","UsuariosCuentasServlet","AdminJuegosServlet","AdminCuentasServlet"})

public class FiltroLogout implements Filter{
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession();
        Cuentas cu = (Cuentas) session.getAttribute("usuarioLog");

        if (cu == null) {
            // El usuario ha cerrado sesión, redirigir a una página específica después de cerrar sesión
            response.sendRedirect(request.getContextPath());
        } else {
            // El usuario aún está logeado, permitir el acceso a la página solicitada
            response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
            response.setHeader("Pragma","no-cache");
            response.setDateHeader("Expires",0);

            response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            filterChain.doFilter(servletRequest, servletResponse);
        }
    }


}
// FIXME: este codigo no funciona, no da error asi que puede compilar, arreglarlo
