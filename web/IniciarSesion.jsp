<%-- 
    Document   : IniciarSesion
    Created on : 10/10/2022, 11:14:35 PM
    Author     : Luciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Inicio de sesion</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
        <input id="actualizado" name="actualizado" type="hidden" value=${actualizado}>
        <input id="tipoUsuario" name="tipoUsuario" type="hidden" value=${tipoUsuario}>

        <form id="login" action="Login" method="post">
            <input id="nick-correo" name="nick-correo" type="text" placeholder="Nickname o correo"/>
            <input id="password" name="password" type="password" placeholder="Constraseña"/>  
            <input id="iniciarSesion" name="iniciarSesion" type="button" value="Iniciar sesion"/>
        </form>

        <form id="logout" action="Logout" method="post">
            <input id="cerrarSesion" name="cerrarSesion" type="submit" value="Cerrar sesion"/>
        </form>

        <form id="modificar" action="ModificarUsuario" method="post">
            <input id="parametro" name="parametro" type="hidden" value="noActualizar"/>
            <input id="modificarUsuario" name="modificarUsuario" type="submit" value="Modificar usuario"/>
        </form>

        <form id="alta" action="AltaEspectaculo" method="post">
            <input id="parametro" name="parametro" type="hidden" value="noAlta"/>
            <input id="altaEspectaculo" name="altaEspectaculo" type="submit" value="Alta de espectaculo"/>
        </form>

        <form id="altaPaqueteEspectaculo" action="AltaPaqueteEspectaculo.jsp" method="post">
            <input id="altaPaquete" name="altaPaquete" type="submit" value="Crear/Actualizar paquete de espectáculos"/>
        </form>

        <form id="agregarEspectaculoPaquete" action="AgregarEspectaculoPaquete" method="post">
            <input id="parametro" name="parametro" type="hidden" value="noAgregar"/>
            <input id="agregarEspectaculo" name="agregarEspectaculo" type="submit" value="Agregar espectaculo a paquete"/>
        </form>

        <input id="ConsultaPaqueteEspectaculos" name="ConsultaPaqueteEspectaculos" type="button" value="Consulta de paquete de espectaculos"/>

        <input id="ConsultaEspectaculo" name="ConsultaEspectaculo" type="button" value="Consulta de espectaculo"/>

        <script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
        <script src = "IniciarSesion.js"></script>
    </body>

</html>
