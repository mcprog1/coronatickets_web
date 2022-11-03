<%-- 
    Document   : ConsultaEspectaculo
    Created on : 19/10/2022, 06:57:43 PM
    Author     : Luciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de paquete de espectaculo</title>
    </head>
    <body>

        <form id="altaPaqueteEspectaculo" enctype="multipart/form-data" action="AltaPaqueteEspectaculo" method="post">
            <input id="imagen" name="file" type="file" placeholder="Imagen"/>  
        </form>

        <form id="Paquete" action="AltaPaqueteEspectaculo" method="post">
            <input id="nombre" name="nombre" type="text" placeholder="Nombre"/>
            <input id="descripcion" name="descripcion" type="text" placeholder="Descripcion"/>  
            <input id="fechaInicio" name="fechaInicio" type="date" />  
            <input id="fechaFin" name="fechaFin" type="date"/>  
            <input id="descuento" name="descuento" type="number" min="0" placeholder="Descuento"/>  
            <input id="urlImagen" name="urlImagen" type="hidden" />
            <input id="actualizar" name="actualizar" type="hidden" value="no"/>
            <input id="altaPaquete" name="altaPaquete" type="button" value="Crear/Actualizar paquete"/>
        </form>

        <img id="img">

        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>

        <script src = "AltaPaqueteEspectaculo.js"></script>

    </body>
</html>
