<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.JuegosExistentes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<JuegosExistentes> lista = (ArrayList<JuegosExistentes>) request.getAttribute("existentes");%>

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
    <jsp:param name="currentPage" value="existente"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">
    <div class="col-lg-1"></div>
    <div class="col-lg-12">
        <% for (JuegosExistentes j : lista) { %>
        <div class="card mb-10" style="max-width: 1500px;">
            <div class="row g-0">
                <div class="col-md-5">
                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=j.getIdJuego()%>" alt="" class="card-img-top juego-imagen">
                </div>
                <div class="col-md-7">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <h5 class="card-title"><%=j.getNombre() %></h5>
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=detallesJuegoExistente&id=<%=j.getIdVenta()%>" class="btn btn-primary">Ver detalles</a>
                        </div>
                        <p class="card-text">Stock: <%=j.getStock()%></p>
                        <p class="card-text">Cantidad de copias vendidas: <%=j.getCant_ventas() %></p>
                        <p class="card-text" style="font-size: 1.2em;"><strong>Precio de venta propuesto: S/.<%=j.getPrecioVenta()%> </strong></p>
                        <div class="d-flex justify-content-end">
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=aceptarExistente&idventa=<%=j.getIdVenta()%>&idjuego=<%=j.getIdJuego()%>" class="btn btn-primary m-1">Aceptar</a>
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=noAceptarExistente&id=<%=j.getIdVenta()%>" class="btn btn-primary m-1">No aceptar</a>
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=rechazarExistente&id=<%=j.getIdVenta()%>" class="btn btn-danger m-1">Rechazar</a>
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