<%@ page import="com.example.proyecto_iweb.controllers.AdminJuegosServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
      <a class="nav-link text-danger " href="<%=request.getContextPath()%>/AdminJuegosServlet">
        <i class="bi bi-grid text-danger"></i>
        <span>Disponibles</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=reservas">
        <i class="bi bi-arrow-up-square"></i>
        <span>Reservas o comprados</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=propuestos">
        <i class="bi bi-arrow-up-square"></i>
        <span>Juegos propuestos</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=ofertas">
        <i class="bi bi-exclamation-square"></i>
        <span>Ofertas</span>
      </a>
    </li>

    <li class="nav-item">
      <a class="nav-link collapsed" href="#">
        <i class="bi bi-bag"></i><span>Juegos vendidos</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="icons-nav" class="nav-content" data-bs-parent="#sidebar-nav">
        <li>
          <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=nuevos">
            <i class="bi bi-circle"></i><span>Nuevo</span>
          </a>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=existentes">
            <i class="bi bi-circle"></i><span>Existente</span>
          </a>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=listarcola">
            <i class="bi bi-circle"></i><span>Cola</span>
          </a>
        </li>
      </ul>
    </li>


  </ul>


</aside>