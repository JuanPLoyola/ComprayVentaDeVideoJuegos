<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page import="java.util.ArrayList" %>


<% String currentPage = request.getParameter("currentPage"); %>
<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>

<!-- ======= CUENTA GENERAL ======= -->
<%if(usuarioLog.getIdRol()==0 || usuarioLog.getDesabilitado()== true) { %>
<header id="header" class="header fixed-top d-flex align-items-center bg-black">
  <div class="d-flex align-items-center justify-content-between">
    <a href="<%=request.getContextPath()%>/" class="logo d-flex align-items-center">
      <img src="img/sistema/logoUsuario.png" alt="">
      <span class="d-none d-lg-block text-light">JA-VAGOS</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn text-light"></i>
  </div>

  <div class="search-bar mt-3">
    <form class="search-form d-flex align-items-center" method="post" action="<%=request.getContextPath()%>/InitialServlet?p=b1">
      <input type="text" name="buscador" placeholder="Search" title="Enter search keyword">

      <button type="submit" title="Search"><i class="bi bi-search"></i></button>
    </form>
  </div>

  <nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">
      <!--BUSCADOR -->
      <li class="nav-item d-block d-lg-none">
        <a class="nav-link nav-icon search-bar-toggle " href="#">
          <i class="bi bi-search"></i>
        </a>
      </li>


      <li class="nav-item dropdown pe-3">

        <div class="form-inline font-italic my-2 my-lg-0">
          <% if (usuarioLog.getIdCuentas() > 0) { //esto logueado %>
          <span></span>
          <!-- ICONO DE TIENDA Y NOTIFICACI?N-->

          <li class="nav-item dropdown">
            <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
              <i class="bi bi-chat-left-text text-light"></i>
              <span class="badge bg-danger badge-number">2</span>
            </a>

            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
              <li class="dropdown-header">
                Tienes 2 mensajes nuevos ! ! !

                <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">Ver todo</span></a>

              </li>
              <li>
                <hr class="dropdown-divider">
              </li>

              <li class="dropdown-footer">
                <a  href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones&id=<%=usuarioLog.getIdCuentas()%>">Ver todo los mensajes</a>
              </li>

            </ul>

          </li>
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="img/usuario/usuario1.webp" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2 text-light"><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%>  </span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%> </h6>
              <span>Usuario</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=perfil">
                <i class="bi bi-person"></i>
                <span>Mi Perfil</span>

              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="#profile-edit">
                <i class="bi bi-gear"></i>
                <span>Configuración</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/login?action=logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>
              <% } else { //no estoy loggedIn %>
            <div  class="d-flex">

              <style>
                .nav-link.btn-outline-light:hover,
                .nav-link.btn-outline-light:hover span{
                  color: black;
                }
              </style>

              <a class="nav-link me-2 text-white btn btn-outline-light" style="color: white; padding: 8px; margin: 3px;"
                 href="<%=request.getContextPath()%>/InitialServlet?action=agregar">
                <span>Crear cuenta</span>
              </a>
              <a class="nav-link me-2 text-white btn btn-outline-light" style="color: white; padding: 8px; margin: 3px;"
                 href="<%=request.getContextPath()%>/login">
                <span>Iniciar Sesión</span>
              </a>

            </div>
              <% } %>
        </div>
    </ul>
    </li>
    </ul>
  </nav>
</header>

<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nava">

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("listar") ? "active" : ""%>"  href="<%=request.getContextPath()%>/InitialServlet?action=lista">
        <i class="bi bi-grid"></i>
        <span>Disponibles</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("postear") ? "active" : ""%> " href="<%=request.getContextPath()%>/login">
        <i class="bi bi-arrow-up-square"></i>
        <span>Postear</span>
      </a>
    </li>


    <li class="nav-item">
      <a class="nav-link  collapsed<%=currentPage.equals("vendidos") ? "active" : ""%> " href="<%=request.getContextPath()%>/login">
        <i class="bi bi-bag"></i>
        <span>Vendidos</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("comprados") ? "active" : ""%> " href="<%=request.getContextPath()%>/login">
        <i class="bi bi-shop"></i>
        <span>Comprados</span>
      </a>
    </li>

    <!--<li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("ofertas") ? "active" : ""%>" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=ofertas">
        <i class="bi bi-grid"></i>
        <span>Ofertas</span>
      </a>
    </li>-->
  </ul>
</aside>
<%}%>

