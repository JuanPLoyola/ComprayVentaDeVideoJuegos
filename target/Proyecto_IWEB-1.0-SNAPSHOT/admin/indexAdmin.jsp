
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<% ArrayList<Juegos> lista = (ArrayList<Juegos>) request.getAttribute("lista"); %>
<jsp:useBean id="userAdmin" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>

<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>


<!DOCTYPE html>
<html lang="en">

<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<style>
    .juego-imagen {
        width: 325px;
        height: 240px;
        object-fit: cover;
    }
</style>

<body>
<!-- ======= Header ======= -->
<jsp:include page="/includes/narvar.jsp">
    <jsp:param name="currentPage" value="indexAdmin"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">

    <% if (session.getAttribute("juegoCreado") != null) {%>
        <div class="alert alert-success" role="alert"><%=session.getAttribute("juegoCreado")%></div>
        <%session.removeAttribute("juegoCreado");%>
    <% }%>

    <% if (session.getAttribute("cambioDescuento") != null) {%>
    <div class="alert alert-success" role="alert"><%=session.getAttribute("cambioDescuento")%></div>
    <%session.removeAttribute("cambioDescuento");%>
    <% }%>

    <% if (session.getAttribute("juegoActualizado") != null) {%>
    <div class="alert alert-success" role="alert"><%=session.getAttribute("juegoActualizado")%></div>
    <%session.removeAttribute("juegoActualizado");%>
    <% }%>

    <div class="row">

        <div class="col-md-10">
            <% for (Juegos j : lista) { %>
            <% if (j.getDescuento()>0) {%>
            <div class="card mb-10" style="max-width: 1500px;">
                <div class="row g-0">
                    <div class="col-md-5 d-flex align-items-center">
                        <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=j.getIdJuegos()%>" class="card-img-top juego-imagen" alt="...">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h3 class="card-title text-danger"><%=j.getNombre()%> </h3>
                            <p class="card-text"><%=j.getDescripcion()%></p>
                            <p class="card-text text-decoration-line-through">Precio: $ <%=j.getPrecio()%></p>
                            <h5 class="card-text text-danger fw-bold">Oferta: S/. <%=(j.getPrecio() - j.getPrecio()*j.getDescuento()/100)%></h5>

                            <div>
                                <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=editarJuego&id=<%=j.getIdJuegos()%>" class="btn btn-primary ml-5">Editar</a>
                                <a onclick="return confirm('Esta seguro de desea eliminar el juego')" class="btn btn-danger"
                                   href="<%=request.getContextPath()%>/AdminJuegosServlet?a=deshabilitarJuego&id=<%=j.getIdJuegos()%>">Eliminar</a>
                                <div class="izquierda d-flex justify-content-end">
                                    <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=ofertarJuego&id=<%=j.getIdJuegos()%>" class="btn btn-primary">Modificar Oferta</a>

                                </div>
                            </div>
                        </div>

                        <br>
                    </div>
                </div>
            </div>
            <% } else {%>
            <div class="card mb-10" style="max-width: 1500px;">
                <div class="row g-0">
                    <div class="col-md-5 d-flex align-items-center">
                        <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=j.getIdJuegos()%>" class="card-img-top juego-imagen" alt="...">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title col-lg-8"><%=j.getNombre()%></h5>
                            <p class="card-text"><%=j.getDescripcion()%></p>
                            <p class="card-text">Precio: S/. <%=j.getPrecio()%></p>
                            <div>
                                <div class="derecha">
                                    <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=editarJuego&id=<%=j.getIdJuegos()%>" class="btn btn-primary ml-5">Editar</a>
                                    <a onclick="return confirm('Esta seguro de desea eliminar el juego')" class="btn btn-danger"
                                       href="<%=request.getContextPath()%>/AdminJuegosServlet?a=deshabilitarJuego&id=<%=j.getIdJuegos()%>">Eliminar</a>
                                </div>

                                <div class="izquierda d-flex justify-content-end">
                                    <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=ofertarJuego&id=<%=j.getIdJuegos()%>" class="btn btn-primary">Ofertar</a>

                                </div>

                            </div>

                        </div>

                        <br>
                    </div>
                </div>
            </div>
            <% } %>
            <% } %>
        </div>
        <div class="col-md-2">
            <div class="position-fixed end-1">

                <div>
                    <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=crearJuego" class="btn btn-danger d-flex align-items-center">
                        <i class="bi bi-controller fs-4 me-2"></i>
                        <span class="align-middle d-flex align-items-center">Juego Nuevo</span>
                    </a>
                </div>
                <br>
                <div>
                    <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=ofertas" class="btn btn-danger d-flex align-items-center">
                        <i class="bi bi-joystick fs-4 me-2"></i>
                        <span class="align-middle d-flex align-items-center">Ofertas</span>
                    </a>
                </div>
            </div>
        </div>

    </div>

</main>


<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<!-- Vendor JS Files -->
<script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/vendor/chart.js/chart.umd.js"></script>
<script src="/assets/vendor/echarts/echarts.min.js"></script>
<script src="/assets/vendor/quill/quill.min.js"></script>
<script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>