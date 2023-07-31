<!--NO olvidar los enlaces-->
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.Consolas" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.Generos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="consolas" type="java.util.ArrayList<com.example.proyecto_iweb.models.dtos.Consolas>" scope="request"/>
<jsp:useBean id="generos" type="java.util.ArrayList<com.example.proyecto_iweb.models.dtos.Generos>" scope="request"/>

<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>


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

<main id="main" class="main">



  <div class="container">


    <% if (session.getAttribute("errorNombre") != null) {%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorNombre")%></div>
    <%session.removeAttribute("errorNombre");%>
    <% }%>

    <% if (session.getAttribute("errorDescripcion") != null) {%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorDescripcion")%></div>
    <%session.removeAttribute("errorDescripcion");%>
    <% }%>

    <% if (session.getAttribute("errorPrecio") != null) {%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorPrecio")%></div>
    <%session.removeAttribute("errorPrecio");%>
    <% }%>

    <% if (session.getAttribute("errorStock") != null) {%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorStock")%></div>
    <%session.removeAttribute("errorStock");%>
    <% }%>

    <% if (session.getAttribute("errorLetras") != null) {%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorLetras")%></div>
    <%session.removeAttribute("errorLetras");%>
    <% }%>

    <% if (session.getAttribute("errorConsola") != null) {%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorConsola")%></div>
    <%session.removeAttribute("errorConsola");%>
    <% }%>

    <% if (session.getAttribute("errorGenero") != null) {%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorGenero")%></div>
    <%session.removeAttribute("errorGenero");%>
    <% }%>

    <% if (session.getAttribute("errorFoto") != null) {%>
    <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorFoto")%></div>
    <%session.removeAttribute("errorFoto");%>
    <% }%>



    <div class="pagetitle">
      <h1>Crear juego</h1>
    </div>

    <form method="POST" action="<%=request.getContextPath()%>/AdminJuegosServlet?p=crear" enctype="multipart/form-data">
      <input type="hidden" class="form-control" name="idAdmin" id="idAdmin" value="<%=usuarioLog.getIdCuentas()%>">

      <div class="mb-3">
        <label for="nombre">Nombre</label>
        <input type="text" class="form-control" name="nombre" placeholder="Ingrese el nombre del juego" id="nombre">
      </div>

      <div class="mb-3">
        <label for="descripcion">Descripción</label>
        <input type="text" class="form-control" name="descripcion" id="descripcion" placeholder="Describa brevemente el juego">

      </div>

      <div class="mb-3">
        <label for="precio">Precio</label>
        <input type="text" class="form-control" name="precio" id="precio" placeholder="Indique el precio">

      </div>



      <div class="input-group mb-3">
        <label for="consola">Consola</label>
        <div class="col-12">
          <select name="consola" id="consola" class="form-control">
            <% for (Consolas c : consolas) { %>
            <option value="<%=c.getNombre()%>"><%=c.getNombre()%></option>
            <% } %>
          </select>
        </div>
      </div>

      <div class="input-group mb-3">
        <label for="genero">Género</label>
        <div class="col-12">
          <select name="genero" id="genero" class="form-control">
            <% for (Generos g : generos) { %>
            <option value="<%=g.getNombre()%>"><%=g.getNombre()%></option>
            <% } %>
          </select>
        </div>
      </div>

      <!--
      <div class="mb-3">
        <label for="archivo">Subir fotos de la incidencia: </label>
        <input type="file" class="form-control" id="customFile" name="foto" accept="image/*"/>
        <input type="file" id="archivo" accept="image/jpeg">
        <input type="hidden" id="formulario" name="foto">
      </div>
      -->

      <div class="mb-3">
        <label for="customFile" class="form-label">Subir imagen</label>
        <input class="form-control" type="file" id="customFile" name="foto" accept="image/*"/>
      </div>

      <a class="btn btn-danger" href="<%=request.getContextPath()%>/AdminJuegosServlet">Cancelar</a>
      <button type="submit" class="btn btn-primary">Crear</button>
    </form>
  </div>

</main>

<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
  <jsp:param name="title" value=""/>
</jsp:include>



<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</body>
</html>
