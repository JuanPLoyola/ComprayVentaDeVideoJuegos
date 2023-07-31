package com.example.proyecto_iweb.controllers;

import java.io.*;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos;
import com.example.proyecto_iweb.models.daos.UsuarioJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "UsuariosCuentasServlet", urlPatterns = {"/UsuariosCuentasServlet"})
public class UsuariosCuentasServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();
        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
        HttpSession session = request.getSession();
        Cuentas cuentas = (Cuentas) session.getAttribute("usuarioLog");
        RequestDispatcher view;

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        switch (action) {
            case  "perfil" :
                String id = request.getParameter("id");
                request.setAttribute("cuentas", usuarioCuentasDaos.listar(cuentas.getIdCuentas()));
                //request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                request.getRequestDispatcher("usuario/miPerfilOficial.jsp").forward(request, response);
                break;
            case "listar":
                //request.setAttribute("listar1", usuarioJuegosDaos.listarJuegos());
                //request.setAttribute("perfil", usuarioCuentasDaos.perfil());

                request.getRequestDispatcher("usuario/indexUsuarioOficial.jsp").forward(request, response);

                break;
            case "vendidos":

                request.setAttribute("listar2", usuarioJuegosDaos.listarVendidos(cuentas.getIdCuentas()));
                request.getRequestDispatcher("usuario/vendidosUsuariosOficial.jsp").forward(request, response);
                break;
            case "comprados":
                request.setAttribute("listar3", usuarioJuegosDaos.listarComprados(cuentas.getIdCuentas()));
                request.getRequestDispatcher("usuario/compradosUsuariosOficial.jsp").forward(request, response);
                break;
            case"agregar":
                view = request.getRequestDispatcher("/nuevoUsuario.jsp");
                view.forward(request, response);
                break;
            case "actualizarFoto1":
                usuarioCuentasDaos.actualizarFoto1(cuentas.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el a cambio");
                response.sendRedirect(request.getContextPath() + "/UsuariosCuentasServlet?a=perfil" );
                break;
            case "actualizarFoto2":
                usuarioCuentasDaos.actualizarFoto2(cuentas.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el cambio");
                response.sendRedirect(request.getContextPath() + "/UsuariosCuentasServlet?a=perfil" );
                break;
            case "actualizarFoto3":
                usuarioCuentasDaos.actualizarFoto3(cuentas.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el cambio");
                response.sendRedirect(request.getContextPath() + "/UsuariosCuentasServlet?a=perfil" );
                break;
            case "actualizarFoto4":
                usuarioCuentasDaos.actualizarFoto4(cuentas.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el cambio");
                response.sendRedirect(request.getContextPath() + "/UsuariosCuentasServlet?a=perfil" );
                break;

            // INTERFAZ DE COMPRA
            case "carrito":
                int juegoId = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("juegos", usuarioJuegosDaos.listar(juegoId));
                request.getRequestDispatcher("usuario/carrito.jsp").forward(request, response);
                break;

            case "pagar":
                request.getRequestDispatcher("usuario/tarjetaCredito.jsp").forward(request, response);
                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "guardar" : request.getParameter("p");

        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();
        HttpSession session = request.getSession();
        switch (action) {
            case "a":
                Cuentas cuentas = parseCuentas(request);
                //usuarioCuentasDaos.actualizar(cuentas);
                HttpSession session1 = request.getSession();
                String direccion = cuentas.getDireccion();
                String correo = cuentas.getCorreo();
                // Validar que la dirección no esté vacía
                if (direccion.isEmpty()) {
                    // Redirigir a la página de perfil con mensaje de error
                    String errorMessage = "La dirección no puede estar vacía";
                    session1.setAttribute("msg1","Ingresar una direccion valida");
                    response.sendRedirect(request.getContextPath() + "/UsuariosCuentasServlet?a=perfil");
                    return;
                }

                // Validar que el correo sea válido
                if (!isValidEmail(correo)) {
                    // Redirigir a la página de perfil con mensaje de error
                    String errorMessage = "Ingresar correo valido";
                    session1.setAttribute("msg1","¡¡¡¡Correo Invalido!!!!");
                    response.sendRedirect(request.getContextPath() + "/UsuariosCuentasServlet?a=perfil");
                    return;
                }

                usuarioCuentasDaos.actualizar(cuentas);
                session1.setAttribute("msg","Perfil actualizado");
                response.sendRedirect(request.getContextPath() + "/UsuariosCuentasServlet?a=perfil");

                //Cuentas cuentas2 = (Cuentas) session1.getAttribute("usuarioLog");
                //response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=perfil&id="+ cuentas2.getIdCuentas());
                break;
            case"guardar":

                Cuentas cuentas1= new Cuentas();
                cuentas1.setNombre(request.getParameter("nombre"));
                cuentas1.setApellido(request.getParameter("apellido"));
                cuentas1.setNickname(request.getParameter("nickname"));
                cuentas1.setDireccion(request.getParameter("direccion"));
                cuentas1.setCorreo(request.getParameter("correo"));
                cuentas1.setPasswordHashed(request.getParameter("password"));

                try {


                    usuarioCuentasDaos.guardarUsuario(cuentas1);
                    response.sendRedirect("/Proyecto_IWEB_war_exploded/UsuariosJuegosServlet");

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            break;
            case "actualizarPassword":
                cuentas = (Cuentas) session.getAttribute("usuarioLog");
                String password = request.getParameter("password");

                Cuentas cuentas2 = usuarioCuentasDaos.validarCambioPassword(cuentas.getIdCuentas(), password);

                if (cuentas2 != null){
                    String password1 = request.getParameter("newpassword1");
                    String password2 = request.getParameter("newpassword2");
                    if (password1.equals(password2)  && !request.getParameter("newpassword1").isEmpty() && password1.length()>=5){
                        usuarioCuentasDaos.actualizarPassword(cuentas2.getIdCuentas(), request.getParameter("newpassword1"));
                        session.setAttribute("msg2","Contraseña cambiada correctamente");
                        response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=perfil");
                    }
                    else {
                        session.setAttribute("msgError", "Las contraseñas deben ser iguales o es mayor a 5 dígitos");
                        response.sendRedirect(request.getContextPath()+"/UsuariosJuegosServlet?a=perfil");
                    }
                }
                else {
                    session.setAttribute("msgError", "La contraseña actual es incorrecta");
                    response.sendRedirect(request.getContextPath()+"/UsuariosJuegosServlet?a=perfil");
                }

                break;
        }


    }

    public Cuentas parseCuentas(HttpServletRequest request)  {

        Cuentas cuentas = new Cuentas();
        String idCuentas = request.getParameter("idCuentas") != null ? request.getParameter("idCuentas") : "";
        String descripcion = request.getParameter("descripcion");
        String direccion = request.getParameter("direccion");
        String correo = request.getParameter("correo");

        try {

            int id = Integer.parseInt(idCuentas);

            cuentas.setIdCuentas(id);
            cuentas.setDescripcion(descripcion);
            cuentas.setDireccion(direccion);
            cuentas.setCorreo(correo);

            return cuentas;

        } catch (NumberFormatException e) {

        }
        return cuentas;
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
