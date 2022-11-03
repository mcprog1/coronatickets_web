<%-- 
    Document   : IniciarSesion
    Created on : 10/10/2022, 11:14:35 PM
    Author     : Luciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <%@include file="/Pages/Common/Header.jsp" %>
        <title>Inicio de sesion</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
    <%@include file="/Pages/Common/navs.jsp" %>
        <input id="actualizado" name="actualizado" type="hidden" value=${actualizado}>
        <input id="tipoUsuario" name="tipoUsuario" type="hidden" value=${tipoUsuario}>

        <form id="login" action="/coronatickets_web/usuarios/iniciarSesion" method="post">
            <input id="nick-correo" name="nick-correo" type="text" placeholder="Nickname o correo"/>
            <input id="password" name="password" type="password" placeholder="Constraseña"/>  
            <input id="iniciarSesion" name="iniciarSesion" type="button" value="Iniciar sesion"/>
        </form>
 

        <form id="modificar" action="ModificarUsuario" method="post">
             <input id="parametro" name="parametro" type="hidden" value="noActualizar"/>
            <input id="modificarUsuario" name="modificarUsuario" type="submit" value="Modificar usuario"/>
        </form>

        <form id="alta" action="AltaEspectaculo" method="post">
             <input id="parametro" name="parametro" type="hidden" value="noAlta"/>
            <input id="altaEspectaculo" name="altaEspectaculo" type="submit" value="Alta de espectaculo"/>
        </form>
        
        
        
        
        
        <%@include file="/Pages/Common/Footer.jsp" %>
        <script>
            $(document).ready(function () {

                $("#iniciarSesion").click(function () {

                    if (!$("#nick-correo").val() || !$("#password").val()) {

                        alert("Todos los campos son obligatorios");

                    } else if ($("#nick-correo").val().includes('@')) {

                        if (!$("#nick-correo").val().includes('.')) {

                            alert("Correo invalido");
                        } else {

                            $("#login").submit();
                        }
                    } else {

                        $("#login").submit();
                    }
                });
            //------------------------------------------------------------------------------
                if ($("#tipoUsuario").val() !== "1" && $("#tipoUsuario").val() !== "2") {

                    $("#cerrarSesion").hide();
                    $("#modificarUsuario").hide();
                }
            //------------------------------------------------------------------------------    
                if ($("#tipoUsuario").val() === "1" || $("#tipoUsuario").val() === "2") {

                    $("#iniciarSesion").hide();
                    $("#nick-correo").hide();
                    $("#password").hide();
                }
            //------------------------------------------------------------------------------
                if ($("#actualizado").val() === "exito") {

                    setTimeout(function () {
                        alert("Informacion de usuario actualizada con exito");
                    }, 300);
                } else {
                    if ($("#tipoUsuario").val() === "0") {

                        setTimeout(function () {
                            alert("Informacion de inicio de sesion invalida");
                        }, 300);
                    } else if ($("#tipoUsuario").val() === "1" || $("#tipoUsuario").val() === "2") {

                        setTimeout(function () {
                            alert("Sesion iniciada con exito");
                        }, 300);
                    } else if ($("#tipoUsuario").val() === "-1") {

                        setTimeout(function () {
                            alert("Sesion cerrada con exito");
                        }, 300);
                        $("#tipoUsuario").val("0");
                    }
                }
            //------------------------------------------------------------------------------
            });

        </script>
        
    </body>

</html>