<!-- ======= USUARIO ======= -->
<%if(usuarioLog.getIdRol()==3 && usuarioLog.getDesabilitado()==false) { %>
<header id="header" class="header fixed-top d-flex align-items-center bg-primary">

  <div class="d-flex align-items-center justify-content-between">
    <a href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar" class="logo d-flex align-items-center">
      <img src="img/sistema/logoUsuario.png" alt="">
      <span class="d-none d-lg-block text-light">JA-VAGOS</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn text-light"></i>
  </div>

  <div class="search-bar mt-3">
    <form class="search-form d-flex align-items-center" method="post" action="<%=request.getContextPath()%>/UsuariosJuegosServlet?p=b1">
      <input type="text" name="buscador" placeholder="Buscar juego" title="Enter search keyword">
      <button type="submit" title="Search"><i class="bi bi-search"></i></button>
    </form>
  </div>

  <nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">
      <li class="nav-item d-block d-lg-none">
        <a class="nav-link nav-icon search-bar-toggle " href="#">
          <i class="bi bi-search"></i>
        </a>
      </li>

      <li class="nav-item dropdown pe-3">

        <div class="form-inline font-italic my-2 my-lg-0">
          <% if (usuarioLog.getIdCuentas() > 0) { %>
          <span></span>
          <!-- ICONO DE TIENDA Y NOTIFICACION-->
          <li>
            <a class="nav-link nav-icon" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones">
              <i class="bi bi-chat-left-text text-light"></i>
              <span class="badge bg-danger badge-number"></span>
            </a>

          </li>
          <!-- TERMINA NOTIFICACION-->


          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="<%=usuarioLog.getFoto()%>" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2 text-light"><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%>  </span>
          </a>

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%> </h6>
              <span>Usuario</span>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=perfil">
                <i class="bi bi-person"></i>
                <span>Mi Perfil</span>
              </a>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/login?action=logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>
          </ul>
              <% } else { //no estoy loggedIn %>
            <div>
              <a class="nav-link" style="color: white;" href="<%=request.getContextPath()%>/login">
                (Crear cuenta)
              </a>
              <a class="nav-link" style="color: white;" href="<%=request.getContextPath()%>/login">
                (Iniciar Sesion)
              </a>
            </div>
              <% } %>
        </div>
      </li>
    </ul>
  </nav>
</header>

<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nav3">

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("listar") ? "active" : ""%>"  href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar">
        <i class="bi bi-grid text-primary"></i>
        <span>Disponibles</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("postear") ? "active" : ""%> " href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listar1">
        <i class="bi bi-arrow-up-square text-primary"></i>
        <span>Postear</span>
      </a>
    </li>


    <li class="nav-item">
      <a class="nav-link  collapsed<%=currentPage.equals("vendidos") ? "active" : ""%> " href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=vendidos">
        <i class="bi bi-bag text-primary"></i>
        <span>Vendidos</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("comprados") ? "active" : ""%> " href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=comprados">
        <i class="bi bi-shop text-primary"></i>
        <span>Comprados</span>
      </a>
    </li>
  </ul>
</aside>
<%}%>





