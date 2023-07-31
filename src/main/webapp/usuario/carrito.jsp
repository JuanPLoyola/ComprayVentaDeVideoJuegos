<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="juegos" scope="request" type="com.example.proyecto_iweb.models.beans.Juegos"/>

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

    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }


        /* Estilos adicionales para el botón y el mapa */
        .form-group {
            display: flex;
            flex-direction: column;
            align-items: center;
        }


        #map{
            margin: 20px;
        }


    </style>
</head>

<body>

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="listar"/>
</jsp:include>

<main id="main" class="main">
    <% if (session.getAttribute("error") != null) {%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("error")%></div>
    <%session.removeAttribute("error");%>
    <% }%>
    <div class="pagetitle">
        <h1>Compra de videojuego</h1>
    </div>


    <div class="row">
        <div class="col-7">
            <div class="container__detail-text bg-light">
                <div class="container__detail bg-light">
                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=juegos.getIdJuegos()%>" class="img-thumbnail w-50" alt="...">
                    <div class="col">
                        <p class="fs-2 text-capitalize"><%=juegos.getNombre()%></p>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-5">
            <!-- CREDIT CARD FORM STARTS HERE -->
            <div class="panel panel-default credit-card-box customwidth center-block">
                <div class="panel-heading display-table" >
                    <div class="row display-tr" >
                        <h3 class="panel-title display-td" >Tarjeta de Pago</h3>
                        <div class="display-td" id="cardLogoTop">
                            <img class="img-responsive pull-right" src="https://i.imgur.com/gIMFDbp.png">
                            <!-- <img class="img-responsive pull-right" src="https://i.imgur.com/WluzPvZ.png">
                            <img class="img-responsive pull-right" src="https://i.imgur.com/H5lJRwk.png">
                            <img class="img-responsive pull-right" src="https://i.imgur.com/1U8OBnM.png">
                            <img class="img-responsive pull-right" src="https://i.imgur.com/iqIDYfz.png">
                            -->
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <form role="form" id="payment-form" method="post" action="" onSubmit="return false;">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="cardNumber">NUMERO DE TARJETA</label>
                                    <div class="input-group">
                                        <input
                                                type="tel"
                                                class="form-control"
                                                name="cardNumber"
                                                id="cardNumber"
                                                placeholder="XXXX-XXXX-XXXX-XXXX"
                                                autocomplete="cc-number"
                                                pattern="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35\d{3})\d{11})$"
                                                required autofocus
                                                onchange="validar(this.value)"
                                                onblur="
                                  // save input string and strip out non-numbers
                                  cc_number_saved = this.value;
                                  this.value = this.value.replace(/[^\d]/g, '');
                                  if(!validar(this.value)) {
                                    alert('Disculpe, este número de atrjeta no es válido');
                                    this.value = '';
                                  }
                                " onfocus="
                                  // restore saved string
                                  if(this.value != cc_number_saved) this.value = cc_number_saved;
                                "
                                        />
                                        <span class="input-group-addon"><i class="fa fa-credit-card" id="cardlogo" style="color:purple;font-size:2rem;"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label for="cardExpiry"><span class="hidden-xs">FECHA</span><span class="visible-xs-inline"></span> DE EXPIRACION</label>
                                    <input
                                            type="tel"
                                            class="form-control"
                                            name="cardExpiry"
                                            placeholder="MM / YY"
                                            autocomplete="cc-exp"
                                            required
                                    />
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label for="cardCVC">CV</label>
                                    <input
                                            type="tel"
                                            class="form-control"
                                            name="cardCVC"
                                            placeholder="CVC"
                                            autocomplete="cc-csc"
                                            required
                                            pattern="^[0-9]{4}"
                                            title="Debe escribir un código válido"
                                    />
                                </div>
                            </div>
                        </div>

                        <div class="row" style="display:none;">
                            <div class="col-xs-12">
                                <p class="payment-errors"></p>
                            </div>
                        </div>
                    </form>


                </div>
            </div>
            <!-- CREDIT CARD FORM ENDS HERE -->
        </div>
    </div>

    <form id= "paymentForm" method="POST" action="<%=request.getContextPath()%>/UsuariosJuegosServlet?p=comprar">
        <input type="hidden" class="form-control" name="nombre" id="nombre"
               value="<%=juegos.getNombre()%>">
        <input type="hidden" class="form-control" name="precio" id="precio"
               value="<%=juegos.getPrecio()%>">
        <input type="hidden" class="form-control" name="idJuego" id="idJuego"
               value="<%=juegos.getIdJuegos()%>">
        <input type="hidden" class="form-control" name="stock" id="stock"
               value="<%=juegos.getStock()-1%>">
        <div class="mt-3">
            <div class="row">
                <div class="caption header-text">
                    <hr/>
                    <h4>Dirección</h4>
                    <hr/>
                </div>
            </div>


            <input type="text" id="direccion" class="form-control" placeholder="Ingrese su dirección específica" >
            <input type="hidden" id="latitud" name="latitud">
            <input type="hidden" id="longitud" name="longitud">

            <div class="input-group mb-3" >
                <div id="map" style="height:400px;width:100%;"></div>

            </div>
        </div>

        <div class="container__detail bg-light p-3 d-flex flex-column">

            <%if(juegos.getDescuento()==0){%>
            <p class="fs-3 fw-semibold text-center">Precio total:</p><p class="fs-4 fw-bold text-center">S/. <%=juegos.getPrecio()%></p>
            <%}else{%>
            <p class="fs-3 fw-semibold text-center">Precio total:</p><p class="fs-4 fw-bold text-center">S/. <%=juegos.getPrecio()-(juegos.getPrecio()*(juegos.getDescuento()/100))%></p>
            <%}%>
            <button type="submit" class="btn btn-success mt-3" id="btnPagar">Pagar</button>
            <a class="btn btn-primary btn-lg btn-block" href="<%= request.getContextPath() %>/UsuariosJuegosServlet">Cancelar</a>
        </div>
    </form>



