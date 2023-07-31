<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.UsuarioTabla" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<UsuarioTabla> listaUsuarios = (ArrayList<UsuarioTabla>) request.getAttribute("listaUsuarios");
%>



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
    <jsp:param name="currentPage" value="ListaUsuarios"/>
</jsp:include>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Lista de los usuarios</h1>
        <br>
    </div><!-- End Page Title -->

    <div class="search-bar mt-3">
        <form class="search-form d-flex align-items-center" method="post" action="<%=request.getContextPath()%>/ManagerCuentasServlet?p=b1">
            <input type="text" name="buscador" placeholder="Search" title="Enter search keyword" value="${param.buscador}">
            <button type="submit" title="Search"><i class="bi bi-search"></i></button>
        </form>
    </div>

    <div class="table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Nombre Usuario</th>
            <th scope="col">#Comprados</th>
            <th scope="col">#Vendidos</th>
            <th scope="col">S/. Gastado</th>
            <th scope="col">S/. Generado</th>
            <th scope="col">Opciones</th>
        </tr>
        </thead>
        <tbody class="w-auto">
        <% for (UsuarioTabla u : listaUsuarios) { %>
        <tr>
            <th scope="row"> <a href="<%=request.getContextPath()%>/ManagerCuentasServlet?a=perfil2&id5=<%=u.getIdCuenta()%>"><%=u.getNombre()%></a></th>
            <td><%=u.getJuegosComprados()%></td>
            <td><%=u.getJuegosVendidos()%></td>
            <td> - <%=u.getDineroGastado()%></td>
            <td><%=u.getDineroGanado()%></td>
            <td>
                <%if (u.getDeshabilitado() == 0){%>
                <a onclick="return confirm('Esta seguro de desea Banear al usuario')" class="btn btn-danger"
                   href="<%=request.getContextPath()%>/ManagerCuentasServlet?a=baneo&id1=<%=u.getIdCuenta()%>">Baneo</a>
                <%}else {%>
                    <a onclick="return confirm('Esta seguro de desea Desbanear al usuario')" class="btn btn-success"
                    href="<%=request.getContextPath()%>/ManagerCuentasServlet?a=desbaneo&id2=<%=u.getIdCuenta()%>">Desbaneo</a>
                <%}%>
                <a onclick="return confirm('Esta seguro de desea Descargar')" class="btn btn-info" href="<%=request.getContextPath()%>/ManagerCuentasServlet?a=descargar&id6=<%=u.getIdCuenta()%>">Descargar</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    </div>
</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer" class="footer">

    <!-- Section: Social media -->
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
        <!-- Left -->
        <div class="me-5 d-none d-lg-block">
            <span>Conéctate con nosotras en las redes sociales:</span>
        </div>
        <!-- Left -->

        <!-- Right -->
        <div>
            <a href="" class="me-4 link-secondary">
                <i class="bi bi-facebook"></i>
            </a>
            <a href="" class="me-4 link-secondary">
                <i class="bi bi-twitter"></i>
            </a>
            <a href="" class="me-4 link-secondary">
                <i class="bi bi-instagram"></i>
            </a>
            <a href="" class="me-4 link-secondary">
                <i class="bi bi-linkedin"></i>
            </a>

        </div>
        <!-- Right -->
    </section>
    <!-- Section: Social media -->


    <!-- Section: Links  -->
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <!-- Grid row -->
            <div class="row mt-3">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- Content -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        <i class="fas fa-gem me-3 text-secondary"></i>Nombre de la compañia
                    </h6>
                    <p>
                        Ja-Vagos, somos un grupo de estudiantes que quiere aprobar el curso de Ing. Web para Telecomunicaciones...
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Productos
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Angular</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">React</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Vue</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Laravel</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Links
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Pricing</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Settings</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Orders</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Help</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">Contacto</h6>
                    <p><i class="bi bi-geo-alt me-3 text-secondary"></i>Av. Universitaria 1801, San Miguel</p>
                    <p>
                        <i class="bi bi-envelope me-3 text-secondary"></i>
                        javagos@pucp.edu.pe
                    </p>
                    <p><i class="bi bi-phone me-3 text-secondary"></i> + 51 987 654 321</p>
                    <p><i class="bi bi-telephone me-3 text-secondary"></i> + 01 765 567 21</p>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
    </section>
    <!-- Section: Links  -->



    <div class="copyright">
        &copy; Copyright <strong><span>NiceAdmin</span></strong>. Todos los derechos reservados
    </div>
    <div class="credits">
        Designed by <a href="#">Ja-Vagos</a>
    </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<!-- Vendor JS Files -->
<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/chart.js/chart.umd.js"></script>
<script src="assets/vendor/echarts/echarts.min.js"></script>
<script src="assets/vendor/quill/quill.min.js"></script>
<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="assets/vendor/tinymce/tinymce.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>


<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/lista.js"></script>

</body>

</html>
