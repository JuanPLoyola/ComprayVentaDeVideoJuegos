<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>JA-VAGOS</title>
    <style>
        .mi-div{
            background-image: url('img/sistema/inicioSesion.png');
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;

        }

    </style>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="icon" href="img/sistema/pestania.png">
    <link rel="stylesheet" href="estilos/sistema.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

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

<main>
    <div class="box">
        <div class="mi-div">
            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <a href="<%=request.getContextPath()%>/" class="logo d-flex align-items-center w-auto">
                                    <span class="d-none d-lg-block text-light">Ja-Vagos</span>
                                </a>
                            </div>

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Ingrese a su cuenta</h5>
                                        <p class="text-center small">Ingrese su nombre de usuario y contraseña para iniciar sesión</p>
                                    </div>

                                    <% if (request.getAttribute("msg") != null) { %>
                                    <div class="alert alert-success">Se ha creado el Usuario exitosamente</div>
                                    <% } %>
                                    <% if (request.getAttribute("contraseña") != null) {%>
                                    <div class="alert alert-success" >Se envió la nueva contraseña</div>
                                    <% }%>
                                    <% if (request.getAttribute("contraseñaError") != null) {%>
                                    <div class="alert alert-success" >No existe </div>
                                    <% }%>
                                    <form method="POST" action="<%=request.getContextPath()%>/login">


                                        <div class="col-12 mb-3">
                                            <label for="yourUser" class="form-label">Correo</label>
                                            <input type="text" name="inputEmail" class="form-control" id="yourUser" required placeholder="Correo">

                                        </div>

                                        <div class="col-12 mb-3">
                                            <label for="yourPassword" class="form-label">Contraseña</label>
                                            <input type="password" name="inputPassword" class="form-control" id="yourPassword" required placeholder="Contraseña">
                                            <% if (request.getAttribute("error") != null) { %>
                                            <div class="text-danger mb-2 text-center">!Error en su usuario o contraseña!</div>
                                            <% } %>

                                        </div>

                                        <div class="col-12">
                                            <button class="btn btn-primary w-100" type="submit">Ingresar</button>
                                        </div>

                                        <div class="col-12">
                                            <a href="<%=request.getContextPath()%>/InitialServlet?action=olvidaste"> ¿Olvidaste tu contraseña?</a>
                                        </div>

                                        <div class="col-12">
                                            <p class="small mb-0">¿No tienes cuenta?<a href="<%=request.getContextPath()%>/InitialServlet?action=agregar"> Crea una cuenta</a></p>
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <div class="credits">
                                Designed by <a href="<%=request.getContextPath()%>/">Ja-Vagos</a>
                            </div>

                        </div>
                    </div>
                </div>

            </section>
        </div>
    </div>
</main>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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

</body>

</html>