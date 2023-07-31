
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page import="java.time.*" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<% ArrayList<CompraUsuario> lista = (ArrayList<CompraUsuario>) request.getAttribute("lista"); %>

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
<jsp:include page="/includes/narvar.jsp">
    <jsp:param name="currentPage" value="reservasYcomprados"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">



    <div class="container">

        <div class="pagetitle">
            <h1>Juegos comprados y reservados</h1>
        </div>

        <div class="table-responsive">

            <table id="example" class="table table-striped" style="width:100%">
                <thead>
                <tr>
                    <th>Usuario</th>
                    <th>Juego</th>
                    <th>Fecha compra</th>
                    <th>Estado</th>
                    <th>Fecha entrega</th>
                    <th>Observación</th>
                    <th>Entrega</th>
                    <th class="d-flex justify-content-center">Detalles</th>
                </tr>
                </thead>
                <tbody>
                <% for (CompraUsuario c : lista) { %>
                <% if(usuarioLog.getIdCuentas() == c.getIdAdmin()) {%>
                    <tr>
                    <td><%=c.getUsuario().getNombre()%> <%=c.getUsuario().getApellido()%></td>
                    <td><%=c.getJuegos().getNombre()%></td>
                    <td><%=c.getFechaCompra()%></td>
                    <td><%=c.getEstados().getEstados()%></td

                    <!-- FECHA DE ENTREGA DEL VIDEOJUEGO -->
                    <% if (c.getEstados().getEstados().equals("pendiente")) {%>
                        <td><p class="text-primary">En proceso</p></td>
                    <%}%>

                    <%if(c.getEstados().getEstados().equals("entregado")){%>
                        <td><%=c.getFechaEntrega()%></td>
                    <%}%>

                    <!-- OBSERVACIÓN EN DIAS -->
                    <% if (c.getEstados().getEstados().equals("pendiente")) {%>
                        <%
                            LocalDate fecha1 = c.getFechaCompra().toLocalDate();
                            LocalDate fecha2 = LocalDate.now();
                            long diferenciaEnDias = ChronoUnit.DAYS.between(fecha1, fecha2);
                        %>
                        <% if (diferenciaEnDias>3 && diferenciaEnDias<=10) {%>
                            <td><p class="text-danger"> <%=diferenciaEnDias%> días</p></td>
                        <%} else if (diferenciaEnDias>10) {%>
                            <td><h5 class="fw-bold text-danger"> <%=diferenciaEnDias%> días</h5></td>


                        <%} else {%>
                            <td><p> <%=diferenciaEnDias%> días</p></td>
                        <%}%>

                    <%} else if(c.getEstados().getEstados().equals("entregado")){%>
                        <td><p>Compra finalizada</p></td>
                    <%}%>

                    <!-- ENTREGA -->

                    <% if (c.getEstados().getEstados().equals("pendiente")) {%>
                        <td><a onclick="alert('Seguro que desea confirma la entrega a <%=c.getUsuario().getNombre()%> <%=c.getUsuario().getApellido()%>');" class="btn btn-primary"
                               href="<%=request.getContextPath()%>/AdminJuegosServlet?a=juegoEntregado&id=<%=c.getIdCompra()%>&fechaEntrega=<%=java.time.LocalDate.now()%>">
                            Entregar</a></td>

                    <%} else if(c.getEstados().getEstados().equals("entregado")){%>
                        <td><button type="button" class="btn btn-success" disabled>Entregado</button></td>

                    <%}%>

                    <!-- OPCIONES -->
                    <td class="text-center">
                        <div class="d-flex justify-content-center">
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=detallesCompra&id=<%=c.getIdCompra()%>"
                               class="btn btn-primary m-1"><i class="bi bi-list-task"></i></a>
                            <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=locationUsuario&id=<%=c.getIdCompra()%>"
                               class="btn btn-primary m-1"><i class="bi bi-geo-alt-fill"></i></a>
                        </div>

                    </td>
                    </tr>
                <% } %>
                <% } %>

                </tbody>

            </table>

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
