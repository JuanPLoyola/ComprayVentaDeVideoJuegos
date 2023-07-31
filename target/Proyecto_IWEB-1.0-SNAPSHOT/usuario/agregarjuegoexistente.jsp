<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="verJuego" scope="request" type="com.example.proyecto_iweb.models.beans.Juegos"/>

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
    <% if (session.getAttribute("err") != null) {%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("err")%></div>
    <%session.removeAttribute("err");%>
    <% }%>
    <div class="container " >
        <h1 class='mt-3'>Editar Juego Existente</h1>
        <form method="POST" action="<%=request.getContextPath()%>/UsuariosJuegosServlet?p=e">
            <input type="hidden" class="form-control" name="idJuego" id="idJuego"
                   value="<%=verJuego.getIdJuegos()%>">
            <div class="mb-3">
                <label for="nombre">Nombre del Juego</label>
                <input type="text" class="form-control" name="nombre" id="nombre" value="<%=verJuego.getNombre()%>" disabled>
            </div>
            <div class="mb-3">
                <label for="precioVenta">Precio</label>
                <input type="text" class="form-control" name="precioVenta" id="precioVenta" value="<%=verJuego.getPrecio()%>">
            </div>
            <div class="mb-3">
                <label for="descripcion">Descripcion</label>
                <textarea class="form-control" id="descripcion" name="descripcion" disabled style="resize: none; height: auto;"><%=verJuego.getDescripcion()%></textarea>

            </div>
            <div class="mb-3">
                <label for="consola">Consola</label>
                <input type="text" class="form-control" name="consola" id="consola" value="<%=verJuego.getConsola()%>" disabled>
            </div>
            <div class="mb-3">
                <label for="genero">Genero</label>
                <input type="text" class="form-control" name="genero" id="genero" value="<%=verJuego.getGenero()%>" disabled>
            </div>
            <div class="mb-3">
                <label for="foto" class="form-label">Añadir foto del juego</label>
                <input class="form-control" type="file" id="foto" name="foto"  value="<%=verJuego.getFoto()%>" disabled >
            </div>
            <a class="btn btn-danger" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar1">Cancelar</a>
            <button type="submit" class="btn btn-primary">Cambiar Precio</button>
        </form>
    </div>
</main>




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