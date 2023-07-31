<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.DetallesNuevos" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.DetallesExistentes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="ventaUsuario" scope="request" type="com.example.proyecto_iweb.models.beans.VentaUsuario"/>
<% ArrayList<DetallesExistentes> lista = (ArrayList<DetallesExistentes>) request.getAttribute("detallesExistentes");%>


<!DOCTYPE html>
<html lang="en">
<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<body>
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="existente"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">

    <div class="container">
        <h1 class="mt-3">Detalles de juego Existente</h1>

        <form method="POST" action="<%=request.getContextPath()%>/AdminJuegosServlet?p=noAceptarExistente">
            <input type="hidden" class="form-control">

            <% for (DetallesExistentes d : lista) { %>
            <div class="row">
                <div class="col-lg-6 h-100">
                    <input type="hidden" class="form-control" name="idVenta" id="idVenta"
                           value="<%=ventaUsuario.getIdVenta()%>">
                    <div class="mb-3">
                        <label for="juego">Nombre del Juego</label>
                        <input type="text" class="form-control" name="precio" id="juego" value="<%=d.getNombre() %>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="usuario">Usuario vendedor</label>
                        <input type="text" class="form-control" name="precio" id="usuario" value="<%=d.getNombreUsuario() %>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="precio">Precio de venta propuesto</label>
                        <input type="text" class="form-control" name="precio" id="precio" value="<%=ventaUsuario.getPrecioVenta()%>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="stock">Stock</label>
                        <input type="text" class="form-control" name="stock" id="stock" value="<%=d.getStock() %>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="cant_ventas">Cantidad de unidades vendidas</label>
                        <input type="text" class="form-control" name="cant_ventas" id="cant_ventas" value="<%=d.getCant_ventas() %>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="consola">Consola</label>
                        <input type="text" class="form-control" name="precio" id="consola" value="<%=d.getConsola() %>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="genero">Género</label>
                        <input type="text" class="form-control" name="precio" id="genero" value="<%=d.getGenero() %>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="mensajeAdmin">DEJAR MOTIVO DE NO ACEPTACIÓN</label>
                        <input type="text" class="form-control" name="mensajeAdmin" id="mensajeAdmin" value="<%= (ventaUsuario.getMensajeAdmin() != null && !ventaUsuario.getMensajeAdmin().isEmpty()) ? ventaUsuario.getMensajeAdmin() : "" %>" >
                    </div>

                    <% if (request.getParameter("error") != null && request.getParameter("error").equals("mensajeVacio")) { %>
                    <div class="alert alert-danger">Tiene que dejar un mensaje de por qué no se acepta el juego.</div>
                    <% } %>

                </div>
                <div class="col-lg-6 d-flex flex-column h-200">
                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=d.getIdJuego()%>" alt="" class="img-fluid max-width-100">
                    <div class="d-flex justify-content-between align-items-center mt-3 flex-grow-1 pl-2">
                        <a class="btn btn-danger me-auto mx-4" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=existentes">Regresar</a>
                        <div class="d-flex mx-3">
                            <button type="submit" class="btn btn-primary" onclick="return confirm('¿Está seguro de realizar esta acción?')">No aceptar juego</button>
                        </div>
                    </div>
                </div>
            </div>

            <% } %>
        </form>
    </div>
</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/lista.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>


</body>

</html>