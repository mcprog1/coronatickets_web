<%-- 
    Document   : navs
    Created on : 9/10/2022, 09:40:15 AM
    Author     : Nico
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String inicioSesion = "N";
    int tipoUsuario = 0;//Es decir que es un visitante
    if(sesion.getAttribute("tipoUsuario") != null)
    {
        tipoUsuario = Integer.parseInt(sesion.getAttribute("tipoUsuario").toString());
        inicioSesion = "S";
    }
%>
<!DOCTYPE html>
<nav class="navbar bg-light">
  <div class="container-fluid">
    <a href="/coronatickets_web/" class="navbar-brand">Coronatickets</a>

    
    <div class="d-flex mr-2">
      <% if(inicioSesion == "N"){ /* Es decir que no inicio sesion */%>
        <a href="/coronatickets_web/usuarios/iniciarSesion" class="btn" >Inicio de sesión</a>
        <a href="/coronatickets_web/usuarios/registro" class="btn" >Registro</a>
      <% }else{ %>
      <% if(tipoUsuario == 2){ /* Es decir que no inicio sesion */%>
        <a href="/coronatickets_web/espectaculos/misEspectaculos" class="btn" >Mis espectaculos</a>
      <% } %>
        <a href="/coronatickets_web/usuarios/misDatos" class="btn" >Mis datos</a>
        <form id="logout" action="/coronatickets_web/usuarios/logout" method="post">
            <a class="btn" onclick="$('#logout').submit()">Cerrar sesion</a>
        </form>
      <% } %>
    </div>
  </div>
</nav>

