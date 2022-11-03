$(document).ready(function () {

    const nombresEspectaculos = [];
    const nombresPaquetes = [];

    var URL = window.location.toString();

    var data = URL.split("?")[1];

    if (data) {

        $.ajax({
            url: "ConsultaPaqueteEspectaculos",
            type: "get",
            data: {"nombre": data,
                "parametro": "datos"
            },
            success: function (paquete) {

                if (paquete) {
                    var data = paquete.split("..");

                    $("#nombre").val(data[0]);
                    $("#descripcion").val(data[1]);
                    $("#fechaInicio").val(data[2]);
                    $("#fechaFin").val(data[3]);
                    $("#descuento").val(data[4]);
                    $("#img").attr("src", data[5]);
                }
            }
        });

        $("#img").attr("src", "");
        $('#espectaculosPaquete').children().remove().end();
        $('#categoriasPaquete').children().remove().end();

        $.ajax({
            url: "ConsultaPaqueteEspectaculos",
            type: "get",
            data: {"nombre": data,
                "parametro": "espectaculos"
            },
            success: function (espectaculos) {

                if (espectaculos) {
                    var data = espectaculos.split("-");

                    data.forEach(function (data) {
                        if (data !== "") {
                            $("#espectaculosPaquete").append($("<li>").html(data));
                            nombresEspectaculos.push(data);
                        }
                    });

                }
            }
        });

        $.ajax({
            url: "ConsultaPaqueteEspectaculos",
            type: "get",
            data: {"nombre": data,
                "parametro": "categorias"
            },
            success: function (categorias) {

                if (categorias) {
                    var data = categorias.split("-");



                    data.forEach(function (data) {
                        if (data !== "") {
                            $("#categoriasPaquete").append($("<li>").html(data));
                        }
                    });
                }
            }
        });
//------------------------------------------------------------------------------
    } else {

        $.ajax({
            url: "ConsultaPaqueteEspectaculos",
            type: "post",
            success: function (paquetes) {

                if (paquetes) {
                    var data = paquetes.split("-");

                    data.forEach(function (data) {
                        if (data !== "") {
                            $("#paquete").append($("<li>").html(data));
                            nombresPaquetes.push(data);
                        }
                    });
                }
            }
        });

//------------------------------------------------------------------------------

        $("#paquete").on("click", "li", function () {

            $("#img").attr("src", "");
            $('#espectaculosPaquete').children().remove().end();
            $('#categoriasPaquete').children().remove().end();

            $.ajax({
                url: "ConsultaPaqueteEspectaculos",
                type: "get",
                data: {"nombre": nombresPaquetes[$(this).index()],
                    "parametro": "espectaculos"
                },
                success: function (espectaculos) {

                    if (espectaculos) {
                        var data = espectaculos.split("-");

                        data.forEach(function (data) {
                            if (data !== "") {
                                $("#espectaculosPaquete").append($("<li>").html(data));
                                nombresEspectaculos.push(data);
                            }
                        });

                    }
                }
            });


            $.ajax({
                url: "ConsultaPaqueteEspectaculos",
                type: "get",
                data: {"nombre": nombresPaquetes[$(this).index()],
                    "parametro": "categorias"
                },
                success: function (categorias) {

                    if (categorias) {
                        var data = categorias.split("-");



                        data.forEach(function (data) {
                            if (data !== "") {
                                $("#categoriasPaquete").append($("<li>").html(data));
                            }
                        });
                    }
                }
            });

            $.ajax({
                url: "ConsultaPaqueteEspectaculos",
                type: "get",
                data: {"nombre": nombresPaquetes[$(this).index()],
                    "parametro": "datos"
                },
                success: function (paquete) {

                    if (paquete) {
                        var data = paquete.split("..");

                        $("#nombre").val(data[0]);
                        $("#descripcion").val(data[1]);
                        $("#fechaInicio").val(data[2]);
                        $("#fechaFin").val(data[3]);
                        $("#descuento").val(data[4]);
                        $("#img").attr("src", data[5]);
                    }
                }
            });

        });
    }
//------------------------------------------------------------------------------

    $("#espectaculosPaquete").on("click", "li", function () {
            window.open('ConsultaEspectaculo.jsp?' + nombresEspectaculos[$(this).index()], '_blank');
    });
});