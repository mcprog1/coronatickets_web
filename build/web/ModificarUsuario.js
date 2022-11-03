$(document).ready(function () {

    $("#actualizarDatos").click(function () {

        if ($("#tipoUsuario").val === "1") {

            if (!$("#nombre").val() || !$("#apellido").val() || !$("#fecha").val() || !$("#password").val()) {

                alert("Todos los campos son obligatorios");

            } else {

                $("#modificarUsuario").submit();
            }
        } else {

            if (!$("#nombre").val() || !$("#apellido").val() || !$("#fecha").val() || !$("#password").val() || !$("#descripcion").val() || !$("#biografia").val() || !$("#URL").val()) {

                alert("Todos los campos son obligatorios");

            } else {

                $("#modificarUsuario").submit();
            }
        }
    });
    $("#volver").click(function () {
        $(location).attr('href', "IniciarSesion.jsp");
    });
//------------------------------------------------------------------------------
    if ($("#tipoUsuario").val() === "1") {

        $("#descripcion").hide();
        $("#biografia").hide();
        $("#URL").hide();

        $("#descripcion").val("a");
        $("#biografia").val("a");
        $("#URL").val("a");

        $("#nombre").val($("#nombreUsuario").val());
        $("#apellido").val($("#apellidoUsuario").val());
        $("#fecha").val($("#fechaUsuario").val());
        $("#password").val($("#passwordUsuario").val());
    } else {

        $("#nombre").val($("#nombreUsuario").val());
        $("#apellido").val($("#apellidoUsuario").val());
        $("#fecha").val($("#fechaUsuario").val());
        $("#password").val($("#passwordUsuario").val());
        $("#descripcion").val($("#descripcionUsuario").val());
        $("#biografia").val($("#biografiaUsuario").val());
        $("#URL").val($("#URLUsuario").val());
    }

});
