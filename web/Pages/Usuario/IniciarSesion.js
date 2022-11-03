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
