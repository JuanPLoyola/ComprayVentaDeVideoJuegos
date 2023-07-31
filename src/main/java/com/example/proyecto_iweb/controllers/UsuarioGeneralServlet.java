package com.example.proyecto_iweb.controllers;

import java.io.*;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.beans.Juegos;
import com.example.proyecto_iweb.models.beans.VentaUsuario;
import com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos;
import com.example.proyecto_iweb.models.daos.UsuarioJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServlet;

@WebServlet(name = "UsuarioGeneralServlet",  urlPatterns = {"/UsuarioGeneral"})
public class UsuarioGeneralServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String action = request.getParameter("p") == null ? "b1" : request.getParameter("p");

        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();

        //switch (action) {

            //case "b1":
                String textoBuscar1 = request.getParameter("buscador");
                request.setAttribute("lista", usuarioJuegosDaos.buscarPorTitle(textoBuscar1));
                request.getRequestDispatcher("index.jsp").forward(request, response);
                //break;

        //}
    }
}
