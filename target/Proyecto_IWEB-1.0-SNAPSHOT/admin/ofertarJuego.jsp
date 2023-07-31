
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.Consolas" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.Generos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="juego" type="com.example.proyecto_iweb.models.beans.Juegos" scope="request"/>

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

        <div class="pagetitle">
            <h1>Ofertar juego</h1>
        </div>

        <% if (session.getAttribute("errorDescuento") != null) {%>
        <div class="alert alert-danger" role="alert"><%=session.getAttribute("errorDescuento")%></div>
        <%session.removeAttribute("errorDescuento");%>
        <% }%>

        <form method="POST" action="<%=request.getContextPath()%>/AdminJuegosServlet?p=ofertar">
            <input type="hidden" class="form-control" name="idJuego" id="idJuego"
                   value="<%=juego.getIdJuegos()%>">
            <div class="row">
                <div class="col-lg-6">
                    <div class="mb-3">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" name="nombre" id="nombre" value="<%=juego.getNombre()%>" disabled>
                    </div>

                    <div class="mb-3">
                        <label for="descripcion">Descripción</label>
                        <textarea class="form-control" id="descripcion" name="descripcion" disabled style="resize: none; height: auto;"><%=juego.getDescripcion()%></textarea>
                        <!--<input type="text" class="form-control" name="descripcion" id="descripcion" value="<%=juego.getDescripcion()%>" disabled>-->
                    </div>

                    <div class="mb-3">
                        <label for="precio">Precio</label>
                        <input type="text" class="form-control" name="precio" id="precio" value="<%=juego.getPrecio()%>" disabled>
                    </div>

                    <div class="mb-3">
                        <label for="descuento">Descuento (En porcentaje)</label>
                        <input type="number" class="form-control" name="descuento" id="descuento" value="<%=juego.getDescuento()%>">

                    </div>

                    <div class="mb-3">
                        <label for="consola">Consola</label>
                        <input type="text" class="form-control" name="precio" id="consola" value="<%=juego.getConsola()%>" disabled>

                    </div>

                    <div class="mb-3">
                        <label for="genero">Genero</label>
                        <input type="text" class="form-control disabled" name="genero" id="genero" value="<%=juego.getGenero()%>" disabled>

                    </div>

                    <div class="mb-3">
                        <label for="stock">Stock</label>
                        <input type="text" class="form-control" name="stock" id="stock" value="<%=juego.getStock()%>" disabled>
                    </div>
                </div>
                <div class="col-lg-6">
                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=juego.getIdJuegos()%>" alt="" class="img-fluid max-width-100">
                </div>
            </div>


            <a class="btn btn-danger" href="<%=request.getContextPath()%>/AdminJuegosServlet">Cancelar</a>
            <button type="submit" class="btn btn-primary">Ofertar</button>
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
