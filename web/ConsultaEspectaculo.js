$(document).ready(function () {

    const nombresPlataformas = [];
    const nombresCategorias = [];
    var nombresEspectaculos = [];
    var nombresFuncionesEspectaculo = [];
    var nombresPaquetesEspectaculo = [];

    var URL = window.location.toString();

    var data = URL.split("?")[1];

    if (data) {
        $("#label1").hide();
        $("#label2").hide();
        $("#label3").hide();
        
         $.ajax({
                url: "ConsultaEspectaculo",
                type: "post",
                data: {"nombreEspectaculo": data,
                    "parametro": "datosEspectaculo"
                },
                success: function (paquete) {

                    if (paquete) {
                        var data = paquete.split("..");
                        var fecha = data[9].split(" ")[0];

                        $("#nombreEspectaculo").val(data[0]);
                        $("#plataformaEspectaculo").val(data[1]);
                        $("#artistaOrganizador").val(data[2]);
                        $("#descripcionEspectaculo").val(data[3]);
                        $("#duracionEspectaculo").val(data[4]);
                        $("#espectadoresMinimos").val(data[6]);
                        $("#espectadoresMaximos").val(data[5]);
                        $("#URLEspectaculo").val(data[7]);
                        $("#costoEspectaculo").val(data[8]);
                        $("#fechaCreado").val(fecha);
                        $("#img").attr("src", data[10]);
                    }
                }
            });

            $.ajax({
                url: "ConsultaEspectaculo",
                type: "post",
                data: {"parametro": "funcionesEspectaculo",
                    "nombreEspectaculo": data},
                success: function (Funciones) {

                    if (Funciones) {
                        var data = Funciones.split("-");

                        data.forEach(function (data) {
                            if (data !== "") {
                                $("#funcionesEspectaculo").append($("<li>").html(data));
                                nombresFuncionesEspectaculo.push(data);
                            }
                        });
                    }
                }
            });

            $.ajax({
                url: "ConsultaEspectaculo",
                type: "post",
                data: {"parametro": "paquetesEspectaculo",
                    "nombreEspectaculo": data},
                success: function (Paquetes) {

                    if (Paquetes) {
                        var data = Paquetes.split("-");

                        data.forEach(function (data) {
                            if (data !== "") {
                                $("#paquetesEspectaculo").append($("<li>").html(data));
                                nombresPaquetesEspectaculo.push(data);
                            }
                        });
                    }
                }
            });

            $.ajax({
                url: "ConsultaEspectaculo",
                type: "post",
                data: {"parametro": "categoriasEspectaculo",
                    "nombreEspectaculo": data},
                success: function (Categorias) {

                    if (Categorias) {
                        var data = Categorias.split("-");

                        data.forEach(function (data) {
                            if (data !== "") {
                                $("#categoriasEspectaculo").append($("<li>").html(data));
                            }
                        });
                    }
                }
            });
//------------------------------------------------------------------------------
    } else {

        $.ajax({
            url: "ConsultaEspectaculo",
            type: "post",
            data: {"parametro": "plataformas"},
            success: function (Plataformas) {

                if (Plataformas) {
                    var data = Plataformas.split("-");

                    data.forEach(function (data) {
                        if (data !== "") {
                            $("#plataformas").append($("<li>").html(data));
                            nombresPlataformas.push(data);
                        }
                    });
                }
            }
        });

        $.ajax({
            url: "ConsultaEspectaculo",
            type: "post",
            data: {"parametro": "categorias"},
            success: function (Categorias) {

                if (Categorias) {
                    var data = Categorias.split("-");

                    data.forEach(function (data) {
                        if (data !== "") {
                            $("#categorias").append($("<li>").html(data));
                            nombresCategorias.push(data);
                        }
                    });
                }
            }
        });


//------------------------------------------------------------------------------
        $("#plataformas").on("click", "li", function () {

            $("#nombreEspectaculo").val("");
            $("#plataformaEspectaculo").val("");
            $("#artistaOrganizador").val("");
            $("#descripcionEspectaculo").val("");
            $("#duracionEspectaculo").val("");
            $("#espectadoresMinimos").val("");
            $("#espectadoresMaximos").val("");
            $("#URLEspectaculo").val("");
            $("#costoEspectaculo").val("");
            $("#fechaCreado").val("");
            $("#img").attr("src", "");

            $('#espectaculos').children().remove().end();

            $.ajax({
                url: "ConsultaEspectaculo",
                type: "post",
                data: {"parametro": "espectaculosPlataforma",
                    "nombrePlataforma": nombresPlataformas[$(this).index()]},
                success: function (Espectaculos) {

                    if (Espectaculos) {

                        nombresEspectaculos = [];

                        var data = Espectaculos.split("-");
                        data.forEach(function (data) {
                            if (data !== "") {
                                $("#espectaculos").append($("<li>").html(data));
                                nombresEspectaculos.push(data);
                            }
                        });
                    }
                }
            });
        });
//------------------------------------------------------------------------------      
        $("#categorias").on("click", "li", function () {

            $("#nombreEspectaculo").val("");
            $("#plataformaEspectaculo").val("");
            $("#artistaOrganizador").val("");
            $("#descripcionEspectaculo").val("");
            $("#duracionEspectaculo").val("");
            $("#espectadoresMinimos").val("");
            $("#espectadoresMaximos").val("");
            $("#URLEspectaculo").val("");
            $("#costoEspectaculo").val("");
            $("#fechaCreado").val("");
            $("#img").attr("src", "");

            $('#espectaculos').children().remove().end();

            $.ajax({
                url: "ConsultaEspectaculo",
                type: "post",
                data: {"parametro": "espectaculosCategoria",
                    "nombreCategoria": nombresCategorias[$(this).index()]},
                success: function (Espectaculos) {

                    if (Espectaculos) {

                        nombresEspectaculos = [];

                        var data = Espectaculos.split("-");
                        data.forEach(function (data) {
                            if (data !== "") {
                                $("#espectaculos").append($("<li>").html(data));
                                nombresEspectaculos.push(data);
                            }
                        });
                    }
                }
            });
        });
//------------------------------------------------------------------------------
        $("#espectaculos").on("click", "li", function () {

            $('#funcionesEspectaculo').children().remove().end();
            $('#paquetesEspectaculo').children().remove().end();
            $('#categoriasEspectaculo').children().remove().end();
            nombresFuncionesEspectaculo = [];
            nombresPaquetesEspectaculo = [];

            $.ajax({
                url: "ConsultaEspectaculo",
                type: "post",
                data: {"nombreEspectaculo": nombresEspectaculos[$(this).index()],
                    "parametro": "datosEspectaculo"
                },
                success: function (paquete) {

                    if (paquete) {
                        var data = paquete.split("..");
                        var fecha = data[9].split(" ")[0];

                        $("#nombreEspectaculo").val(data[0]);
                        $("#plataformaEspectaculo").val(data[1]);
                        $("#artistaOrganizador").val(data[2]);
                        $("#descripcionEspectaculo").val(data[3]);
                        $("#duracionEspectaculo").val(data[4]);
                        $("#espectadoresMinimos").val(data[6]);
                        $("#espectadoresMaximos").val(data[5]);
                        $("#URLEspectaculo").val(data[7]);
                        $("#costoEspectaculo").val(data[8]);
                        $("#fechaCreado").val(fecha);
                        $("#img").attr("src", data[10]);
                    }
                }
            });

            $.ajax({
                url: "ConsultaEspectaculo",
                type: "post",
                data: {"parametro": "funcionesEspectaculo",
                    "nombreEspectaculo": nombresEspectaculos[$(this).index()]},
                success: function (Funciones) {

                    if (Funciones) {
                        var data = Funciones.split("-");

                        data.forEach(function (data) {
                            if (data !== "") {
                                $("#funcionesEspectaculo").append($("<li>").html(data));
                                nombresFuncionesEspectaculo.push(data);
                            }
                        });
                    }
                }
            });

            $.ajax({
                url: "ConsultaEspectaculo",
                type: "post",
                data: {"parametro": "paquetesEspectaculo",
                    "nombreEspectaculo": nombresEspectaculos[$(this).index()]},
                success: function (Paquetes) {

                    if (Paquetes) {
                        var data = Paquetes.split("-");

                        data.forEach(function (data) {
                            if (data !== "") {
                                $("#paquetesEspectaculo").append($("<li>").html(data));
                                nombresPaquetesEspectaculo.push(data);
                            }
                        });
                    }
                }
            });

            $.ajax({
                url: "ConsultaEspectaculo",
                type: "post",
                data: {"parametro": "categoriasEspectaculo",
                    "nombreEspectaculo": nombresEspectaculos[$(this).index()]},
                success: function (Categorias) {

                    if (Categorias) {
                        var data = Categorias.split("-");

                        data.forEach(function (data) {
                            if (data !== "") {
                                $("#categoriasEspectaculo").append($("<li>").html(data));
                            }
                        });
                    }
                }
            });

        });
    }

    $("#paquetesEspectaculo").on("click", "li", function () {
        window.open('ConsultaPaqueteEspectaculos.jsp?' + nombresPaquetesEspectaculo[$(this).index()], '_blank');
    });

    $("#funcionesEspectaculo").on("click", "li", function () {
        window.open('ConsultaFuncionEspectaculos.jsp?' + nombresFuncionesEspectaculo[$(this).index()], '_blank'); //revisar que sea el mismo nombre de archivo
    });
});