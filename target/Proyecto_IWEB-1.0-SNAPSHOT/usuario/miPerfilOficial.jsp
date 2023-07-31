<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>

<jsp:useBean id="cuentas" scope="request" type="com.example.proyecto_iweb.models.beans.Cuentas"/>

<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>JA-VAGOS</title>

  <style>
    .mi-enlace1 {
      display: inline-block;
      width: 110px;
      height: 110px;
      background-image: url('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/10f13510774061.560eadfde5b61.png');
      background-size: cover;
      text-indent: -9999px;
    }


    .mi-enlace2 {
      display: inline-block;
      width: 110px;
      height: 110px;
      background-image: url('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/04492c10774061.560eac09c8845.png');
      background-size: cover;
      text-indent: -9999px;
    }


    .mi-enlace3 {
      display: inline-block;
      width: 110px;
      height: 110px;
      background-image: url('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/200f2910774061.560eac1cd606c.png');
      background-size: cover;
      text-indent: -9999px;
    }


    .mi-enlace4 {
      display: inline-block;
      width: 110px;
      height: 110px;
      background-image: url('https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/8176fd10774061.560eac094d534.png');
      background-size: cover;
      text-indent: -9999px;
    }
  </style>




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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/css/bootstrap.min.css">

</head>

<body>

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
  <jsp:param name="currentPage" value=""/>
</jsp:include>

