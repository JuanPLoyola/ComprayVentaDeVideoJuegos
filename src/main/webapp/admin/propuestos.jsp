<%--
  Created by IntelliJ IDEA.
  User: oscar
  Date: 21/06/2023
  Time: 08:42
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>

<% ArrayList<VentaUsuario> lista = (ArrayList<VentaUsuario>) request.getAttribute("lista"); %>

<!DOCTYPE html>
<html lang="en">
<!-- ======= Head ======= -->
<jsp:include page="../includes/head.jsp">
  <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<body>
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
  <jsp:param name="currentPage" value="propuestos"/>
</jsp:include>
<!-- ======= Main ======= -->
<main id="main" class="main">

  <div class="pagetitle">
    <h1>Juegos Propuestos</h1>
  </div>

  <div class="container">
    <table id="example" class="table table-striped" style="width:100%">
      <thead>
      <tr>
        <th>Proveedor</th>
        <th>Nombre juego</th>
        <th>Precio</th>
        <th>Estado</th>
        <th>Observación</th>
        <th>Opciones</th>
      </tr>
      </thead>
      <tbody>
      <% for (VentaUsuario v : lista) { %>
      <tr>
        <td><%=v.getUsuario().getNombre()%></td>
        <td><%=v.getJuegos().getNombre()%></td>
        <td><%=v.getPrecioVenta()%></td>
        <td><%=v.getEstados().getEstados()%></td>
        <td><%=v.getMensajeAdmin()%></td>
        <td>
          <div class="d-flex justify-content-center">
            <a onclick="return confirm('¿Está seguro de aceptar al usuario:?')"
               href="<%=request.getContextPath()%>/AdminJuegosServlet?a=aceptarUsuario&id=<%=v.getIdVenta()%>" class="btn btn-success m-1"><i class="bi bi-check-circle-fill"></i></a>

            <a onclick="return confirm('¿Está seguro de rechazar al usuario:?')" class="btn btn-danger m-1"
               href="<%=request.getContextPath()%>/AdminJuegosServlet?a=rechazarUsuario&id=<%=v.getIdVenta()%>"><i class="bi bi-x-circle-fill"></i></a>

          </div>
        </td>
      </tr>
      <% } %>

      </tbody>

    </table>
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

