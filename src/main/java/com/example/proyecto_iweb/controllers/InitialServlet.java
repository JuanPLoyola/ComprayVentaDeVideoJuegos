package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.daos.EnvioCorreos;
import com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos;
import com.example.proyecto_iweb.models.daos.UsuarioJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "InitialServlet",  urlPatterns = {"","/InitialServlet"})
public class InitialServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();
        RequestDispatcher view;

        switch (action) {
            case "lista":
                request.setAttribute("lista", usuarioJuegosDaos.listarJuegos());
                //request.setAttribute("perfil", cuentasDaos.perfil());
                // request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "verjuego":
                int juegoId = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("juegos", usuarioJuegosDaos.listarJuegoRaiting(juegoId));
                request.getRequestDispatcher("usuario/verJuego.jsp").forward(request, response);
                break;
            case "agregar":
                view = request.getRequestDispatcher("/nuevoUsuario.jsp");
                view.forward(request, response);
                break;
            case "olvidaste":
                view = request.getRequestDispatcher("/olvidasteContraseña.jsp");
                view.forward(request, response);
            break;
            /* todo: esto era para poder validar con un boton la cuenta del usuario
            case "Validacion":
                String correo = request.getParameter("correo");
                try {
                    usuarioCuentasDaos.validarCuenta(correo);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.getRequestDispatcher("loginPage.jsp").forward(request, response);
                break;
                */
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");
        EnvioCorreos envioCorreos = new EnvioCorreos();
        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();


        switch (action) {
            case "b1":
                String textoBuscar1 = request.getParameter("buscador");
                request.setAttribute("lista", usuarioJuegosDaos.buscarPorTitle(textoBuscar1));
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;

            case"guardar":
                Cuentas cuentas1= new Cuentas();
                cuentas1.setNombre(request.getParameter("nombre"));
                cuentas1.setApellido(request.getParameter("apellido"));
                cuentas1.setNickname(request.getParameter("nickname"));
                cuentas1.setDireccion(request.getParameter("direccion"));
                cuentas1.setCorreo(request.getParameter("correo"));
                cuentas1.setPasswordHashed(request.getParameter("password"));
                String confirmPassword = request.getParameter("confirmPassword");

                try {
                    if (cuentas1.getNombre().matches("^\\d.*$") || cuentas1.getApellido().matches("^\\d.*$")) { // Validamos que nombre y apellidos no empiecen por números
                        //NOTA: El Laboratorio específicamente pide que no EMPIECEN, si queremos que no CONTENGAN debemos usar el regex: .*\\d.*
                        response.sendRedirect(request.getContextPath() + "/InitialServlet?action=agregar&errorNombreApellido");
                    }else if (!cuentas1.getPasswordHashed().matches("^(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=]).*$")) { // Validamos que la contraseña tenga una letra mayúscula, un número y un carácter especial
                        response.sendRedirect(request.getContextPath() + "/InitialServlet?action=agregar&errorContrasena");

                    }else if (!cuentas1.getPasswordHashed().equals(confirmPassword)) {
                        response.sendRedirect(request.getContextPath() + "/InitialServlet?action=guardar&errorConfirmacion"); // Validamos que la contraseña y su confimración sean iguales
                    }else if(!isValidEmail(cuentas1.getCorreo())){
                        response.sendRedirect(request.getContextPath() + "/InitialServlet?action=guardar&errorConfirmacion"); // Validamos que el correo

                    }else{

                        usuarioCuentasDaos.guardarUsuario(cuentas1);
                        request.setAttribute("msg1", "Se ha crado exitosamente el usuario");
                        String correo = cuentas1.getCorreo();
                        String nombreCompleto = cuentas1.getNombre() + " " +cuentas1.getApellido();
                        String asunto = "Nueva Cuenta Javagos.com";
                        String enlaceValidacion = request.getContextPath() + "/InitialServlet?action=olvidaste";

                        String contenido = "<html><body>"
                                + "<p>Hola " + nombreCompleto + ",</p>"
                                + "<p>Has creado tu nueva cuenta con este correo. Muchas Gracias por confiar en nosotros</p>"
                               // + "<a href='" + enlaceValidacion + "' style='background-color: #dc3545; color: white; padding: 10px 20px; text-decoration: none; display: inline-block; border-radius: 5px;'>Validar cuenta</a>"
                                + "</body></html>";

                        envioCorreos.createEmail(correo,asunto,contenido);
                        request.getRequestDispatcher("loginPage.jsp").forward(request, response);
                        envioCorreos.sendEmail();
                    }



                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            break;
            case "enviar":
                Cuentas cuentas = new Cuentas();
                HttpSession session3 = request.getSession();
                String nickname =request.getParameter("nickname");
                String correo = request.getParameter("correo");


                Cuentas cuenta2 = usuarioCuentasDaos.olvidarContrasena(nickname,correo);
                if (cuenta2 != null){
                    if(nickname.equals(cuenta2.getNickname()) && correo.equals(cuenta2.getCorreo()) ){
                    usuarioCuentasDaos.olvidarContrasena(cuentas.getNickname(), cuentas.getCorreo());
                    usuarioCuentasDaos.actualizarContrasena(correo);
                    // envio de correo
                    cuentas = usuarioCuentasDaos.correo(cuentas.getCorreo());
                    String asunto = "Nueva Contraseña";
                    String contenido = "Hola se ha actualizado la contraseña con el valor de 123@asdASD. Ingrese y cambie la contraseña";

                    envioCorreos.createEmail(correo,asunto,contenido);
                    request.setAttribute("contraseña","Ya se envió en correo revise la nueva contraseña proporciona y cambie por una nueva");
                    request.getRequestDispatcher("loginPage.jsp").forward(request, response);
                    envioCorreos.sendEmail();
                    }else{
                        request.setAttribute("contraseñaError","No coincide su correo ni su nickname");
                        request.getRequestDispatcher("loginPage.jsp").forward(request, response);
                    }
                }
                else {
                    request.setAttribute("contraseñaError2","No coincide su correo ni su nickname");
                    request.getRequestDispatcher("olvidasteContraseña.jsp").forward(request, response);
                }


            break;
        }
    }


    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}

