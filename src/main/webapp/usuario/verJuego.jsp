<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="juegos" scope="request" type="com.example.proyecto_iweb.models.dtos.Raiting"/>
<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>
<% ArrayList<Cuentas> listaPerfil = (ArrayList<Cuentas>) request.getAttribute("perfil");
%>




<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>JA-VAGOS</title>
    <meta content="" na me="description">
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
            width: 750px;
            height: 100%;
            object-fit: cover;
        }
        .rating {
            display: inline-block;
        }

        .stars {
            font-size: 0;
        }

        .star {
            display: inline-block;
            font-size: 30px;
            color: gray;
            cursor: pointer;
        }

        input[type="radio"] {
            display: none;
        }

        .star::before {
            content: '\2605';
        }

        .star.filled::before {
            color: gold;
        }

        .boton-tachado {
            position: relative;
            overflow: hidden;
            border: none;
            background-color: transparent;
            color: red !important;
            text-decoration: line-through;
        }

        .boton-tachado:hover {
            color: red !important;
        }
    </style>

</head>

<body>

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="listar"/>
</jsp:include>

<main id="main" class="main">


    <div class="container">
        <div class="row justify-content-center">
            <div class="w-auto">
                <div class="container">
                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=juegos.getIdJuegos()%>" class="img-fluid juego-imagen justify-content-center" alt="Imagen">
                </div>
            </div>
            <div class="w-auto">
                <div class="row">
                    <h2 class="text-primary"><%= juegos.getNombre() %></h2>
                    <div class="mb-4" id="descripcion_juego">
                        <p class="lead"><%= juegos.getDescripcion() %></p>
                        <%if(juegos.getDescuento()==0){%>
                        <p class="fs-5 fw-medium fw-bold">Precio: <%= juegos.getPrecio() %></p>
                        <%}else{%>
                        <h3 class="card-title-danger">En oferta: <%=juegos.getPrecio()-(juegos.getPrecio()*(juegos.getDescuento()/100))%></h3>
                        <h5 class="btn btn-custom boton-tachado">Antes: <%=juegos.getPrecio()%></h5>
                        <%}%>
                        <p class="fs-5 fw-medium fw-bold">Stock: <%= juegos.getStock() %></p>
                        <%if(juegos.getRaiting()==0){%>
                        <h5 class="fs-5 fw-medium fw-bold">AÚN NO TIENE VENTAS</h5>
                        <h5 class="fs-5 fw-medium fw-bold">¡¡¡Se el primero en comprarlo!!!</h5>
                        <%}else{%>
                        <p class="fs-5 fw-medium fw-bold">Raiting:
                        <div class="rating align-items-center justify-content">
                            <div class="stars">
                                <input type="radio" id="star5" name="rating" value="5" />
                                <label for="star5" class="star"></label>
                                <input type="radio" id="star4" name="rating" value="4" />
                                <label for="star4" class="star"></label>
                                <input type="radio" id="star3" name="rating" value="3" />
                                <label for="star3" class="star"></label>
                                <input type="radio" id="star2" name="rating" value="2" />
                                <label for="star2" class="star"></label>
                                <input type="radio" id="star1" name="rating" value="1" />
                                <label for="star1" class="star"></label>
                            </div>
                        </div>
                        </p>
                        <%}%>


                    </div>
                    <% if (usuarioLog.getIdCuentas() == 0) { %>
                    <div class="row mt">

                        <a class="btn btn-primary btn-lg btn-block" href="<%=request.getContextPath()%>/login">Comprar</a>

                    </div>
                    <% } else { %>
                    <div class="row mt-3">
                        <a class="btn btn-primary btn-lg btn-block" href="<%=request.getContextPath()%>/UsuariosCuentasServlet?a=carrito&id=<%=juegos.getIdJuegos()%>">Comprar</a>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row mt-3">
            <div class="col">
                <div class="d-flex justify-content-end">
                    <a class="btn btn-danger" href="<%=request.getContextPath()%>/InitialServlet">Regresar</a>
                </div>
            </div>
        </div>
    </div>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


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
<script>
    function fillStars(rating) {
        const stars = document.querySelectorAll('.stars .star');

        stars.forEach((star, index) => {
            if (index < rating) {
                star.classList.add('filled');
            } else {
                star.classList.remove('filled');
            }
        });
    }

    // Obtén el valor del rating de la base de datos y llama a la función fillStars con ese valor
    const ratingFromDatabase = <%=juegos.getRaiting() %>; // Reemplaza este valor con el valor obtenido de la base de datos
    fillStars(ratingFromDatabase);
</script>
</body>

</html>