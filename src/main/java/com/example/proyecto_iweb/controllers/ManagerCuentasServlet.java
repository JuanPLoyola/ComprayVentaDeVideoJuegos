package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.daos.DescargaCSV;
import com.example.proyecto_iweb.models.daos.EnvioCorreos;
import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.daos.ManagerCuentasDaos;
import com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos;
import com.example.proyecto_iweb.models.dtos.UsuarioTabla;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.lang.System.out;

@WebServlet(name = "ManagerCuentasServlet", value = "/ManagerCuentasServlet")
public class ManagerCuentasServlet extends HttpServlet {

    // bug con el override

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        ManagerCuentasDaos usuarioDao = new ManagerCuentasDaos();
        EnvioCorreos envioCorreos = new EnvioCorreos();

        HttpSession session = request.getSession();
        Cuentas cuentaslog = (Cuentas) session.getAttribute("usuarioLog");
        RequestDispatcher view;

        String action = request.getParameter("a") == null ? "ListaUsuarios" : request.getParameter("a");



        switch (action){
            // ver mi perfil -----------------------------------------------------------------------
            case "perfil":
                request.setAttribute("cuentas", usuarioDao.listar(cuentaslog.getIdCuentas()));
                request.getRequestDispatcher("manager/miPerfilManager.jsp").forward(request, response);
                break;
            // ver perfil de los usuarios y administradores ----------------------------------------
            case "perfil2":
                String id5 = request.getParameter("id5");
                request.setAttribute("cuentas", usuarioDao.listar(Integer.parseInt(id5)));
                request.setAttribute("listarRegistro", usuarioDao.ListarRegistro(id5));
                request.setAttribute("historial",usuarioDao.tablaHistorial(id5));
                request.getRequestDispatcher("manager/perfilAdminManager.jsp").forward(request, response);
                break;


            // actualizar la oto del perfil -------------------------------------------------------
            case"actualizarFoto1":
                usuarioDao.actualizarFoto1(cuentaslog.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el a cambio");
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=perfil" );
                break;

            case"actualizarFoto2":
                usuarioDao.actualizarFoto2(cuentaslog.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el cambio");
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=perfil" );
                break;
            case"actualizarFoto3":
                usuarioDao.actualizarFoto3(cuentaslog.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el cambio");
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=perfil" );
                break;
            case"actualizarFoto4":
                usuarioDao.actualizarFoto4(cuentaslog.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el cambio");
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=perfil" );
                break;

            // --------------------------------------------------------------------------------------------------

            case "ListaUsuarios":
                request.setAttribute("listaUsuarios",usuarioDao.listarUsuariosTabla());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("manager/usuarioManager.jsp");
                requestDispatcher.forward(request,response);
                break;

            case "baneo":
                String id1 = request.getParameter("id1");
                usuarioDao.deshabilitarCuenta(id1);
                request.getSession().setAttribute("info","Usuario Baneado");
                // envio de correo
                Cuentas cuentas = usuarioDao.correo(id1);
                String asunto = "Has sido Baneado";
                String contenido = "Hola," + cuentas.getNombre() + " " + cuentas.getApellido() + ", has sido Baneado de Javagos.com, Puedes pedir mayor informacion escribiendo a uno de nuestros administradores";
                String correo = cuentas.getCorreo();
                envioCorreos.createEmail(correo,asunto,contenido);
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=ListaUsuarios");
                envioCorreos.sendEmail();
                break;

            case "desbaneo":
                String id2 = request.getParameter("id2");
                usuarioDao.habilitarCuenta(id2);
                request.getSession().setAttribute("info2","Usuario Desbaneado");
                // envio de correo
                cuentas = usuarioDao.correo(id2);
                asunto = "Has sido Desbaneado";
                contenido = "Hola," + cuentas.getNombre() + " " + cuentas.getApellido() + ", has sido Desbaneado de Javagos.com, Felicidades podras seguir gastando tu dinero en nuestra pagina";
                correo = cuentas.getCorreo();
                envioCorreos.createEmail(correo,asunto,contenido);
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=ListaUsuarios");
                envioCorreos.sendEmail();
                break;

            case "descargar":
                String id6 = request.getParameter("id6");
                UsuarioTabla userDescarga = usuarioDao.ListarRegistro(id6);
                DescargaCSV.exportarListaCSV(userDescarga);
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=ListaUsuarios");
                break;


            case "ListaEmpleados":
                request.setAttribute("listaEmpleados", usuarioDao.listarEmpleadosTabla());
                RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("manager/adminManager.jsp");
                requestDispatcher1.forward(request,response);
                break;

            case "eliminar":
                String id4 = request.getParameter("id4");

                request.getSession().setAttribute("info3","Trabajador Despedido");

                ArrayList<Integer> numbers = new ArrayList<>();
                numbers.add(10);
                numbers.add(11);
                numbers.add(133);
                numbers.remove(Integer.valueOf(id4));
                int randomIndex = new Random().nextInt(numbers.size());
                int nuevoAdmin = numbers.get(randomIndex);
                usuarioDao.deshabilitarCuenta(id4);
                usuarioDao.actualizarBaneoCompras(nuevoAdmin,Integer.parseInt(id4));
                usuarioDao.actualizarBaneoVentas(nuevoAdmin,Integer.parseInt(id4));


                // envio de correo
                cuentas = usuarioDao.correo(id4);
                asunto = "Has sido Despedido";
                contenido = "Hola," + cuentas.getNombre() + " " + cuentas.getApellido() + ", has sido despedido de Javagos.com, pero no te preocupes te daremos una carta de recomendacion para tu futuro trabajo. que tengas buen dia ";
                correo = cuentas.getCorreo();
                envioCorreos.createEmail(correo,asunto,contenido);
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=ListaEmpleados");
                envioCorreos.sendEmail();
                break;





        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "guardar" : request.getParameter("p");

        ManagerCuentasDaos usuarioDao = new ManagerCuentasDaos();

        switch (action) {
            case "a":
                Cuentas cuentas = parseCuentas(request);
                HttpSession session = request.getSession();
                String direccion = cuentas.getDireccion();
                String correo = cuentas.getCorreo();

                // Validar que la dirección no esté vacía
                if (direccion.isEmpty()) {
                    // Redirigir a la página de perfil con mensaje de error
                    String errorMessage = "La dirección no puede estar vacía";
                    session.setAttribute("msg1","Ingresar una direccion valida");
                    response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=perfil");
                    return;
                }

                // Validar que el correo sea válido
                if (!isValidEmail(correo)) {
                    // Redirigir a la página de perfil con mensaje de error
                    String errorMessage = "Ingresar correo valido";
                    session.setAttribute("msg1","¡¡¡¡Correo Invalido!!!!");
                    response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=perfil");
                    return;
                }

                usuarioDao.actualizar(cuentas);
                session.setAttribute("msg","Perfil actualizado");
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=perfil");
                break;

            case "b1":
                String textoBuscar = request.getParameter("buscador");
                request.setAttribute("listaUsuarios", usuarioDao.buscarPorTitle(textoBuscar));
                request.getRequestDispatcher("manager/usuarioManager.jsp").forward(request, response);
                break;
            case "actualizarPassword":
                HttpSession session1 = request.getSession();
                cuentas = (Cuentas) session1.getAttribute("usuarioLog");
                String password = request.getParameter("password");

                Cuentas cuentas2 = usuarioDao.validarCambioPassword(cuentas.getIdCuentas(), password);

                if (cuentas2 != null){
                    String password1 = request.getParameter("newpassword1");
                    String password2 = request.getParameter("newpassword2");
                    if (password1.equals(password2)  && !request.getParameter("newpassword1").isEmpty() && password1.length()>=5){
                        usuarioDao.actualizarPassword(cuentas2.getIdCuentas(), request.getParameter("newpassword1"));
                        session1.setAttribute("msg2","Contraseña cambiada correctamente");
                        response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=perfil");
                    }
                    else {
                        session1.setAttribute("msgError", "Las contraseñas deben ser iguales o es mayor a 5 dígitos");
                        response.sendRedirect(request.getContextPath()+"/ManagerCuentasServlet?a=perfil");
                    }
                }
                else {
                    session1.setAttribute("msgError", "La contraseña actual es incorrecta");
                    response.sendRedirect(request.getContextPath()+"/ManagerCuentasServlet?a=perfil");
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

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }


}
