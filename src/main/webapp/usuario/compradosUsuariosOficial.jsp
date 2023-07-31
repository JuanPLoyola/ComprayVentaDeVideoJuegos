<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.GeneroMasComprado" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<CompraUsuario> listaComprados = (ArrayList<CompraUsuario>) request.getAttribute("lista3");
    ArrayList<GeneroMasComprado> lista = (ArrayList<GeneroMasComprado>) request.getAttribute("generoMasComprado1");
    ArrayList<GeneroMasComprado> listaGenero = (ArrayList<GeneroMasComprado>) request.getAttribute("generoMasComprado");

%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="/includes/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>

<body>

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="comprados"/>
</jsp:include>

<main id="main" class="main">

    <div class="pagetitle">
        <h1 class='mt-3'>Historial de juegos comprados</h1>
    </div>


    <section class="section faq">
        <div class="row">

            <% if (listaComprados.size()==0) { %>

            <div class="col-lg-12">
                <br><br>

                <div class="col text-center">
                    <div class="disponibleUsuario">
                        <div class="col text-center" style="max-width: 1000px;">
                            <h1>AÚN NO HA COMPRADO NINGÚN JUEGO</h1>
                            <div class="spinner-border" role="status">
                            <span class="visually-hidden" >COMPRA JUEGOS ACA </span>
                            </div>
                        </div>
                        <br><br>
                        <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar" class="btn btn-primary">Compre Aquí</a>
                    </div>
                </div>
            </div>
            <%}else { %>
            <!--Todos los juegos comprados-->

            <div class="col-lg-9">
                <br><br>
                <% if (session.getAttribute("msg") != null) {%>
                <div class="alert alert-success" role="alert"><%=session.getAttribute("msg")%></div>
                <%session.removeAttribute("msg");%>
                <% }%>
                <% if (session.getAttribute("nonono") != null) {%>
                <div class="alert alert-danger" role="alert"><%=session.getAttribute("nonono")%></div>
                <%session.removeAttribute("nonono");%>
                <% }%>
                <div class="container">
                    <div class="disponibleUsuario">
                        <% for (CompraUsuario cu : listaComprados) { %>
                        <div class="card mb-10" style="max-width: 1000px;">
                            <div class="row g-0 rounded-4 border border-primary border-2 p-2">
                                <!--Imagen del juego-->
                                <div class="col-md-6 d-flex justify-content-center align-items-center">
                                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=cu.getJuegos().getIdJuegos()%>" class="card-img-top" alt="...">
                                </div>
                                <!--Descripción del juego-->
                                <div class="col-md-6">
                                    <div class="card-body">
                                        <h6 class="card-title"> <%=cu.getJuegos().getNombre()%> </h6>
                                        <p class="card-text"> Descripcion : <%=cu.getJuegos().getDescripcion()%></p>
                                        <p class="card-text"> Precio : $ <%=cu.getPrecioCompra()%> </p>
                                        <p class="fw-bold"> Estado :  <%=cu.getEstados().getEstados()%> </p>
                                        <p class="fw-bold"> Fecha de Compra :  <%=cu.getFechaCompra()%> </p>
                                        <%if(cu.getEstados().getEstados().equals("entregado")){%>
                                        <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=formularioCompra&id=<%=cu.getIdCompra()%>" class="btn btn-dark" >Valoración</a>
                                        <%}else{%>

                                        <%}%>


                                        <!--<a href="<%=request.getContextPath()%>/JuegosServlet?a=verjuego&id=<%=cu.getJuegos().getIdJuegos()%>" class="btn btn-dark">Ver juego</a>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>


            <div  class="col-lg-3 d-flex flex-column align-items-center justify-content" >
                <br><br>
                <div class="row g-0">
                    <div class="col-md-12 bg-primary border rounded-4 p-4">
                        <div class="text-light text-center">
                            <h4>Género Más Comprado</h4>
                            <%for (GeneroMasComprado g : listaGenero){%>
                            <h3><%=g.getGeneroComprado()%></h3>
                            <%}%>
                        </div>
                    </div>
                </div>
                <br><br>
                <table class="table  table-bordered" >
                    <tr>
                        <th>Genero </th>
                        <th>Comprados</th>
                    </tr>
                    <% for (GeneroMasComprado a: lista){%>
                    <tr>
                        <td><%=a.getGeneroComprado()%></td>
                        <td><%=a.getCantidadComrado()%></td>
                        <%}%>
                    </tr>
                </table>
                <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=recomendaciones" class="btn btn-secondary">Recomendaciones Para Usted</a>
            </div>




            <!--Genero más comprado-->
            <!--<div class="col-lg-4">


                <div class="row g-0">
                    <div class="col-md-12 bg-primary border rounded-4 p-4">
                        <div class="text-light text-center">
                            <h4>Recomendaciones</h4>
                        </div>

                        <div class="d-flex justify-content-center align-items-center">
                            <img src="img/usuario/snipeer.jpg" width="50%" alt="">
                        </div>
                    </div>
                </div>

            </div>-->
            <%}%>

        </div>
    </section>
</main>

<br>
<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<!-- Vendor JS Files -->
<script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/vendor/chart.js/chart.umd.js"></script>
<script src="/assets/vendor/echarts/echarts.min.js"></script>
<script src="/assets/vendor/quill/quill.min.js"></script>
<script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
</body>

</html>