<!-- ======= ADMIN ======= -->
<%if(usuarioLog.getIdRol()==2) { %>
<header id="header" class="header fixed-top d-flex align-items-center bg-danger">

  <!-- Parte superior izquierda -->
  <div class="d-flex align-items-center justify-content-between">
    <a href="<%=request.getContextPath()%>/AdminJuegosServlet" class="logo d-flex align-items-center">
      <img src="img/sistema/pestania.png" alt="">
      <span class="d-none d-lg-block text-light">JA-VAGOS</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn text-light"></i>
  </div>
  <!-- Parte superior medio (BUSCADOR) -->
  <div class="search-bar">
    <form class="search-form d-flex align-items-center" method="POST" action="<%=request.getContextPath()%>/AdminJuegosServlet?p=b1">
      <input type="text" name="query" placeholder="Buscar juego" title="Enter search keyword">
      <button type="submit" title="Search"><i class="bi bi-search"></i></button>
    </form>
  </div>

  <nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">
      <!--BUSCADOR -->
      <li class="nav-item d-block d-lg-none">
        <a class="nav-link nav-icon search-bar-toggle " href="#">
          <i class="bi bi-search"></i>
        </a>
      </li>

      <li class="nav-item dropdown pe-3">
        <div class="form-inline font-italic my-2 my-lg-0">
          <span></span>
          <!-- ICONO DE TIENDA Y NOTIFICACION-->
          <li class="nav-item dropdown">
            <a class="nav-link nav-icon" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=listarNotificaciones" data-bs-toggle="dropdown">
              <i class="bi bi-chat-left-text text-light"></i>
              <span class="badge bg-danger badge-number"></span>
            </a>
            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
              <li class="dropdown-footer">
                <a  href="<%=request.getContextPath()%>/AdminJuegosServlet?a=listarNotificaciones">Ver todo los mensajes</a>
              </li>
            </ul>
          </li>
          <!-- TERMINA NOTIFICACION-->




          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="<%=usuarioLog.getFoto()%>" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2 text-light"><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%>  </span>
          </a>

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%> </h6>
              <span>Administrador</span>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=perfilAdmin">
                <i class="bi bi-person"></i>
                <span>Mi Perfil</span>
              </a>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/login?action=logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>
          </ul>
        </div>
      </li>
    </ul>
  </nav>

</header>


<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nav2">

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("indexAdmin") ? "active" : ""%>"  href="<%=request.getContextPath()%>/AdminJuegosServlet?a=listarJuegosDisponibles">
        <i class="bi bi-grid text-danger"></i>
        <span>Disponibles</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("reservasYcomprados") ? "active" : ""%>"  href="<%=request.getContextPath()%>/AdminJuegosServlet?a=reservas">
        <i class="bi bi-arrow-up-square text-danger"></i>
        <span>Reservas o comprados</span>
      </a>
    </li>
    <!-- JUEGOS PROPUESTOS
     <li class="nav-item">
      <a class="nav-link collapsed<%=currentPage.equals("propuestos") ? "active" : ""%>"  href="<%=request.getContextPath()%>/AdminJuegosServlet?a=propuestos">
        <i class="bi bi-arrow-up-square text-danger"></i>
        <span>Juegos propuestos</span>
      </a>
    </li>
     -->

    <li class="nav-item">
      <a class="nav-link collapsed" href="#">
        <i class="bi bi-bag"></i><span>Juegos vendidos</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="icons-nav" class="nav-content" data-bs-parent="#sidebar-nav">
        <li>
          <a class="nav-link collapsed<%=currentPage.equals("nuevo") ? "active" : ""%>"   href="<%=request.getContextPath()%>/AdminJuegosServlet?a=nuevos">
            <i class="bi bi-circle text-danger"></i><span>Nuevo</span>
          </a>
        </li>
        <li>
          <a class="nav-link collapsed<%=currentPage.equals("existente") ? "active" : ""%>"   href="<%=request.getContextPath()%>/AdminJuegosServlet?a=existentes">
            <i class="bi bi-circle text-danger"></i><span>Existente</span>
          </a>
        </li>
        <!--
         <li>
          <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=listarcola">
            <i class="bi bi-circle"></i><span>Cola</span>
          </a>
        </li>
         -->

      </ul>
    </li>

  </ul>


</aside>
<%}%>


<!-- ======= MANAGER ======= -->
<%if(usuarioLog.getIdRol()==1) { %>
  <header id="header" class="header fixed-top d-flex align-items-center bg-warning">

    <div class="d-flex align-items-center justify-content-between">
      <a href="<%=request.getContextPath()%>/ManagerCuentasServlet" class="logo d-flex align-items-center">
        <img src="img/sistema/logoUsuario.png" alt="">
        <span class="d-none d-lg-block">JA-VAGOS</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn text-light"></i>
    </div>

    <div class="search-bar mt-3">
      <form class="search-form d-flex align-items-center" method="post" action="<%=request.getContextPath()%>/ManagerJuegosServlet?p=b">
        <input type="text" name="buscador" placeholder="Buscar juego" title="Enter search keyword" value="${param.buscador}">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div>

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <!--BUSCADOR -->
        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <!-- -->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="<%=usuarioLog.getFoto()%>" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2"><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%></span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%></h6>
              <span>Manager</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/ManagerCuentasServlet?a=perfil">
                <i class="bi bi-person"></i>
                <span>Mi Perfil</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=request.getContextPath()%>/login?action=logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header>

  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">

        <a class="nav-link collapsed<%=currentPage.equals("ListaUsuarios") ? "active" : ""%>"  href="<%=request.getContextPath()%>/ManagerCuentasServlet">
          <i class="bi bi-person-circle text-warning"></i>
          <span>Usuarios</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed<%=currentPage.equals("ListaEmpleados") ? "active" : ""%>"  href="<%=request.getContextPath()%>/ManagerCuentasServlet?a=ListaEmpleados">
          <i class="bi bi-person-bounding-box text-warning"></i>
          <span>Administradores</span>
        </a>
      </li><!-- End Profile Page Nav -->


      <li class="nav-item">
        <a class="nav-link collapsed<%=currentPage.equals("juegos") ? "active" : ""%>"  href="<%=request.getContextPath()%>/ManagerJuegosServlet">
          <i class="bi bi-grid text-warning"></i>
          <span>Juegos</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

    </ul>

  </aside>
<%}%>