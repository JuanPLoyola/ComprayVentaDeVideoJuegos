<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!-- ======= Head ======= -->
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>JA-VAGOS</title>
    <style>


        .mi-div{
            background-image: url('img/sistema/recordarContrasenia.png');
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
    <div class="box2">
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
                                        <h5 class="card-title text-center pb-0 fs-4">¿Olvidaste tu contraseña?</h5>
                                        <% if (request.getAttribute("contraseñaError2") != null) {%>
                                        <div class="alert alert-danger" >No coinciden el nickname ni el correo </div>
                                        <% }%>
                                        <p class="text-center small">Ingrese su nombre de usuario y correo electrónico para enviar nueva contraseña</p>
                                    </div>

                                    <form method="POST" action="<%=request.getContextPath()%>/InitialServlet?p=enviar">

                                        <div class="col-12">
                                            <label for="nickname" class="form-label">Nickname</label>
                                            <div class="input-group has-validation">
                                                <input type="text" name="nickname" class="form-control" id="nickname" required>
                                                <div class="invalid-feedback">Por favor ingrese su usuario!</div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="correo" class="form-label">Correo</label>
                                            <div class="input-group has-validation">
                                                <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                <input type="email" name="correo" class="form-control" id="correo" required>
                                                <div class="invalid-feedback">¡Por favor, introduce una dirección de correo electrónico válida!</div>
                                            </div>
                                            </div>
                                        <br>
                                        <div class="col-12">

                                        </div>
                                        <div class="col-12">
                                            <button class="btn btn-primary w-100" type="submit">Enviar Correo</button>
                                        </div>

                                        <div class="col-12">
                                            <p class="small mb-0">¿Recordaste o verificaste tu contraseña?<a href="<%=request.getContextPath()%>/login"> Iniciar sesión</a></p>
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <div class="credits">
                                Designed by <a href="#">Ja-Vagos</a>
                            </div>

                        </div>
                    </div>
                </div>

            </section>
        </div>
    </div>
</main><!-- End #main -->

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
