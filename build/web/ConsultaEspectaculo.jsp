<%-- 
    Document   : ConsultaEspectaculoEspecifico
    Created on : 22/10/2022, 04:09:35 PM
    Author     : Luciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de espectaculo</title>
    </head>

    <body>
        <label id="label1">Plataformas</label>
        <ul id="plataformas" name="plataforma">
        </ul>

        <label id="label2">Categorias</label>
        <ul id="categorias" name="categoria">
        </ul>

        <label id="label3">Espectaculos</label>
        <ul id="espectaculos" name="espectaculos">
        </ul>

        <input id="nombreEspectaculo" name="nombreEspectaculo" type="text" placeholder="Nombre" readonly/>
        <input id="plataformaEspectaculo" name="plataformaEspectaculo" type="text" placeholder="Plataforma" readonly/>
        <input id="artistaOrganizador" name="artistaOrganizador" type="text" placeholder="Artista organizador" readonly/>
        <input id="descripcionEspectaculo" name="descripcionEspectaculo" type="text" placeholder="Descripcion" readonly/>  
        <input id="duracionEspectaculo" name="duracionEspectaculo" type="number" min="1" placeholder="Duracion" readonly/>  
        <input id="espectadoresMinimos" name="espectadoresMinimos" type="number" min="1" placeholder="Espectadores minimos" readonly/>  
        <input id="espectadoresMaximos" name="espectadoresMaximos" type="number" min="1" placeholder="Espectadores maximos" readonly/>  
        <input id="URLEspectaculo" name="URLEspectaculo" type="text" placeholder="URL" readonly/>  
        <input id="costoEspectaculo" name="costoEspectaculo" type="number" min="1" placeholder="Costo" readonly/>  
         <input id="fechaCreado" name="fechaCreado" type="date" readonly/>  

        <div>   
            <label>Funciones del espectaculo</label>
            <ul id="funcionesEspectaculo" name="funcionesEspectaculo">
            </ul>

            <label>Paquetes asociados al espectaculo</label>
            <ul id="paquetesEspectaculo" name="paquetesEspectaculo">
            </ul>

            <label>Categorias del espectaculo</label>
            <ul id="categoriasEspectaculo" name="categoriasEspectaculo">
            </ul>
        </div> 

        <img id="img">

        <script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <script src = "ConsultaEspectaculo.js"></script>

    </body>



</html>
