<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<VentaUsuario> listaNotificaciones = (ArrayList<VentaUsuario>) request.getAttribute("notificaciones");

%>
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
    <link rel="icon" href="pestania.png">

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



    <section class="section faq">
        <div class="row">

            <div class="col-lg-2"></div>

            <% if (listaNotificaciones.size()==0) { %>
            <div class="col-lg-12">
                <div class="pagetitle">
                    <h1 class="mb-4">Notificaciones</h1>
                </div>
                    <br><br>
                    <div class="col text-center">
                        <div class="disponibleUsuario">
                            <div class="col text-center" style="max-width: 1000px;">
                                <h1>Aquí van a aparecer las distintas actualizaciones de su compras y ventas</h1>
                            </div>
                            <br><br>
                                <div>
                                    <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar" class="btn btn-primary">Compre Aquí</a>

                                    <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar1" class="btn btn-primary">Venda Aquí</a>
                                </div>
                            </div>

                </div>
            </div>
            <%}else { %>
            <!-- AQUI VAN LOS FILTROS DE CATEGORIAS-->
            <div class="col-lg-8">
                <div class="pagetitle">
                    <h1 class="mb-4">Notificaciones</h1>
                    <%for (VentaUsuario cv : listaNotificaciones){%>
                    <div class="alert alert-primary" role="alert">
                        <p class="fw-bold" ><%=cv.getJuegos().getNombre()%></p>
                        <p><%=cv.getMensajeAdmin()%></p>
                    </div>
                    <%}%>
                </div>
            </div>
            <%}%>


            <div class="col-lg-2"></div>

        </div>
    </section>

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