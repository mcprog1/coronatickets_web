$(document).ready(function () {

    $('#paquete').change(function () {

        if ($('#plataforma').val()) {
            $('#espectaculo').children().remove().end();
            $("#espectaculo").append('<option disabled selected value="Espectaculo">Espectaculo</option>');
            espectaculos();
        }

    });

    $('#plataforma').change(function () {

        if ($('#paquete').val()) {
            $('#espectaculo').children().remove().end();
            $("#espectaculo").append('<option disabled selected value="Espectaculo">Espectaculo</option>');
            espectaculos();
        }
    });

    $("#agregarEspectaculo").click(function () {

        if (!$('#espectaculo').val() || !$('#paquete').val()) {

            alert("Todos los campos son obligatorios");
        } else {

            $("#agregarEspectaculoPaquete").submit();
        }
    });

    $("#volver").click(function () {
        $(location).attr('href', "IniciarSesion.jsp");
    });

    function espectaculos() {

        $.ajax({
            url: "AgregarEspectaculoPaquete",
            type: "get",
            data: {"paquete": $("#paquete").val(),
                "plataforma": $("#plataforma").val()},
            success: function (espectaculos) {

                if (espectaculos) {

                    $("#espectaculo").empty;

                    var data = espectaculos.split("-");

                    data.forEach(function (data) {
                        if (data !== "") {
                            $("#espectaculo").append($("<option>", {value: data, text: data}));
                        }
                    });
                }
            }
        });
    }
});