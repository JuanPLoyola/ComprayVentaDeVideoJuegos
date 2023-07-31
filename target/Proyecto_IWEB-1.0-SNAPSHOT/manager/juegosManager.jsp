<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Juegos> listaJuegos = (ArrayList<Juegos>) request.getAttribute("listaManager");
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
  <style>
    .juego-imagen {
      width: 270px;
      height: 202px;
      object-fit: cover;
    }
  </style>
</head>

<body>

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
  <jsp:param name="currentPage" value="Juegos"/>
</jsp:include>

<main id="main" class="main">

  <div class="pagetitle">
    <h1>Lista de todos los juegos del catálogo</h1>


  </div>

  <section class="section faq">
    <div class="row">
      <!-- AQUI VAN LOS FILTROS DE CATEGORIAS-->
      <div class="col-lg-12">
        <div class="col-lg-12 d-flex justify-content-end mb-4">
          <a type="button" class="btn btn-warning me-4" href="<%=request.getContextPath()%>/ManagerJuegosServlet?a=top5">TOP 5</a>
          <a type="button" class="btn btn-warning" href="<%=request.getContextPath()%>/ManagerJuegosServlet?a=menos">Menos vendidos</a>
        </div>
      </div>


        <!--DENTRO DE UN DIV-->
        <div class="container">
          <div class="row justify-content-center gap-2">
            <% for (Juegos j : listaJuegos) { %>
            <div class="w-auto">
              <div>
                <div class="card" style="width: 18rem; height: 100%;">
                  <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=j.getIdJuegos()%>" class="card-img-top juego-imagen" alt="...">
                  <div class="card-body">
                    <h5 class="card-title"><%=j.getNombre()%></h5>
                    <a onclick="return confirm('Esta seguro de desea retirar el juego')" class="btn btn-danger"
                       href="<%=request.getContextPath()%>/ManagerJuegosServlet?a=eliminar&id=<%=j.getIdJuegos()%>">Retirar juego</a>
                  </div>
                </div>
              </div>
            </div>
            <% } %>
          </div>



          <!--MODAL DE ADVERTENCIA PARA RETIRAR JUEGO DEL CATALOGO-->
          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="exampleModalLabel">Alerta de juego</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <p>¿Está seguro de eliminar el juego del catálogo?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                  <button type="button" class="btn btn-primary">Sí, eliminar</button>
                </div>
              </div>
            </div>
          </div>

        </div>



      <div class="col-lg-12">

        <!--DENTRO DE UN DIV-->

      </div>

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
