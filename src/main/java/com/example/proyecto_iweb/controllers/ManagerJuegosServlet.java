package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.daos.ManagerJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ManagerJuegosServlet", value = "/ManagerJuegosServlet")
public class ManagerJuegosServlet extends HttpServlet {


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        ManagerJuegosDaos juegosDaos = new ManagerJuegosDaos();

        String action = request.getParameter("a") == null ? "Juegos" : request.getParameter("a");

        switch (action){

            case "Juegos":
                request.setAttribute("listaManager", juegosDaos.listarJuegos());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("manager/juegosManager.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "eliminar":
                String id2 = request.getParameter("id");
                juegosDaos.desabilitarJuego(id2);
                request.getSession().setAttribute("info","Juego eliminado");
                response.sendRedirect(request.getContextPath() + "/ManagerJuegosServlet");
                break;

            case "top5":
                request.setAttribute("listaManager", juegosDaos.listarJuegosTop5());
                request.getSession().setAttribute("info","Top 5");
                request.getRequestDispatcher("manager/JuegosManagerTop5.jsp").forward(request, response);
                break;

            case "menos":
                request.setAttribute("listaManager", juegosDaos.listarJuegosMenosVendidos());
                request.getSession().setAttribute("info","Top 5");
                request.getRequestDispatcher("manager/JuegosManagerMenosVendidos.jsp").forward(request, response);
                break;

        }


    }

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        ManagerJuegosDaos juegosDaos = new ManagerJuegosDaos();

        switch (action){
            case "b":
                String textoBuscar = request.getParameter("buscador");
                request.setAttribute("listaManager", juegosDaos.buscarPorTitle(textoBuscar));
                request.getRequestDispatcher("manager/juegosManager.jsp").forward(request, response);
                break;
        }

    }


}


