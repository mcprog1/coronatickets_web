<%-- 
    Document   : index
    Created on : 5/10/2022, 10:21:42 PM
    Author     : Nico
--%>

<%@page import="Clases.Espectaculo"%>
<%@page import="java.util.ListIterator"%>
<%@page import="Clases.Categorias"%>
<%@page import="Clases.Plataformas"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/Pages/Common/Header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coronatickets</title>
    </head>
    <body>
        <%@include file="/Pages/Common/navs.jsp" %>
        <%@include file="/Pages/Common/buscador.jsp" %>
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <div class="card mb-3" style="width: 18rem;">
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
                        <div class="card" style="width: 18rem;">
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
                    <div class="col-12 col-md-9">
                        <div class="container-fluid">
                            <div class="row">
                                <%
                                    List<Espectaculo> espectaculos = (List<Espectaculo>) request.getAttribute("espectaculo");
                                    for(Espectaculo esp: espectaculos){
                                %>
                                    <div class="col-12 col-md-4 mb-3">
                                        <div class="card" style="width: 18rem;">
                                            <img src="..." class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title"><%=esp.getNombre()%></h5>
                                                <p class="card-text"><%=esp.getDescripcion()%></p>
                                                <a href="#" class="btn btn-primary">Ver mas</a>
                                            </div>
                                        </div>
                                    </div>
                                <% } %>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/Pages/Common/Footer.jsp" %>
    </body>
</html>
