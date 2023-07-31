<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="formulario" scope="request" type="com.example.proyecto_iweb.models.beans.VentaUsuario"/>

<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>

<html>
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
    <jsp:param name="currentPage" value="postear"/>
</jsp:include>


<main  id="main" class="main">
    <div class="container " >
        <h1 class='mt-3'>Formulario del Juego ingresado</h1>



        <form method="POST" action="<%=request.getContextPath()%>/UsuariosJuegosServlet">
            <input type="hidden" class="form-control" name="idVentas" id="idVentas"
                   value="<%=formulario.getIdVenta()%>">
            <div class="row">
                <div class="col-lg-6">
                    <div class="mb-3">
                        <label for="nombre">Nombre del Juego</label>
                        <input type="text" class="form-control" name="nombre" id="nombre" value="<%=formulario.getJuegos().getNombre()%>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="precioVenta">Precio</label>
                        <input type="text" class="form-control" name="precioVenta" id="precioVenta" value="<%=formulario.getPrecioVenta()%>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="descripcion">Descripcion</label>
                        <textarea class="form-control" id="descripcion" name="descripcion" disabled style="resize: none; height: auto;"><%=formulario.getJuegos().getDescripcion()%></textarea>

                    </div>
                    <div class="mb-3">
                        <label for="consola">Consola</label>
                        <input type="text" class="form-control" name="consola" id="consola" value="<%=formulario.getJuegos().getConsola()%>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="genero">Genero</label>
                        <input type="text" class="form-control" name="genero" id="genero" value="<%=formulario.getJuegos().getGenero()%>" disabled>
                    </div>
                    <div class="mb-3" >
                        <label type="hidden" for="foto" class="form-label"></label>
                        <input type="hidden" class="form-control" id="foto" name="foto"  value="<%=formulario.getJuegos().getFoto()%>" disabled >
                    </div>
                    <a class="btn btn-danger" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=vendidos">Regresar</a>
                </div>
                <div class="col-lg-6">
                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=formulario.getJuegos().getIdJuegos()%>" alt="" class="img-fluid max-width-100">
                </div>
            </div>


        </form>
    </div>
</main>

<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>



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