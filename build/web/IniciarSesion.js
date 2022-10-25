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
    switch ($("#tipoUsuario").val()) {

        case "1":
            $("#iniciarSesion").hide();
            $("#nick-correo").hide();
            $("#password").hide();

            $("#altaEspectaculo").hide();
            $("#altaPaquete").hide();
            $("#agregarEspectaculo").hide();
            break;

        case "2":
            $("#iniciarSesion").hide();
            $("#nick-correo").hide();
            $("#password").hide();
            break;

        default:
            $("#cerrarSesion").hide();
            $("#modificarUsuario").hide();
            $("#altaEspectaculo").hide();
            $("#altaPaquete").hide();
            $("#agregarEspectaculo").hide();
    }

    $("#ConsultaPaqueteEspectaculos").click(function () {
        $(location).attr('href', "ConsultaPaqueteEspectaculos.jsp");
    });

    $("#ConsultaEspectaculo").click(function () {
        $(location).attr('href', "ConsultaEspectaculo.jsp");
    });

});

