<%-- 
    Document   : CategoriaPlataforma
    Created on : 20/10/2022, 09:22:11 PM
    Author     : Nico
--%>

<%@page import="Clases.Categorias"%>
<%@page import="Clases.Plataformas"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="col-12 col-md-2">
    <div class="card mb-3" style="">
        <div class="card-header">
            Plataformas
        </div>
        <ul class="list-group list-group-flush">
        <%
            List<Plataformas> plataformas = (List<Plataformas>) request.getAttribute("plataformas");

           for(Plataformas elemento : plataformas){
        %>
            <a onclick="console.log('Holi')"><li class="list-group-item"><%=elemento.getNombre()%></li></a>
        <% } %>
        </ul>
    </div>
    <div class="card" style="">
        <div class="card-header">
          Categorias
        </div>
        <ul class="list-group list-group-flush">
        <%
            List<Categorias> categoria = (List<Categorias>) request.getAttribute("categorias");

           for(Categorias element : categoria){
        %>
            <a onclick="console.log('Holi')"><li class="list-group-item"><%=element.getNombre()%></li></a>
        <% } %>
        </ul>
    </div>
</div>