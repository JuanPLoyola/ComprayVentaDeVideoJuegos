package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.daos.DaoImagen;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import org.apache.commons.io.IOUtils;


import java.io.*;


@WebServlet(name = "ImagenServlet", value = "/imagenServlet")
public class ImagenServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listarFotoJuego" : request.getParameter("action");
        DaoImagen imageDao = new DaoImagen();

        switch (action){

            case "listarFotoJuego"->{
                int id = Integer.parseInt(request.getParameter("id"));
                byte[] content = null;
                content = imageDao.obtenerimagenes(id);
                if (content.length == 1 && content[0] == 0) {
                    System.out.println("Algo falló al nivel de SQL/DB");
                } else if (content.length == 1 && content[0] == 1) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                } else {
                    response.setContentType("image/*");
                    response.setContentLength(content.length);
                    response.getOutputStream().write(content);
                }
            }


            case "listarFotoCuenta"->{
                int id = Integer.parseInt(request.getParameter("id"));
                byte[] content = null;
                content = imageDao.obtenerFotoPerfil(id);
                if (content.length == 1 && content[0] == 0) {
                    System.out.println("Algo falló al nivel de SQL/DB");
                } else if (content.length == 1 && content[0] == 1) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                } else {
                    response.setContentType("image/*");
                    response.setContentLength(content.length);
                    response.getOutputStream().write(content);
                }
            }


        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
