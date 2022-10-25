$(document).ready(function () {

    $("#nombre").change(function () {

        $.ajax({
            url: "AltaPaqueteEspectaculo",
            type: "get",
            data: {"nombre": $("#nombre").val()},
            success: function (paquete) {
                if (paquete) {

                    var data = paquete.split("..");

                    $("#actualizar").val("si");

                    $("#nombre").val(data[0]);
                    $("#descripcion").val(data[1]);
                    $("#fechaInicio").val(data[2]);
                    $("#fechaFin").val(data[3]);
                    $("#descuento").val(data[4]);
                    $("#urlImagen").val(data[5]);
                    $("#img").attr("src", data[5]);
                } else {
                    $("#actualizar").val("no");
                }
            }
        });
    });

    $('#imagen').change(function () {

        var fd = new FormData();

        fd.append("file", $("#imagen")[0].files[0]);

        $.ajax({
            url: "https://upload-image-to-imgur.vercel.app/upload",
            type: "POST",
            data: fd,
            success: function (data) {
                $("#urlImagen").val(data['data']['url']);
            }, error: function (a, b) {
                console.log(a, b);
            },
            cache: false,
            contentType: false,
            processData: false
        });

    });

    $("#altaPaquete").click(function () {

        if (!$("#nombre").val() || !$("#descripcion").val() || !$("#fechaInicio").val() || !$("#fechaFin").val() || !$("#descuento").val() || !$("#altaPaquete").val()) {

            alert("Todos los campos son obligatorios");
        } else if ($("#fechaInicio").val() > $("#fechaFin").val()) {

            alert("La fecha de inicio debe ser menor a la fecha de finalización");
        } else {
            setTimeout(
                    function ()
                    {
                        $("#Paquete").submit();
                    }, 1000);
        }
    });
});