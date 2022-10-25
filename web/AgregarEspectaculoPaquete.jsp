<%-- 
    Document   : AgregarEspectaculoPaquete
    Created on : 20/10/2022, 08:30:01 PM
    Author     : Luciano
--%>

<%@page import="Clases.Espectaculo"%>
<%@page import="Clases.Plataformas"%>
<%@page import="Clases.Paquetes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar espectaculo a paquete</title>
    </head>
    <body>
        <form id="agregarEspectaculoPaquete" action="AgregarEspectaculoPaquete" method="post">

            <select id="paquete" name="paquete">
                <option disabled selected>Paquete</option>
                <%
                    ArrayList<Paquetes> paquetes = (ArrayList<Paquetes>) request.getAttribute("paquetes");

                    for (int i = 0; i < paquetes.size(); i++) {
                %>
                <option value=<%=paquetes.get(i).getNombre()%>><%=paquetes.get(i).getNombre()%></option>
                <%
                    }
                %>
            </select>

            <select id="plataforma" name="plataforma">
                <option disabled selected>Plataforma</option>
                <%
                    ArrayList<Plataformas> plataformas = (ArrayList<Plataformas>) request.getAttribute("plataformas");

                    for (int i = 0; i < plataformas.size(); i++) {
                %>
                <option value=<%=plataformas.get(i).getNombre()%>><%=plataformas.get(i).getNombre()%></option>
                <%
                    }
                %>
            </select>

            <select id="espectaculo" name="espectaculo">
                <option disabled selected>Espectaculo</option>
            </select>

            <input id="parametro" name="parametro" type="hidden" value="Agregar"/>
            <input id="agregarEspectaculo" name="agregarEspectaculo" type="button" value="Agregar espectaculo"/>
            <input id="volver" name="volver" type="button" value="Volver""/>
        </form>

        <script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <script src = "AgregarEspectaculoPaquete.js"></script>
    </body>
</html>
