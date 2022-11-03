<%-- 
    Document   : AltaEspectaculo
    Created on : 17/10/2022, 07:37:49 PM
    Author     : Luciano
--%>

<%@page import="Clases.Categoria"%>
<%@page import="Clases.Plataformas"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de espectaculo</title>
    </head>
    <body>

        <form id="altaEspectaculo"  enctype="multipart/form-data" action="AltaEspectaculo" method="post">
            <input id="imagen" name="file" type="file" placeholder="Imagen"/>  
        </form>

        <form id="altaEspectaculo2"  action="AltaEspectaculo" method="post">
            <select id="plataforma" name="plataforma">
                <option disabled selected>Plataformas</option>
                <%
                    ArrayList<Plataformas> plataformas = (ArrayList<Plataformas>) request.getAttribute("plataformas");

                    for (int i = 0; i < plataformas.size(); i++) {
                %>
                <option value=<%=plataformas.get(i).getNombre()%>><%=plataformas.get(i).getNombre()%></option>
                <%
                    }
                %>
            </select>
            <div>
                <%
                    ArrayList<Categoria> categorias = (ArrayList<Categoria>) request.getAttribute("categorias");

                    for (int i = 0; i < categorias.size(); i++) {
                %>
                <label><input class="categorias" name="categoria" type="checkbox" value=<%=categorias.get(i).getNombre()%>> <%=categorias.get(i).getNombre()%></label><br>
                    <%
                        }
                    %>

                <input id="categorias" name="categorias" type="hidden" />
                <input id="URLImagen" name="URLImagen" type="hidden" />

            </div>     
            <input id="parametro" name="parametro" type="hidden" value="alta"/>
            <input id="nombreEspectaculo" name="nombreEspectaculo" type="text" placeholder="Nombre"/>
            <input id="descripcionEspectaculo" name="descripcionEspectaculo" type="text" placeholder="Descripcion"/>  
            <input id="duracionEspectaculo" name="duracionEspectaculo" type="number" min="1" placeholder="Duracion"/>  
            <input id="espectadoresMinimos" name="espectadoresMinimos" type="number" min="1" placeholder="Espectadores minimos"/>  
            <input id="espectadoresMaximos" name="espectadoresMaximos" type="number" min="1" placeholder="Espectadores maximos"/>  
            <input id="URLEspectaculo" name="URLEspectaculo" type="text" placeholder="URL"/>  
            <input id="costoEspectaculo" name="costoEspectaculo" type="number" min="1" placeholder="Costo"/>  
            <input id="crearEspectaculo" name="crearEspectaculo" type="button" value="Crear espectaculo"/>

        </form>

        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

        <script src = "AltaEspectaculo.js"></script>

    </body>
</html>
