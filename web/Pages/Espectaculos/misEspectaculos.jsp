<%-- 
    Document   : misEspectaculos
    Created on : 20/10/2022, 09:12:36 PM
    Author     : Nico
--%>

<%@page import="Clases.Artista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Artista> listaArtista = (List<Artista>) request.getAttribute("artistas");
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/Pages/Common/Header.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mis espectaculos</title>
</head>
<body>
    <%@include file="/Pages/Common/navs.jsp" %>
    <%@include file="/Pages/Common/buscador.jsp" %>
    
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <%@include file="/Pages/Common/CategoriaPlataforma.jsp" %>
                <div class="col-12 col-md-10">
                    <div class="container-fluid">
                        <div class="row" id="cuerpoEspectaculos">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="agregarFuncion" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar funcion</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form>    
                <input type="hidden" id="espectaculo">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="m-2">
                                <label for="nombreFuncion" style="margin-right: 15px;">Nombre:</label>
                                <input type="text" class="form-control" id="nombreFuncion" style="display: inline;width: 65%;">
                            </div>
                            <div class="m-2">
                                <label for="fechaInicio" style="margin-right: 15px;">Fecha de inicio:</label>
                                <input type="date" class="form-control" id="fechaInicio" style="display: inline;width: 36%;margin-left: 16px;">
                            </div>
                            <div class="m-2">
                                <label for="horaInicio" style="margin-right: 15px;">Hora de inicio:</label>
                                <input type="time" class="form-control" id="horaInicio" style="display: inline;width: 36%;margin-left: 16px;">
                            </div>
                            <div class="m-2">
                                <label for="imgFuncion" style="margin-right: 15px;">Imagen:</label>
                                <input type="file" class="form-control" id="imgFuncion" style="display: inline;width: 80%;">
                            </div>
                            <div class="m-2" id="artistasSeleccion">
                                <label for="horaInicio" style="margin-right: 15px;">Artistas invitados:</label>
                                <%
                                    if(listaArtista != null){
                                        for(Artista artista : listaArtista){
                                %>
                                    <hr>
                                    <div class="m-2">
                                        <input value="<%=artista.getNickname()%>" type="checkbox" name="artista_<%=artista.getNickname()%>" id="artista_<%=artista.getNickname()%>" class="" style="display: inline;width: 36%;margin-left: 16px;">
                                        <label for="artista_<%=artista.getNickname()%>" style="margin-right: 15px;"><%=artista.getNickname()%></label>
                                    </div>
                                <%      } 
                                    } %>
                            </div>
                        </div>
                    </div>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
              <button type="button" class="btn btn-primary" onclick="confirmarAgregado()">Agregar</button>
            </div>
          </div>
        </div>
    </div>
      

    <%@include file="/Pages/Common/Footer.jsp" %> 
    
    <script>
        $(document).ready(function(){
            cargarEspectaculos();
        });
        
        function confirmarAgregado() {
            var nombreEspectaculos = $("#espectaculo").val();
            var nombre = $("#nombreFuncion").val();
            var fechaInicio = $("#fechaInicio").val();
            var horaInicio = $("#horaInicio").val();
            var imagen = $("#imgFuncion").val();


            if(nombre == "")
            {
                alert("El nombre es obligatorio");
            }

            if(fechaInicio == "")
            {
                alert("La fecha de inicio es obligatoria");
            }

            if(horaInicio == "")
            {
                alert("La hora de inicio es obligatoria");
            }

            var artistaSelect = $("#artistasSeleccion input[type='checkbox']:checked").length;

            if(artistaSelect <= 0)
            {  
                alert("Se debe de seleccionar al menos a 1 artista copmo inivitado");
            }else{
                var existeNombre  = verificarNombreFuncion(nombre);
                if(existeNombre == "N")
                {
                    //Subir la imagen
                    var artistas = [];
                    $("#artistasSeleccion input[type='checkbox']:checked").each(function(){
                        artistas.push(this.value);
                    });
                    artistas = artistas.join(",");
                    var url = "";
                    if(imagen != "")
                    {
                        var fd = new FormData();

                        fd.append("file", $("#imgFuncion")[0].files[0]);

                        $.ajax({
                            url: "https://upload-image-to-imgur.vercel.app/upload",
                            type: "POST",
                            data: fd,
                            async:false,
                            success: function (data) {
                                url = data['data']['url'];
                            }, error: function (a, b) {
                                console.log(a, b);
                            },
                            cache: false,
                            contentType: false,
                            processData: false
                        });

                    }
                    $.ajax({
                        url:"/coronatickets_web/espectaculos/crearFuncion",
                        async:false,
                        cache:false,
                        type:'POST',
                        data: {"nombre":nombre, "fechaInicio":fechaInicio, "horaInicio":horaInicio,"artistas":artistas, "url":url, "espectaculo":nombreEspectaculos},
                        success: function (response) {
                            if(response == "S")
                            {
                                alert("Creado con exito");
                                limpiarModal();
                                $("#agregarFuncion").modal("hide");
                            }
                        },
                        error: function (error, JQhX) {
                            console.log(error);
                        },
                    }); 
                }else{
                    alert("Ya existe el nombre de la funcion. Intente otro.");
                }
            }
        }

        function limpiarModal() {
            $("#espectaculo").val("");
            $("#nombreFuncion").val("");
            $("#fechaInicio").val("");
            $("#horaInicio").val("");
            $("#imgFuncion").val("");
            
            $("#artistasSeleccion input[type='checkbox']:checked").each(function(){
                $(this).prop("checked",false);
            });
        }

        function verificarNombreFuncion(nombre) {
            var existe = "N";
            $.ajax({
                url:"/coronatickets_web/espectaculos/verificarNombreFuncion",
                async:false,
                cache:false,
                type:'POST',
                data: {"nombre":nombre},
                success: function (response) {
                    existe = response;
                },
                error: function (error, JQhX) {
                    console.log(error);
                },
            }); 
            return existe;
        }

        function cargarEspectaculos(estado = "A") {
            $.ajax({
                url:"/coronatickets_web/espectaculos/obtenerEspectaculos",
                async:false,
                cache:false,
                type:'POST',
                data: {"estado":estado},
                success: function (response) {
                    armarEspectaculos(response);
                },
                error: function (error, JQhX) {
                    console.log(error);
                },
            }); 
        }

        function armarEspectaculos(datos) {
            $("#cuerpoEspectaculos").empty();
            for(var i = 0; i < datos.length; i++)
            {
                $("#cuerpoEspectaculos").append(`<div class="col-12 col-md-4 mb-3">
                                                    <div class="card" style="width: 18rem;">
                                                        <img src="..." class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title">`+datos[i].nombre+`</h5>
                                                            <p class="card-text">Plataforma: `+datos[i].plataforma+`</p>
                                                            <p class="card-text">Descripcion: `+datos[i].descripcion+`</p>
                                                            <p class="card-text">Espectadores:</p>
                                                            <p class="card-text">Minimo: `+datos[i].minima+`  Maximo: `+datos[i].maxima+`</p>
                                                            <p class="card-text">URL: `+datos[i].descripcion+`</p>
                                                            <a style="width: 100%;"  href="#" onclick="agregarFuncion('`+datos[i].nombre+`')" class="btn btn-success">Agregar funcion </a>
                                                            <a style="width: 100%;"  href="/coronatickets_web/esoectaculos/obtenerFuncion?espectaculo=`+datos[i].nombre+`&d=ME"  class="btn btn-primary mt-2">Ver funciones</a>
                                                        </div>
                                                    </div>
                                                </div>`);
            }
        }

        function agregarFuncion(nombreEspectaculos)
        {
            $("#espectaculo").val(nombreEspectaculos);
            $("#agregarFuncion").modal("show");       
        }

    </script>
    
</body>
</html>
