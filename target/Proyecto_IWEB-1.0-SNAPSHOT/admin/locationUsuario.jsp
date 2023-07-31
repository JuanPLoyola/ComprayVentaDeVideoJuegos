<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:useBean id="usuario" scope="request" type="com.example.proyecto_iweb.models.beans.CompraUsuario"/>


<!DOCTYPE html>
<html lang="en">
<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<body>
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="reservasYcomprados"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">

    <div class="container">
        <div class="pagetitle">
            <h1>Ubicación del usuario: <%=usuario.getUsuario().getNombre()%> <%=usuario.getUsuario().getApellido()%></h1>
        </div>

        <div class="row">


            <div class="mb-3">
                <label for="direccion">Dirección</label>
                <input type="text" class="form-control" name="direccion" id="direccion" value="<%=usuario.getDireccion()%>" disabled>
            </div>



            <div class="mb-3">
                <label for="ubicacion">Ubicación</label>
                <div id="map" style="height:400px;width:100%;"></div>
            </div>


        </div>

        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=reservas" class="btn btn-danger">Regresar</a>

    </div>


</main>


<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7OI9p3JeWeSVqhVpIo-duXemjBLL33cM&libraries=places&callback=initMap" async defer></script>


<script>
    let map;
    let marker;

    <% if((usuario.getUsuario().getLatitud() == null) || (usuario.getUsuario().getLongitud() == null) ) { %>
        let latitud = -12.046374;
        let longitud = -77.042793;
    <% } else {%>
        let latitud = <%= Double.parseDouble(usuario.getUsuario().getLatitud()) %>;
        let longitud = <%= Double.parseDouble(usuario.getUsuario().getLongitud()) %>;
    <% } %>



    function initMap() {

        // Se crea un mapa
        map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: latitud, lng: longitud }, // Coordenadas de Lima, Perú
            zoom: 12, // Nivel de zoom inicial
        });

        // Se crea un marcador centrado en coordenadas de Lima
        marker = new google.maps.Marker({
            map: map,
            position: { lat: latitud, lng: longitud }, // Coordenadas de Lima, Perú
        });


    }


</script>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</html>
