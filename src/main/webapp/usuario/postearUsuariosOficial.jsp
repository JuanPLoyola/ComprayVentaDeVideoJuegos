<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Juegos> lista = (ArrayList<Juegos>) request.getAttribute("lista");
%>
<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>


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
  <jsp:param name="currentPage" value="postear"/>
</jsp:include>

<main id="main" class="main">
  <% if (session.getAttribute("msg") != null) {%>
  <div class="alert alert-success" role="alert"><%=session.getAttribute("msg")%></div>
  <%session.removeAttribute("msg");%>
  <% }%>
  <% if (session.getAttribute("msg1") != null) {%>
  <div class="alert alert-success" role="alert"><%=session.getAttribute("msg1")%></div>
  <%session.removeAttribute("msg1");%>
  <% }%>
  <div class="pagetitle">
    <h1>¿Que videojuego desea postear?</h1>
  </div><!-- End Page Title -->
  <div class="row">
    <div class="col-9">
      <div class="form-floating">
        <form method="post" action="<%=request.getContextPath()%>/UsuariosJuegosServlet?p=b">
          <div class="form-floating mb-3">
            <input type="text" class="form-control" placeholder="Buscador" name="textoBuscar">
            <label>Buscar juego existente a subir</label>
          </div>
        </form>
      </div>
    </div>
    <div class="col-3">
      <a class="btn btn-success" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=agregar">Agregar Juego Nuevo</a>
    </div>
  </div>

  <div class="table-responsive">
  <table class="table table-stripped">
    <thead>
    <tr>
      <th>Nombre del juego</th>
      <th>Descripcion</th>
      <th>Precio</th>
      <th>Stock</th>
      <th> </th>
    </tr>
    </thead>
    <tbody>
    <% for (Juegos j : lista) { %>
    <tr>
      <td><%=j.getNombre()%>
      </td>
      <td><%=j.getDescripcion() %>
      </td>
      <td><%=j.getPrecio()%>
      </td>
      <td><%=j.getStock()%>
      </td>
      <td><a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=agregarjuego&id=<%=j.getIdJuegos()%>" class="btn btn-primary">Subir este juego</a>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
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