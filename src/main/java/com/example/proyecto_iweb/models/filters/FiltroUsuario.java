package com.example.proyecto_iweb.models.filters;

import com.example.proyecto_iweb.models.beans.Cuentas;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebFilter(filterName = "FiltroUsuario",
        servletNames = {"UsuariosCuentasServlet", "UsuariosJuegosServlet"},
        urlPatterns = {"/UsuariosJuegosServlet"})
public class FiltroUsuario implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession();
        Cuentas cu = (Cuentas) session.getAttribute("usuarioLog");

        if (cu == null) {
            response.sendRedirect(request.getContextPath());
        } else {
            int idRol = cu.getIdRol();

            if (idRol == 3) {
                // Si el usuario tiene una cuenta de tipo "manager", permitir el acceso a los servlets de manager
                filterChain.doFilter(servletRequest, servletResponse);

            } else {
                // Redirigir al contexto raíz para cualquier otro caso
                request.getRequestDispatcher("/error404.jsp").forward(request, response);
            }
        }
    }
}
