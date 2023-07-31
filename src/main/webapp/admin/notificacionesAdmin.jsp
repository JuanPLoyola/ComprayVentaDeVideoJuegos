<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<%
    ArrayList<VentaUsuario> listaNotificaciones = (ArrayList<VentaUsuario>) request.getAttribute("notificaciones");

%>

<% ArrayList<CompraUsuario> lista = (ArrayList<CompraUsuario>) request.getAttribute("lista"); %>

<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>JA-VAGOS</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="icon" href="img/sistema/pestania.png">

    <!-- Estilos CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <!--Importando estilos CSS-->
    <link rel="stylesheet" href="estilos/usuario/filtros.css">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>

<body>

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="listar"/>
</jsp:include>

<main id="main" class="main">



    <div class="container">
        <div class="pagetitle">
            <h1 class="mb-4">Notificaciones</h1>
        </div>

        <div class="col text-center">
            <div class="disponibleUsuario">

                <div class="row">
                    <div class="col-md-10">
                        <% boolean alertaImpresa = false; %>

                        <% for (CompraUsuario c : lista) {%>
                        <% if(usuarioLog.getIdCuentas() == c.getIdAdmin()) {%>
                        <%
                            LocalDate fecha1 = c.getFechaCompra().toLocalDate();
                            LocalDate fecha2 = LocalDate.now();
                            long diferenciaEnDias = ChronoUnit.DAYS.between(fecha1, fecha2);
                        %>
                        <%    if (c.getEstados().getEstados().equals("pendiente") && diferenciaEnDias > 10) {
                        %>
                        <div class="alert alert-primary" role="alert">
                            <p class="fw-bold">Alerta: El usuario <%= c.getUsuario().getNombre() %> <%= c.getUsuario().getApellido() %></p>
                            <p>Tiene <span style="color: red;"><%= diferenciaEnDias %> días</span> de retraso en la entrega del juego <span style="color: red;"><%=c.getJuegos().getNombre()%></span>, revísalo</p>
                            <a href="<%= request.getContextPath() %>/AdminJuegosServlet?a=detallesCompra&id=<%= c.getIdCompra() %>"
                               class="btn btn-primary m-1">Detalles</a>
                        </div>
                        <%
                                    // Marcar la alerta como impresa
                                    alertaImpresa = true;
                                }
                            }%>
                        <%}%>

                        <% if (!alertaImpresa) { %>
                        <div class="alert alert-primary" role="alert">
                            <p class="fw-bold">Aún no tiene alertas</p>
                        </div>
                        <% } %>
                    </div>

                    <div class="col-md-2">
                        <div class="position-fixed end-1">
                            <div>
                                <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=reservas" class="btn btn-danger d-flex align-items-center">
                                    <span class="align-middle d-flex align-items-center">Revisar Comprados/Reservados</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </div>

    </div>


</main><!-- End #main -->

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