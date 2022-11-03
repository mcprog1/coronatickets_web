<%-- 
    Document   : ModificarUsuario
    Created on : 13/10/2022, 09:21:05 PM
    Author     : Luciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar usuario</title>
    </head>

    <body>

        <input id="tipoUsuario" name="tipoUsuario" type="hidden" value=${tipoUsuario}>
        <input id="nombreUsuario" name="nombreUsuario" type="hidden" value=${nombre}>
        <input id="apellidoUsuario" name="apellidoUsuario" type="hidden" value=${apellido}>
        <input id="fechaUsuario" name="fechaUsuario" type="hidden" value=${fecha}>
        <input id="passwordUsuario" name="passwordUsuario" type="hidden" value=${password}>
        <input id="descripcionUsuario" name="descripcionUsuario" type="hidden" value=${descripcion}>
        <input id="biografiaUsuario" name="biografiaUsuario" type="hidden" value=${biografia}>
        <input id="URLUsuario" name="URLUsuario" type="hidden" value=${URL}>

        <form id="modificarUsuario" action="ModificarUsuario" method="post">
            <input id="parametro" name="parametro" type="hidden" value="actualizar"/>
            <input id="nombre" name="nombre" type="text" placeholder="Nombre"/>
            <input id="apellido" name="apellido" type="text" placeholder="Apellido"/>
            <input id="fecha" name="fecha" type="date"/>
            <input id="password" name="password" type="password" placeholder="Constraseña"/>  
            <input id="descripcion" name="descripcion" type="text" placeholder="Descripcion"/>
            <input id="biografia" name="biografia" type="text" placeholder="Biografia"/>
            <input id="URL" name="URL" type="text" placeholder="URL"/>  
            <input id="actualizarDatos" name="actualizarDatos" type="button" value="Actualizar datos"/>
        </form>

        <input id="volver" name="volver" type="button" value="Volver" onclick="history.back()"/>

        <script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <script src = "ModificarUsuario.js"></script>

    </body>

</html>
