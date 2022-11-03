<%-- 
    Document   : ConsultaPaqueteEspectaculos
    Created on : 21/10/2022, 06:14:25 PM
    Author     : Luciano
--%>

<%@page import="Clases.Paquetes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de paquete de espectaculos</title>
    </head>
    <body>
        <label>Paquetes</label>
        <ul id="paquete" name="paquete">
        </ul>

        <input id="nombre" name="nombre" type="text" placeholder="Nombre" readonly/>
        <input id="descripcion" name="descripcion" type="text" placeholder="Descripcion" readonly/>  
        <input id="fechaInicio" name="fechaInicio" type="date" readonly/>  
        <input id="fechaFin" name="fechaFin" type="date" readonly/>  
        <input id="descuento" name="descuento" type="number" min="0" placeholder="Descuento" readonly/>  

        <div>
            <label>Espectaculos del paquete</label>
            <ul id="espectaculosPaquete">
            </ul>

            <label>Categorias asociadas al paquete</label>
            <ul id="categoriasPaquete">
            </ul>
        </div>

        <img id="img">

        <script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <script src = "ConsultaPaqueteEspectaculo.js"></script>

    </body>
</html>
