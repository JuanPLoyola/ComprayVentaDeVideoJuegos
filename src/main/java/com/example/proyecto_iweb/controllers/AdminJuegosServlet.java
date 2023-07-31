package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.beans.Juegos;
import com.example.proyecto_iweb.models.daos.AdminCuentasDaos;
import com.example.proyecto_iweb.models.daos.AdminJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "AdminJuegosServlet", value = "/AdminJuegosServlet")
@MultipartConfig
public class AdminJuegosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("a") == null ? "listarJuegosDisponibles" : request.getParameter("a");


        AdminJuegosDaos adminJuegosDaos = new AdminJuegosDaos();
        AdminCuentasDaos adminCuentasDaos = new AdminCuentasDaos();

        // NO ESTOY SEGURO DE COMO IMPLEMENTARLO
        HttpSession session6 = request.getSession();
        Cuentas cuentas = (Cuentas) session6.getAttribute("usuarioLog");

        switch (action) {
            case "listarJuegosDisponibles":
                request.setAttribute("lista", adminJuegosDaos.listarJuegosDisponibles());
                request.getRequestDispatcher("admin/indexAdmin.jsp").forward(request, response);
                break;

            case "crearJuego":
                request.setAttribute("consolas", adminJuegosDaos.consolas());
                request.setAttribute("generos", adminJuegosDaos.generos());
                request.getRequestDispatcher("admin/crearJuego.jsp").forward(request, response);
                break;

            case "editarJuego":
                String id = request.getParameter("id");
                request.setAttribute("juego", adminJuegosDaos.obtenerJuego(id));
                request.setAttribute("consolas", adminJuegosDaos.consolas());
                request.setAttribute("generos", adminJuegosDaos.generos());
                request.getRequestDispatcher("admin/editarJuego.jsp").forward(request, response);
                break;

            case "deshabilitarJuego":
                String id1 = request.getParameter("id");
                adminJuegosDaos.desabilitarJuego(id1);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                break;

            case "reservas":

                request.setAttribute("lista",adminJuegosDaos.compradosAndReservados(cuentas.getIdCuentas()));
                request.getRequestDispatcher("admin/reservasYcomprados.jsp").forward(request, response);
                break;

            case "propuestos":
                request.setAttribute("lista",adminJuegosDaos.juegosPropuestos());
                request.getRequestDispatcher("admin/propuestos.jsp").forward(request, response);
                break;

            case "ofertas":
                request.setAttribute("ofertas",adminJuegosDaos.listarOfertas());
                request.getRequestDispatcher("admin/ofertasJuegos.jsp").forward(request,response);
                break;

            case "verJuego":
                String id2 = request.getParameter("id");
                request.setAttribute("juego", adminJuegosDaos.listarJuegoAdmin(id2));
                request.getRequestDispatcher("admin/verJuego.jsp").forward(request, response);
                break;

            case "eliminarOferta":
                String id3 = request.getParameter("id");
                adminJuegosDaos.eliminarOferta(id3);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=ofertas");
                break;

            case "ofertarJuego":
                String id4 = request.getParameter("id");
                request.setAttribute("juego", adminJuegosDaos.obtenerJuego(id4));
                //request.setAttribute("consolas", adminJuegosDaos.consolas());
                //request.setAttribute("generos", adminJuegosDaos.generos());
                request.getRequestDispatcher("admin/ofertarJuego.jsp").forward(request, response);
                break;

            // SECCION DE RESERVAS Y COMPRADOS
            case "detallesCompra":
                String id100 = request.getParameter("id");
                request.setAttribute("compra", adminJuegosDaos.comprados(Integer.parseInt(id100)));
                request.getRequestDispatcher("admin/detallesCompras2.jsp").forward(request, response);
                break;

                // PARA VISUALIZAR LA UBICACION EN EL MAPA DEL USUARIO
            case "locationUsuario":
                String id101 = request.getParameter("id");
                request.setAttribute("usuario", adminJuegosDaos.comprados(Integer.parseInt(id101)));
                request.getRequestDispatcher("admin/locationUsuario.jsp").forward(request, response);
                break;

            // TERMINA SECCION DE RESERVAS Y COMPRADOS

            case "aceptarUsuario":
                String id9 = request.getParameter("id");
                adminJuegosDaos.aceptarUsuario(id9);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=propuestos");
                break;

            case "rechazarUsuario":
                String id10 = request.getParameter("id");
                adminJuegosDaos.rechazarUsuario(id10);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=propuestos");
                break;




            case "listarcola":
                request.setAttribute("lista", adminJuegosDaos.listarCola());
                RequestDispatcher requestDispatcher2 = request.getRequestDispatcher("admin/juegosColaAdminOficial.jsp");
                requestDispatcher2.forward(request, response);
                break;

            case "nuevos":
                request.setAttribute("nuevos", adminJuegosDaos.listarnuevos());
                request.getRequestDispatcher("admin/juegosNuevos.jsp").forward(request, response);
                break;

            case "existentes":
                request.setAttribute("existentes", adminJuegosDaos.listarexistentes());
                request.getRequestDispatcher("admin/juegosExistentes.jsp").forward(request, response);
                break;

            case "cambiarestadoaceptar":
                String id5 = request.getParameter("idventa");
                adminJuegosDaos.cambiarestadoaceptar(id5);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=listarcola");
                break;

            case "cambiarestadonoaceptar":
                String id6 = request.getParameter("idventa");
                adminJuegosDaos.cambiarestadonoaceptar(id6);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=listarcola");
                break;

            case "cambiarestadorechazar":
                String id7 = request.getParameter("idventa");
                adminJuegosDaos.cambiarestadorechazar(id7);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=listarcola");
                break;


            //para juegos NUEVOS propuestos por el user
            case "detallesJuegoNuevo":
                String id8 = request.getParameter("id");
                request.setAttribute("ventaUsuario", adminJuegosDaos.obtenerVentaUsuario(id8));
                request.setAttribute("detallesNuevos", adminJuegosDaos.detallesNuevos(id8));
                request.getRequestDispatcher("admin/detallesJuegoNuevo.jsp").forward(request, response);
                break;

            case "noAceptarNuevo":
                String id11 = request.getParameter("id");
                request.setAttribute("ventaUsuario", adminJuegosDaos.obtenerVentaUsuario(id11));
                request.setAttribute("detallesNuevos", adminJuegosDaos.detallesNuevos(id11));
                request.getRequestDispatcher("admin/noAceptarNuevo.jsp").forward(request, response);
                break;

            case "rechazarNuevo":
                String id12 = request.getParameter("id");
                request.setAttribute("ventaUsuario", adminJuegosDaos.obtenerVentaUsuario(id12));
                request.setAttribute("detallesNuevos", adminJuegosDaos.detallesNuevos(id12));
                request.getRequestDispatcher("admin/rechazarNuevo.jsp").forward(request, response);
                break;
            case "aceptarNuevo":
                String id13 = request.getParameter("idventa");
                adminJuegosDaos.cambiarestadoaceptar(id13);
                String id13j = request.getParameter("idjuego");
                adminJuegosDaos.pasarNuevoAExistente(id13j);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=nuevos");
                break;
            //para juegos EXISTENTES propuestos por el user
            case "detallesJuegoExistente":
                String id14 = request.getParameter("id");
                request.setAttribute("ventaUsuario", adminJuegosDaos.obtenerVentaUsuario(id14));
                request.setAttribute("detallesExistentes", adminJuegosDaos.detallesExistentes(id14));
                request.getRequestDispatcher("admin/detallesJuegoExistente.jsp").forward(request, response);
                break;

            case "noAceptarExistente":
                String id15 = request.getParameter("id");
                request.setAttribute("ventaUsuario", adminJuegosDaos.obtenerVentaUsuario(id15));
                request.setAttribute("detallesExistentes", adminJuegosDaos.detallesExistentes(id15));
                request.getRequestDispatcher("admin/noAceptarExistente.jsp").forward(request, response);
                break;

            case "rechazarExistente":
                String id16 = request.getParameter("id");
                request.setAttribute("ventaUsuario", adminJuegosDaos.obtenerVentaUsuario(id16));
                request.setAttribute("detallesExistentes", adminJuegosDaos.detallesExistentes(id16));
                request.getRequestDispatcher("admin/rechazarExistente.jsp").forward(request, response);
                break;
            case "aceptarExistente":
                String id17 = request.getParameter("idventa");
                adminJuegosDaos.cambiarestadoaceptar(id17);
                String id17j = request.getParameter("idjuego");
                adminJuegosDaos.aumentarStock(id17j);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=existentes");
                break;

            //Rommel
            case "juegoEntregado":
                String idCompra = request.getParameter("id");
                String fechaEntrega = request.getParameter("fechaEntrega");

                request.setAttribute("lista",adminJuegosDaos.compradosAndReservados(cuentas.getIdCuentas()));
                adminJuegosDaos.juegoEntregado(idCompra, Date.valueOf(fechaEntrega));

                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=reservas");
                break;

            // PERFIL DEL ADMIN
            case "perfilAdmin" :
                request.setAttribute("cuentas", adminCuentasDaos.listar(cuentas.getIdCuentas()));
                request.getRequestDispatcher("admin/miPerfilAdmin.jsp").forward(request, response);
                break;



            // NOTIFICACIÓN DEL ADMIN
            case "listarNotificaciones":
                request.setAttribute("notificaciones", adminJuegosDaos.listarNotificaciones(cuentas.getIdCuentas()));
                request.setAttribute("lista",adminJuegosDaos.compradosAndReservados(cuentas.getIdCuentas()));
                request.getRequestDispatcher("admin/notificacionesAdmin.jsp").forward(request,response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        AdminJuegosDaos adminJuegosDaos = new AdminJuegosDaos();
        AdminCuentasDaos adminCuentasDaos = new AdminCuentasDaos();

        HttpSession session = request.getSession();
        Cuentas cuentas = (Cuentas) session.getAttribute("usuarioLog");

        switch (action) {
            case "crear":
                InputStream inputStream;
                String idAdmin =request.getParameter("idAdmin");
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String consola = request.getParameter("consola");
                String genero = request.getParameter("genero");
                Part filePart = request.getPart("foto");
                //byte[] foto = request.getParameter("foto").getBytes();
                try{

                    if(nombre.matches("^(?=.*[@#$%^&+=]).*$") || nombre.isEmpty()){
                        session.setAttribute("errorNombre","Nombre: Ingrese un nombre válido (letras y/o números)");
                        response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=crearJuego");

                    } else if (descripcion.matches("^(?=.*[@#$%^&+=]).*$") || descripcion.isEmpty()) {
                        session.setAttribute("errorDescripcion","Descripción: Ingrese una descripción válida");
                        response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=crearJuego");

                    } else{
                        double precio = Double.parseDouble(request.getParameter("precio"));

                        if ((precio > 1000) || (precio < 1)) {

                            session.setAttribute("errorPrecio","Precio: Ingrese valores entre [1-1000]");
                            response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=crearJuego");

                        } else {
                            inputStream = filePart.getInputStream();
                            if (filePart != null) {
                                System.out.println(filePart.getContentType());
                                inputStream = filePart.getInputStream();
                            }

                            if(!consola.equals("PlayStation 5") && !consola.equals("PlayStation 4") && !consola.equals("Nintendo Switch") && !consola.equals("PC")){
                                session.setAttribute("errorConsola","Consola: La consola ingresa no esta permitida");
                                response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=crearJuego");

                            } else if(!genero.equals("Aventura") && !genero.equals("Acción") && !genero.equals("Sandbox")
                                    && !genero.equals("Mundo abierto") && !genero.equals("Terror") && !genero.equals("Estrategia")
                                    && !genero.equals("Shooter") && !genero.equals("battle royal")){
                                session.setAttribute("errorGenero","Genero: El genero ingresado no esta permitido");
                                response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=crearJuego");

                            } else {
                                session.setAttribute("juegoCreado","Nuevo juego: Se añadio nuevo juego a la lista de disponibles");
                                adminJuegosDaos.crearJuego(nombre, descripcion, precio, consola, genero, inputStream, idAdmin);
                                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                            }
                        }
                    }

                } catch (NumberFormatException e){
                    e.printStackTrace();
                    session.setAttribute("errorLetras","Complete los campos, no deje vacio ninguno");
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=crearJuego");
                }
                break;



            case "actualizar":
                String idJuego =request.getParameter("idJuego");
                int idJuegoAct = Integer.parseInt(idJuego);
                String nombreAct = request.getParameter("nombre");
                String descripcionAct = request.getParameter("descripcion");
                String consolaAct = request.getParameter("consola");
                String generoAct = request.getParameter("genero");

                try{
                    if(nombreAct.matches("^(?=.*[@#$%^&+=]).*$") || nombreAct.isEmpty()){
                        request.setAttribute("juego", adminJuegosDaos.obtenerJuego(idJuego));
                        request.setAttribute("consolas", adminJuegosDaos.consolas());
                        request.setAttribute("generos", adminJuegosDaos.generos());
                        //session.setAttribute("errorNombre","Nombre: Ingrese un nombre válido (letras y/o números)");
                        response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=editarJuego&id" + idJuegoAct + "&error=Nombre");

                    } else if (descripcionAct.matches("^(?=.*[@#$%^&+=]).*$") || descripcionAct.isEmpty()) {
                        //request.setAttribute("juego", adminJuegosDaos.obtenerJuego(idJuego));
                        //request.setAttribute("consolas", adminJuegosDaos.consolas());
                        //request.setAttribute("generos", adminJuegosDaos.generos());
                        session.setAttribute("errorDescripcion","Descripción: Ingrese una descripción válida");
                        response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=editarJuego&id" + idJuegoAct + "&error=Descripcion");

                    } else{
                        double precioAct = Double.parseDouble(request.getParameter("precio"));
                        int stockAct = Integer.parseInt(request.getParameter("stock"));

                        if ((precioAct > 1000) || (precioAct < 1)) {

                            session.setAttribute("errorPrecio","Precio: Ingrese valores entre [1-1000]");
                            response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=editarJuego");

                        } else {
                            if(!consolaAct.equals("PlayStation 5") && !consolaAct.equals("PlayStation 4") && !consolaAct.equals("Nintendo Switch") && !consolaAct.equals("PC")){
                                session.setAttribute("errorConsola","Consola: La consola ingresa no esta permitida");
                                response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=editarJuego");

                            } else if(!generoAct.equals("Aventura") && !generoAct.equals("Acción") && !generoAct.equals("Sandbox")
                                    && !generoAct.equals("Mundo abierto") && !generoAct.equals("Terror") && !generoAct.equals("Estrategia")
                                    && !generoAct.equals("Shooter") && !generoAct.equals("battle royal")){
                                session.setAttribute("errorGenero","Genero: El genero ingresado no esta permitido");
                                response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=editarJuego");

                            } else if ((stockAct > 1000) || (stockAct < 0)) {
                                session.setAttribute("errorStock","Stock: Ingrese valores entre [0-1000]");
                                response.sendRedirect(request.getContextPath()+"/AdminJuegosServlet?a=editarJuego");
                            } else {
                                session.setAttribute("juegoActualizado","Jjuego actualizado: Se actualizo el juego correctamente");
                                adminJuegosDaos.actualizarJuego(idJuegoAct, nombreAct, descripcionAct, precioAct, consolaAct, generoAct, stockAct);
                                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                            }
                        }
                    }
                } catch (NumberFormatException e){
                    e.printStackTrace();
                    session.setAttribute("errorLetras","Complete los campos, no deje vacio ninguno");
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=editarJuego");
                }

                break;

            case "actualizarFotoJuego":
                InputStream inputStreamAct1;
                int idJuegoFoto = Integer.parseInt(request.getParameter("idJuego"));
                Part filePartAct2 = request.getPart("foto");
                inputStreamAct1 = filePartAct2.getInputStream();
                if (filePartAct2 != null) {
                    System.out.println(filePartAct2.getContentType());
                    inputStreamAct1 = filePartAct2.getInputStream();
                }
                adminJuegosDaos.actualizarFotoJuego(idJuegoFoto, inputStreamAct1);
                response.sendRedirect(request.getContextPath() +"/AdminJuegosServlet");
                break;

            case "ofertar":

                String idJuego1 = request.getParameter("idJuego");
                String descuento = request.getParameter("descuento");
                if(!descuento.matches("[0-9]+") || Long.parseLong(descuento)>90 || Long.parseLong(descuento)<10){
                    session.setAttribute("errorDescuento","Descuento: Desde 10% hasta 90%");
                    request.setAttribute("juego", adminJuegosDaos.obtenerJuego(idJuego1));
                    request.getRequestDispatcher("admin/ofertarJuego.jsp").forward(request, response);
                } else{
                    session.setAttribute("cambioDescuento","Descuento: Se actualizo correctamente");
                    adminJuegosDaos.ofertarJuego(Integer.parseInt(idJuego1), Integer.parseInt(descuento));
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                }

                break;



            case "dejarMensaje":
                String mensajeAdmin = request.getParameter("mensajeAdmin");
                String idVenta = request.getParameter("idVenta");

                adminJuegosDaos.dejarMensaje(mensajeAdmin, idVenta);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                break;

            // POR AHORA EL BUSCADOR NO FUNCIONA!!//
            case "b1":
                String textoBuscar1 = request.getParameter("buscador");
                request.setAttribute("lista", adminJuegosDaos.buscarPorTitle(textoBuscar1));
                request.getRequestDispatcher("admin/indexAdmin.jsp").forward(request, response);
                break;


            case "noAceptar":
                int idVenta1 = Integer.parseInt(request.getParameter("idVenta"));
                String mensajeAdmin1 = request.getParameter("mensajeAdmin");
//                adminJuegosDaos.noAceptar(mensajeAdmin1,idVenta1);
//                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=nuevos");
                if (mensajeAdmin1 != null && !mensajeAdmin1.isEmpty()) {
                    adminJuegosDaos.noAceptar(mensajeAdmin1, idVenta1);
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=nuevos");
                } else { //"mensajeAdmin" está vacío
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=noAceptarNuevo&id=" + idVenta1 + "&error=mensajeVacio");
                }
                break;

            case "rechazar":
                int idVenta2 = Integer.parseInt(request.getParameter("idVenta"));
                String mensajeAdmin2 = request.getParameter("mensajeAdmin");
//                adminJuegosDaos.rechazar(mensajeAdmin2,idVenta2);
//                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=nuevos");
                if (mensajeAdmin2 != null && !mensajeAdmin2.isEmpty()) {
                    adminJuegosDaos.rechazar(mensajeAdmin2, idVenta2);
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=nuevos");
                } else { //"mensajeAdmin" está vacío
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=rechazarNuevo&id=" + idVenta2 + "&error=mensajeVacio");
                }
                break;

                //para existentes
            case "noAceptarExistente":
                int idVenta3 = Integer.parseInt(request.getParameter("idVenta"));
                String mensajeAdmin3 = request.getParameter("mensajeAdmin");
//                adminJuegosDaos.noAceptar(mensajeAdmin3,idVenta3);
//                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=existentes");
                if (mensajeAdmin3 != null && !mensajeAdmin3.isEmpty()) {
                    adminJuegosDaos.noAceptar(mensajeAdmin3,idVenta3);
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=existentes");
                } else { //"mensajeAdmin" está vacío
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=noAceptarExistente&id=" + idVenta3 + "&error=mensajeVacio");
                }
                break;

            case "rechazarExistente":
                int idVenta4 = Integer.parseInt(request.getParameter("idVenta"));
                String mensajeAdmin4 = request.getParameter("mensajeAdmin");
//                adminJuegosDaos.rechazar(mensajeAdmin4,idVenta4);
//                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=existentes");
                if (mensajeAdmin4 != null && !mensajeAdmin4.isEmpty()) {
                    adminJuegosDaos.rechazar(mensajeAdmin4,idVenta4);
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=existentes");
                } else { //"mensajeAdmin" está vacío
                    response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=rechazarExistente&id=" + idVenta4 + "&error=mensajeVacio");
                }
                break;



        }
    }

    public Cuentas parseCuentas(HttpServletRequest request)  {

        Cuentas cuentas = new Cuentas();
        String idCuentas = request.getParameter("idCuentas") != null ? request.getParameter("idCuentas") : "";
        String descripcion = request.getParameter("descripcion");
        String direcion = request.getParameter("direccion");
        String correo = request.getParameter("correo");

        try {

            int id = Integer.parseInt(idCuentas);

            cuentas.setIdCuentas(id);
            cuentas.setDescripcion(descripcion);
            cuentas.setDireccion(direcion);
            cuentas.setCorreo(correo);

            return cuentas;

        } catch (NumberFormatException e) {

        }
        return cuentas;
    }
}
