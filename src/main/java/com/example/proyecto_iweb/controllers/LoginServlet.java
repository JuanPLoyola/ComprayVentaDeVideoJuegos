package com.example.proyecto_iweb.controllers;
//hola
import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action") != null ? req.getParameter("action") : "login";

        if (action.equals("login")) {
            HttpSession session = req.getSession();

            if(session != null && session.getAttribute("usuarioLog") != null) {
                Cuentas cuentas = (Cuentas) session.getAttribute("usuarioLog");

                if (cuentas.getIdCuentas() > 0) {//estoy loggedIn
                    if (cuentas.getIdRol() == 2) {
                        resp.sendRedirect(req.getContextPath() + "/AdminJuegosServlet");
                    } else if (cuentas.getIdRol() == 1) {
                        resp.sendRedirect(req.getContextPath() + "/ManagerCuentasServlet");
                    } else if (cuentas.getIdRol() == 3) {
                        resp.sendRedirect(req.getContextPath() + "/UsuariosJuegosServlet");
                    }
                } else {
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/loginPage.jsp");
                    dispatcher.forward(req, resp);
                }
            } else {
                RequestDispatcher dispatcher = req.getRequestDispatcher("/loginPage.jsp");
                dispatcher.forward(req, resp);
            }
        }

        else{ //logout
            req.getSession().invalidate();
            resp.sendRedirect(req.getContextPath() + "/UsuariosJuegosServlet");
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("inputEmail");
        String pass = req.getParameter("inputPassword");

        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();
        Cuentas cuentas = usuarioCuentasDaos.validateUsernameAndPassword(email, pass);
        String action = req.getParameter("p") == null ? "guardar" : req.getParameter("p");


        if (cuentas != null) { //usuario y password correctos
            HttpSession session = req.getSession();
            session.setAttribute("usuarioLog", cuentas);
            session.setMaxInactiveInterval(3000 * 60); //en segundos

            if (cuentas.getIdRol() == 1) {
                resp.sendRedirect(req.getContextPath() + "/ManagerJuegosServlet");
            } else if (cuentas.getIdRol() == 2) {
                resp.sendRedirect(req.getContextPath() + "/AdminJuegosServlet");
            } else if (cuentas.getIdRol() == 3) {
                resp.sendRedirect(req.getContextPath() + "/UsuariosJuegosServlet");
            }
        } else { //usuario o password incorrectos
            req.setAttribute("error", "Usuario o password incorrectos");
            req.getRequestDispatcher("loginPage.jsp").forward(req, resp);
        }

    }
}
