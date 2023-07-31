<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="compra" scope="request" type="com.example.proyecto_iweb.models.beans.CompraUsuario"/>

<!DOCTYPE html>
<html lang="en">

<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
  <jsp:param name="title" value="Nueva lista"/>
</jsp:include>


<body>
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
  <jsp:param name="currentPage" value="verJuego"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main ">

  <div class="container d-flex justify-content-center align-items-center">

    <form class="col-lg-10">
      <div class="pagetitle">
        <h1>Información de la venta: </h1>
      </div>
      <br>
      <div class="row">
        <div class="col-lg-6">
          <div class="mb-3">
            <label>ID compra</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getIdCompra()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Usuario</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getUsuario().getNombre()%> <%=compra.getUsuario().getApellido()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Juego</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getJuegos().getNombre()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Cantidad</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getCantidad()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Fecha</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getFechaCompra()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Dirección</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getDireccion()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Admin Encargado</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getAdmin().getNombre()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Precio</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getPrecioCompra()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Estado</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getEstados().getEstados()%></p>
            </div>
          </div>

        </div>
        <div class="col-lg-6">
          <img src="<%=compra.getUsuario().getFoto()%>" alt="" class="img-fluid max-width-100">
        </div>
      </div>

      <a class="btn btn-danger" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=reservas">Regresar</a>
    </form>

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
<script src="assets/js/lista.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</body>
</html>