<main id="main" class="main">

  <div class="pagetitle">
    <h1>Mi perfil</h1>
  </div>

  <section class="section profile">
    <div class="row">
      <% if (session.getAttribute("msg") != null) {%>
      <div class="alert alert-success" role="alert"><%=session.getAttribute("msg")%></div>
      <%session.removeAttribute("msg");%>
      <% }%>
      <% if (session.getAttribute("msg1") != null) {%>
      <div class="alert alert-danger" role="alert"><%=session.getAttribute("msg1")%></div>
      <%session.removeAttribute("msg1");%>
      <% }%>
      <% if (session.getAttribute("msg2") != null) {%>
      <div class="alert alert-success" role="alert"><%=session.getAttribute("msg2")%></div>
      <%session.removeAttribute("msg2");%>
      <% }%>
      <%if (session.getAttribute("msgError") != null) {%>
      <p class="alert alert-danger"><%=session.getAttribute("msgError")%></p>
      <%session.removeAttribute("msgError");        }
      %>
      <div class="col-xl-4">

        <div class="card">
          <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

            <img src="<%=cuentas.getFoto()%>" alt="Profile" class="rounded-circle">

            <h2><%=cuentas.getNombre()%></h2>
            <h3>Usuario</h3>

          </div>

          <div class="pt-2 d-flex justify-content-center align-items-center">
            <a href="" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">Ver Distintos Avatares</a>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Que avatar deseas escoger</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body ">
                    <div class="form-floating">



                      <a onclick="return confirm('¿ Estas seguro de cambiar tu foto de perfil ?')" class="mi-enlace1" href="<%=request.getContextPath()%>/UsuariosCuentasServlet?a=actualizarFoto1"></a>
                      <a onclick="return confirm('¿ Estas seguro de cambiar tu foto de perfil ?')" class="mi-enlace2" href="<%=request.getContextPath()%>/UsuariosCuentasServlet?a=actualizarFoto2"></a>
                      <a onclick="return confirm('¿ Estas seguro de cambiar tu foto de perfil ?')" class="mi-enlace3" href="<%=request.getContextPath()%>/UsuariosCuentasServlet?a=actualizarFoto3"></a>
                      <a onclick="return confirm('¿ Estas seguro de cambiar tu foto de perfil ?')" class="mi-enlace4" href="<%=request.getContextPath()%>/UsuariosCuentasServlet?a=actualizarFoto4"></a>


                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Regresar</button>
                    <!-- <a href="" class="btn btn-dark">Modificar Precio</a>-->
                    <!--<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Modificar Precio</button> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
          <br>

        </div>
      </div>




      <!-- Contenido derecho -->
      <div class="col-xl-8">

        <div class="card">
          <div class="card-body pt-3">
            <!-- Botones de navegación del usuario -->
            <ul class="nav nav-tabs nav-tabs-bordered">

              <li class="nav-item">
                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Descripción general</button>
              </li>

              <li class="nav-item">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Configuración</button>
              </li>

              <li class="nav-item">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Contraseña</button>
              </li>
            </ul>


            <!-- Contenido de la derecha - SOBRE EL USUARIO -->
            <div class="tab-content pt-2">
              <div class="tab-pane fade show active profile-overview" id="profile-overview">
                <h5 class="card-title">Sobre mí</h5>
                <p class="small fst-italic"><%=cuentas.getDescripcion()%></p>

                <h5 class="card-title">Detalles del perfil</h5>

                <div class="row">
                  <div class="col-lg-3 col-md-4 label ">Full Name</div>
                  <div class="col-lg-9 col-md-8"><%=cuentas.getNombre()%>  <%=cuentas.getApellido()%></div>
                </div>


                <div class="row">
                  <div class="col-lg-3 col-md-4 label">Country</div>
                  <div class="col-lg-9 col-md-8">Perú</div>
                </div>

                <div class="row">
                  <div class="col-lg-3 col-md-4 label">Address</div>
                  <div class="col-lg-9 col-md-8"><%=cuentas.getDireccion()%></div>
                </div>

                <div class="row">
                  <div class="col-lg-3 col-md-4 label">Email</div>
                  <div class="col-lg-9 col-md-8"><%=cuentas.getCorreo()%></div>
                </div>
              </div>

              <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                <!-- Profile Edit Form -->
                <form  method="POST" action="<%=request.getContextPath()%>/UsuariosCuentasServlet?p=a">
                  <input type="hidden" class="form-control" name="idCuentas" id="idCuentas"
                         value="<%=cuentas.getIdCuentas()%>">
                  <div class="row mb-3">
                    <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="fullName" type="text" class="form-control" id="fullName" value="<%=cuentas.getNombre()%> <%=cuentas.getApellido()%>" disabled>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="descripcion" class="col-md-4 col-lg-3 col-form-label">Descripcion</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="descripcion" type="text" class="form-control" id="descripcion" value="<%=cuentas.getDescripcion()%>">
                    </div>
                  </div>


                  <div class="row mb-3">
                    <label for="Country" class="col-md-4 col-lg-3 col-form-label">Country</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="country" type="text" class="form-control" id="Country" value="Perú" disabled>
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="direccion" class="col-md-4 col-lg-3 col-form-label">Address</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="direccion" type="text" class="form-control" id="direccion" value="<%=cuentas.getDireccion()%>">
                    </div>
                  </div>

                  <div class="row mb-3">
                    <label for="correo" class="col-md-4 col-lg-3 col-form-label">Email</label>
                    <div class="col-md-8 col-lg-9">
                      <input name="correo" type="email" class="form-control" id="correo" value="<%=cuentas.getCorreo()%>">
                    </div>
                  </div>


                  <div class="text-center">
                    <a class="btn btn-danger" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=perfil">Cancelar</a>
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                  </div>
                </form>

              </div>

              <!-- Cambio de contrasenia -->
              <div class="tab-pane fade pt-3" id="profile-change-password">
              <form class="needs-validation" method="post" action="<%=request.getContextPath()%>/UsuariosCuentasServlet?p=actualizarPassword" novalidate>
                <div class="row mb-3">
                  <label for="password" class="col-md-4 col-lg-3 col-form-label">Contraseña actual</label>
                  <div class="col-md-8 col-lg-9">
                    <input required name="password" type="password" class="form-control" id="password">
                  </div>
                </div>

                <div class="row mb-3">
                  <label for="newpassword1" class="col-md-4 col-lg-3 col-form-label">Nueva contraseña</label>
                  <div class="col-md-8 col-lg-9">
                    <input required name="newpassword1" type="password" class="form-control" id="newpassword1">
                  </div>
                </div>

                <div class="row mb-3">
                  <label for="newpassword2" class="col-md-4 col-lg-3 col-form-label">Confirmar nueva contraseña</label>
                  <div class="col-md-8 col-lg-9">
                    <input required name="newpassword2" type="password" class="form-control" id="newpassword2">
                  </div>
                </div>



                <div class="text-center">
                  <button type="submit" class="btn btn-primary">Cambiar contraseña</button>
                </div>
              </form>

            </div>

          </div><!-- End Bordered Tabs -->

        </div>
      </div>

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
<script src="assets/js/main.js">


  function hacerAlgo() {

    alert("Presionaste la imagen");
  }

</script>




</body>

</html>