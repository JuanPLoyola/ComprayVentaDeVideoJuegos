
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<% ArrayList<Juegos> ofertas = (ArrayList<Juegos>) request.getAttribute("ofertas"); %>

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
            <h1>Juegos Ofertados</h1>
        </div>

        <table id="example" class="table table-bordered border-danger" style="width:100%">
            <thead>
            <tr>
                <th>Name de juego</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Descuento</th>
                <th class="text-center">Opciones</th>
            </tr>
            </thead>
            <tbody>
            <% for (Juegos o : ofertas) { %>
            <tr>
                <td><%=o.getNombre()%> </td>
                <td>S/. <%=o.getPrecio()%></td>
                <td><%=o.getStock()%></td>
                <td><%=o.getDescuento()%> %</td>
                <td>
                    <div class="d-flex justify-content-center">
                        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=verJuego&id=<%=o.getIdJuegos()%>" class="btn btn-primary m-1"><i class="bi bi-eye-fill"></i></a>
                        <a onclick="return confirm('¿Esta seguro de eliminar esta oferta?')" class="btn btn-danger m-1"
                           href="<%=request.getContextPath()%>/AdminJuegosServlet?a=eliminarOferta&id=<%=o.getIdJuegos()%>"><i class="bi bi-trash-fill"></i>
                        </a>
                    </div>
                </td>
            </tr>
            <% } %>

            </tbody>
        </table>

        <div>
            <a class="btn btn-danger" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=listarJuegosDisponibles">Regresar</a>
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