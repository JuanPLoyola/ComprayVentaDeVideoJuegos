
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.Consolas" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.Generos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="juego" scope="request" type="com.example.proyecto_iweb.models.beans.Juegos"/>
<jsp:useBean id="consolas" type="java.util.ArrayList<com.example.proyecto_iweb.models.dtos.Consolas>" scope="request"/>
<jsp:useBean id="generos" type="java.util.ArrayList<com.example.proyecto_iweb.models.dtos.Generos>" scope="request"/>

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
<main id="main" class="main">



    <div class="container">

        <% if (session.getAttribute("errorNombre") != null) {%>
        <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorNombre")%></div>
        <%session.removeAttribute("errorNombre");%>
        <% }%>

        <% if (request.getParameter("error") != null && request.getParameter("error").equals("Nombre")) { %>
            <div class="alert alert-danger">Nombre: Ingrese un nombre válido (letras y/o números)</div>
        <% } %>

        <% if (request.getParameter("error") != null && request.getParameter("error").equals("Descripcion")) { %>
        <div class="alert alert-danger">Nombre: Ingrese un nombre válido (letras y/o números)</div>
        <% } %>

        <% if (session.getAttribute("errorDescripcion") != null) {%>
        <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorDescripcion")%></div>
        <%session.removeAttribute("errorDescripcion");%>
        <% }%>

        <% if (session.getAttribute("errorPrecio") != null) {%>
        <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorPrecio")%></div>
        <%session.removeAttribute("errorPrecio");%>
        <% }%>

        <% if (session.getAttribute("errorConsola") != null) {%>
        <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorConsola")%></div>
        <%session.removeAttribute("errorConsola");%>
        <% }%>

        <% if (session.getAttribute("errorGenero") != null) {%>
        <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorGenero")%></div>
        <%session.removeAttribute("errorGenero");%>
        <% }%>

        <% if (session.getAttribute("errorStock") != null) {%>
        <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorStock")%></div>
        <%session.removeAttribute("errorStock");%>
        <% }%>

        <% if (session.getAttribute("errorLetras") != null) {%>
        <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorLetras")%></div>
        <%session.removeAttribute("errorLetras");%>
        <% }%>

        <div class="row">
            <div class="col-lg-6">
                <form method="POST" action="<%=request.getContextPath()%>/AdminJuegosServlet?p=actualizar" enctype="multipart/form-data">

                <div class="pagetitle">
                <h1>Editar juego</h1>
                </div>
                <input type="hidden" class="form-control" name="idJuego" id="idJuego"
                       value="<%=juego.getIdJuegos()%>">

                <div class="mb-3">
                    <label for="nombre">Nombre</label>
                    <input required type="text" class="form-control" name="nombre" id="nombre" value="<%=juego.getNombre()%>">
                </div>

                <div class="mb-3">
                    <label for="descripcion">Descripción</label>
                    <input required type="text" class="form-control" name="descripcion" id="descripcion" value="<%=juego.getDescripcion()%>">
                </div>

                <div class="mb-3">
                    <label for="precio">Precio</label>
                    <input required type="number" class="form-control" name="precio" id="precio" value="<%=juego.getPrecio()%>">
                </div>


                <div class="input-group mb-3">
                    <label for="consola">Consola</label>
                    <div class="col-12">
                        <select name="consola" id="consola" class="form-control">
                            <% for (Consolas c : consolas) { %>
                            <option value="<%=c.getNombre()%>" <%=juego.getConsola().equals(c.getNombre()) ? "selected" : "" %>><%=c.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                </div>

                <div class="input-group mb-3">
                    <label for="genero">Genero</label>
                    <div class="col-12">
                        <select name="genero" id="genero" class="form-control">
                            <% for (Generos g : generos) { %>
                            <option value="<%=g.getNombre()%>" <%=juego.getGenero().equals(g.getNombre()) ? "selected" : "" %>><%=g.getNombre()%></option>
                            <% } %>
                        </select>
                    </div>
                </div>


                <div class="mb-3">
                    <label for="stock">Stock</label>
                    <input required type="number" class="form-control" name="stock" id="stock" value="<%=juego.getStock()%>">
                </div>

                <a class="btn btn-danger" href="<%=request.getContextPath()%>/AdminJuegosServlet">Cancelar</a>
                <button type="submit" class="btn btn-primary">Actualizar</button>
                </form>
            </div>


            <div class="col-lg-6">
                <form method="POST" action="<%=request.getContextPath()%>/AdminJuegosServlet?p=actualizarFotoJuego" enctype="multipart/form-data">

                <div class="pagetitle">
                    <h1>Editar foto</h1>
                </div>
                <input type="hidden" class="form-control" name="idJuego" id="idJuego"
                           value="<%=juego.getIdJuegos()%>">
                <br>
                <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=juego.getIdJuegos()%>" class="img-fluid rounded-start" alt="...">
                <br>
                <div class="mb-3">
                    <label for="customFile" class="form-label">Seleccionar nueva foto</label>
                    <input class="form-control" type="file" id="customFile" name="foto" accept="image/*"/>
                </div>

                <button type="submit" class="btn btn-primary">Actualizar foto</button>
                </form>

            </div>
        </div>

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
