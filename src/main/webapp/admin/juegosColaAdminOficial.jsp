<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<VentaUsuario> lista = (ArrayList<VentaUsuario>) request.getAttribute("lista");%>


<!DOCTYPE html>
<html lang="en">
<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<body>
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="juegosColaAdminOficial"/>
</jsp:include>

<!-- ======= Main ======= -->

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Lista de juegos a ser vendidos (Nuevos)</h1>
    </div>

    <div class="container col-lg-11 align-items-center">
        <table id="example" class="table table-striped" style="width:100%">
            <thead>
            <tr>
                <th>Usuario</th>
                <th>Videojuego</th>
                <th>Nuevo/Existente</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <% for (VentaUsuario vu : lista) { %>
                <td><%=vu.getUsuario().getNombre()%> <%=vu.getUsuario().getApellido()%></td>

                <td><%=vu.getJuegos().getNombre()%></td>

                <td><%if (vu.getJuegos().isExistente()) {%>Existente<%}%>
                    <%if (!vu.getJuegos().isExistente()) {%>Nuevo<%}%>
                </td>
                <td>
                    <div class="d-flex justify-content-center">
                        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=cambiarestadoaceptar&idventa=<%=vu.getIdVenta()%>" class="btn btn-primary m-1">Aceptar</a>
                        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=cambiarestadonoaceptar&idventa=<%=vu.getIdVenta()%>" type="button" class="btn btn-success m-1" data-bs-toggle="modal" data-bs-target="#exampleModal">No aceptar</a>
                        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=cambiarestadorechazar&idventa=<%=vu.getIdVenta()%>" class="btn btn-danger m-1">Rechazar</a>

                    </div>
                <!--</td> -->
                <!--MODAL DE ADVERTENCIA PARA TODOS-->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">¿Porque el juego no fue aceptado?</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="form-floating">
                                    <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
                                    <label for="floatingTextarea2">Deja un mensaje</label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-success">Enviar</button>
                            </div>
                        </div>
                    </div>
                </div>
                </td>
            </tr>
            <% } %>

            </tbody>
        </table>
    </div>


</main><!-- End #main -->

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
