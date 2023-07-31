<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
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
  <jsp:param name="currentPage" value="indexAdmin"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main ">

  <div class="container d-flex justify-content-center align-items-center">

    <form class="col-lg-10">
      <div class="pagetitle">
        <h1>Información del compra: </h1>
      </div>
      <br>
      <div class="row">
        <div class="col-lg-6">
          <div class="mb-3">
            <label>Nombre del usuario</label>
            <input type="text" class="form-control" name="nombreUser" id="nombreUser" value="<%=compra.getUsuario().getNombre()%> <%=compra.getUsuario().getApellido()%>" disabled>

          </div>

          <div class="mb-3">
            <label>Dirección del usuario</label>
            <input type="text" class="form-control" name="nombreUser" id="direccion" value="<%=compra.getDireccion()%>" disabled>

          </div>


          <div class="mb-3">
            <label>Fecha compra</label>
            <input type="text" class="form-control" name="fechaCompra" id="fechaCompra" value="<%=compra.getFechaCompra()%>" disabled>
          </div>

          <div class="mb-3">
            <label>Fecha entrega</label>
            <% if(compra.getFechaEntrega() != null){ %>
              <input type="text" class="form-control" name="fechaEntrega" id="fechaEntrega" value="<%=compra.getFechaEntrega()%>" disabled>
            <% } else {%>
            <input type="text" class="form-control" name="fechaEntrega" id="fechaEntrega" value="Sin entregar" disabled>
            <% } %>
          </div>

          <div class="mb-3">
            <label>Precio</label>
            <input type="text" class="form-control" name="precio" id="precio" value="<%=compra.getPrecioCompra()%>" disabled>
          </div>

          <div class="mb-3">
            <label>Cantidad</label>

            <% if(compra.getCantidad() == 0){ %>
              <input type="text" class="form-control" name="stock" id="stock" value="Sin stock" disabled>
            <% } else {%>
              <input type="text" class="form-control" name="stock" id="stock" value="<%=compra.getCantidad()%>" disabled>
            <% } %>
          </div>



        </div>
        <div class="col-lg-6">
          <div class="mb-3">
            <label>Juego comprado</label>
            <input type="text" class="form-control" name="nameGame" id="nameGame" value="<%=compra.getJuegos().getNombre()%>" disabled>
          </div>

          <div class="mb-3">
            <label for="descripcion">Descripción del juego</label>
            <textarea class="form-control" id="descripcion" name="descripcion" disabled style="resize: none; height: auto;"><%=compra.getJuegos().getDescripcion()%></textarea>
          </div>

          <div class="mb-3">
            <label>Stock</label>

            <% if(compra.getJuegos().getStock() == 0){ %>
            <input type="text" class="form-control" name="stock" id="stock" value="Sin stock" disabled>
            <% } else {%>
            <input type="text" class="form-control" name="stock" id="stock" value="<%=compra.getJuegos().getStock()%>" disabled>
            <% } %>
          </div>

          <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=compra.getJuegos().getIdJuegos()%>" alt="" class="img-fluid max-width-100">
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
