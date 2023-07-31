<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Juegos> lista = (ArrayList<Juegos>) request.getAttribute("lista");
  ArrayList<Cuentas> listaPerfil = (ArrayList<Cuentas>) request.getAttribute("perfil");
%>
<jsp:useBean id="vendidos" scope="request" type="com.example.proyecto_iweb.models.beans.JuegosVendidosNuevos"/>
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
<header id="header" class="header fixed-top d-flex align-items-center bg-primary">
  <div class="d-flex align-items-center justify-content-between">
    <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar" class="logo d-flex align-items-center">
      <img src="img/sistema/logoUsuario.png" alt="">
      <span class="d-none d-lg-block text-light">JA-VAGOS</span>
    </a>
  </div>


  <nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">
      <!--BUSCADOR -->
      <li class="nav-item d-block d-lg-none">
        <a class="nav-link nav-icon search-bar-toggle " href="#">
          <i class="bi bi-search"></i>
        </a>
      </li>

      <li class="nav-item dropdown pe-3">

        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
          <img src="img/usuario/usuario1.webp" alt="Profile" class="rounded-circle">
          <span class="d-none d-md-block dropdown-toggle ps-2 text-light">dylan  </span>
        </a><!-- End Profile Iamge Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
          <li class="dropdown-header">
            <h6>dylan </h6>
            <span>Usuario</span>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=perfil">
              <i class="bi bi-person"></i>
              <span>Mi Perfil</span>

            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="#profile-edit">
              <i class="bi bi-gear"></i>
              <span>Configuración</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="cerrarLoguinOficial.html">
              <i class="bi bi-box-arrow-right"></i>
              <span>Sign Out</span>
            </a>
          </li>

        </ul><!-- End Profile Dropdown Items -->
      </li><!-- End Profile Nav -->

    </ul>
  </nav><!-- End Icons Navigation -->

</header>



<!-- ======= Sidebar ======= -->



<div class="container " >
  <br>
  <br>
  <br>
  <h1 class='mt-3'>Agregar Juego Nuevo</h1>
  <form method="POST" action="<%=request.getContextPath()%>/UsuariosJuegosServlet?p=d">
    <div class="mb-3">
      <label for="nombre">Nombre del Juego</label>
      <input type="text" class="form-control" name="nombre" id="nombre">
    </div>
    <div class="mb-3">
      <label for="precio">Precio</label>
      <input type="text" class="form-control" name="precio" id="precio" value="<%=vendidos.getPrecio()%>">
    </div>
    <div class="mb-3">
      <label for="descripcion">Descripcion</label>
      <input type="text" class="form-control" name="descripcion" id="descripcion" value="<%=vendidos.getDescripcion()%>" disabled>
    </div>
    <div class="mb-3">
      <label for="cantidad">Cantidad a Subir</label>
      <input type="text" class="form-control" name="cantidad" id="cantidad" value="<%=vendidos.getCantidad()%>" disabled>
    </div>
    <div class="mb-3">
      <label for="fecha">Fecha en que lo esta subiendo (00-00-00)</label>
      <input type="text" class="form-control" name="fecha" id="fecha" value="now">
    </div>
    <a class="btn btn-danger" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar1">Cancelar</a>
    <button type="submit" class="btn btn-primary">Guardar</button>
  </form>
</div>



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