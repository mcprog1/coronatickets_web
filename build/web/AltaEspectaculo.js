$(document).ready(function () {

    $('#imagen').change(function () {

        var fd = new FormData();

        fd.append("file", $("#imagen")[0].files[0]);

        $.ajax({
            url: "https://upload-image-to-imgur.vercel.app/upload",
            type: "POST",
            data: fd,
            success: function (data) {
                $("#URLImagen").val(data['data']['url']);
            }, error: function (a, b) {
                console.log(a, b);
            },
            cache: false,
            contentType: false,
            processData: false
        });

    });

    $("#crearEspectaculo").click(function () {

        if (!$("#nombreEspectaculo").val() || !$("#descripcionEspectaculo").val() || !$("#duracionEspectaculo").val() || !$("#espectadoresMinimos").val() || !$("#espectadoresMaximos").val() || !$("#URLEspectaculo").val() || !$("#costoEspectaculo").val() || !$("#plataforma").val()) {

            alert("Todos los campos son obligatorios");
        } else {

            if ($(".categorias:checked").length === 0) {

                alert("Todos los campos son obligatorios");
            } else {

                if ($("#espectadoresMinimos").val() > $("#espectadoresMaximos").val()) {

                    alert("La cantidad minima de espectadores debe ser menor que la cantidad maxima");

                } else {

                    $.ajax({
                        url: "AltaEspectaculo",
                        type: "get",
                        data: {"nombre": $("#nombreEspectaculo").val()},
                        dataType: "json",
                        success: function (data) {
                            if (data === true) {

                                alert("Este nombre de espectaculo ya existe");
                            } else {

                                var seleccionadas = $('input[name=categoria]:checked');

                                categorias = "";
                                seleccionadas.each(function () {
                                    categorias = categorias + $(this).val() + "-";
                                });

                                $("#categorias").val(categorias);

                                setTimeout(
                                        function ()
                                        {
                                            $("#altaEspectaculo2").submit();
                                        }, 1000);
                            }
                        }
                    });
                }
            }
        }
    });
});