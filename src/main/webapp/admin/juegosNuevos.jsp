<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<VentaUsuario> lista = (ArrayList<VentaUsuario>) request.getAttribute("nuevos");%>

<!DOCTYPE html>
<html lang="en">
<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<style>
    .juego-imagen {
        width: 444px;
        height: 250px;
        object-fit: cover;
    }
</style>
<body>
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="nuevo"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">
    <div class="col-lg-1"></div>
    <div class="col-lg-12">
        <% for (VentaUsuario vu : lista) { %>
        <div class="card mb-10" style="max-width: 1500px;">
            <div class="row g-0">
                <div class="col-md-5 d-flex align-items-center">
                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=vu.getIdJuego()%>" class="card-img-top juego-imagen" alt="...">

                </div>
                <div class="col-md-7">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <h5 class="card-title"><%=vu.getJuegos().getNombre() %></h5>
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=detallesJuegoNuevo&id=<%=vu.getIdVenta()%>" class="btn btn-primary">Ver detalles</a>
                        </div>
                        <p class="card-text">Genero: <%=vu.getJuegos().getGenero()%></p>
                        <p class="card-text">Usuario vendedor: <%=vu.getUsuario().getNombre() %> <%=vu.getUsuario().getApellido() %></p>
                        <p class="card-text" style="font-size: 1.2em;"><strong>Precio de venta propuesto: S/.<%=vu.getPrecioVenta()%> </strong></p>
                        <div class="d-flex justify-content-end">
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=aceptarNuevo&idventa=<%=vu.getIdVenta()%>&idjuego=<%=vu.getIdJuego()%>" class="btn btn-primary m-1">Aceptar</a>
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=noAceptarNuevo&id=<%=vu.getIdVenta()%>" class="btn btn-primary m-1">No aceptar</a>
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=rechazarNuevo&id=<%=vu.getIdVenta()%>" class="btn btn-danger m-1">Rechazar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <div class="col-lg-1"></div>

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