</main><!-- End #main -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<!-- CODIGO EXTRAÍDO DE https://www.youtube.com/watch?v=XX9Kmg3qLRk -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7OI9p3JeWeSVqhVpIo-duXemjBLL33cM&libraries=places&callback=initMap" async defer></script>
<script>
    let map;
    let marker;


    function initMap() {

        // Se crea un mapa
        map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: -12.046374, lng: -77.042793 }, // Coordenadas de Lima, Perú
            zoom: 12, // Nivel de zoom inicial
        });

        // Se crea un marcador centrado en coordenadas de Lima
        marker = new google.maps.Marker({
            map: map,
            draggable: true, // Permite arrastrar el marcador
            position: { lat: -12.046374, lng: -77.042793 }, // Coordenadas de Lima, Perú
        });

        // Escucha el evento 'dragend' para actualizar las coordenadas del marcador cuando se arrastra
        marker.addListener("dragend", function () {
            updateMarkerPosition(marker.getPosition());
        });

        // Inicia la búsqueda de lugares en el input de dirección
        initPlaces();
    }

    function initPlaces() {
        // Obtiene el valor del id dirección
        const input = document.getElementById("direccion");



        // Creamos restricciones para que las búsquedas solo se limiten a Perú
        const searchOptions = {
            componentRestrictions: { country: "pe" }
        };

        // Creamos un objeto de búsqueda de lugares y se vincula al campo de dirección
        const searchBox = new google.maps.places.SearchBox(input, searchOptions);



        // Escucha el evento 'places_changed' cuando se selecciona un lugar de la lista de resultados
        searchBox.addListener("places_changed", function () {
            const places = searchBox.getPlaces();

            if (places.length === 0) {
                return;
            }

            const place = places[0];

            // Centra el mapa en la ubicación seleccionada
            map.setCenter(place.geometry.location);
            map.setZoom(15);

            // Actualiza la posición del marcador en la ubicación seleccionada
            marker.setPosition(place.geometry.location);
            updateMarkerPosition(place.geometry.location);
        });

        const form = document.getElementById("searchForm");
        form.addEventListener('submit', function (event) {
            event.preventDefault();
        });
    }

    function updateMarkerPosition(position) {
        // Obtiene las coordenadas latitud y longitud del marcador
        const lat = position.lat();
        const lng = position.lng();

        // Actualiza los valores de latitud y longitud en los campos de texto ocultos
        document.getElementById("latitud").value = lat;
        document.getElementById("longitud").value = lng;
    }

    document.getElementById("paymentForm").addEventListener("submit", function (event) {
        // Captura el botón que desencadenó el envío del formulario
        const btnPagar = document.getElementById("btnPagar");

        // Verifica si el botón que desencadenó el envío es el botón "Pagar"
        if (event.submitter !== btnPagar) {
            // Previene la acción predeterminada solo si el botón no es "Pagar"
            event.preventDefault();
        }
    });
</script>
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

