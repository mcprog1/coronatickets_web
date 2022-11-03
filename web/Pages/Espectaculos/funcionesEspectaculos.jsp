<%-- 
    Document   : funcionesEspectaculos
    Created on : 29/10/2022, 10:22:26 AM
    Author     : Nico
--%>
<%@page import="Clases.Funciones"%>
<%@page import="java.util.List"%>
<%  
String muestroRegistro = request.getAttribute("muestroRegistro").toString();

String nombreEspectaculo = request.getParameter("espectaculo");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/Pages/Common/Header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funciones de espectaculos</title>
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
                        <div class="row" id="cuerpoFuncion">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="registrarFuncion" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Registro de función</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form>    
                <input type="hidden" id="funcionNombre">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <p>¿Deseas registrarte en la función?</p>
                        </div>
                    </div>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
              <button type="button" class="btn btn-primary" onclick="confirmarRegistro()">Confirmar</button>
            </div>
          </div>
        </div>
    </div>


    <div class="modal fade" id="registrarCanjeFuncion" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">Canje registro</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form>    
                <div class="container-fluid">
                    <div class="row" id="canjesRegistro">
                    </div>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
              <button type="button" class="btn btn-success" onclick="confirmarCanjeRegistro()">Canjear</button>
              <button type="button" class="btn btn-warning" onclick="confirmarCanjeRegistro('N')">Registrar sin canjear</button>
            </div>
          </div>
        </div>
    </div>

    <%@include file="/Pages/Common/Footer.jsp" %>

    <script>
        $(document).ready(function(){
            cargarFunciones();
        });
        
        function cargarFunciones() {
            $.ajax({
                url:"/coronatickets_web/espectaculos/obtenerFunciones",
                async:false,
                cache:false,
                type:'GET',
                data: {"espectaculo":"<%=nombreEspectaculo%>"},
                success: function (response) {
                    armarFunciones  (response);
                },
                error: function (error, JQhX) {
                    console.log(error);
                },
            }); 
        }
        function armarFunciones(datos) {
            $("#cuerpoFuncion").empty();
            for(var i = 0; i < datos.length; i++)
            {
                var artistas = "";
                for(var j = 0 ; j < datos[i].artistas.length; j++)
                {
                    artistas+= `<li class="list-group-item">`+datos[i].artistas[j].nombre+`</li>`;
                }
                $("#cuerpoFuncion").append(`<div class="col-12 col-md-4 mb-3">
                                                <div class="card" style="width: 18rem;">
                                                    <img src="`+datos[i].imagen+`" class="card-img-top" alt="">
                                                    <div class="card-body">
                                                        <h5 class="card-title">`+datos[i].nombre+`</h5>
                                                        <p class="card-text">Fechay hora: de inicio:  `+datos[i].fecha+`</p>
                                                        <ul class="list-group">
                                                            `+artistas+`
                                                        </ul>
                                                        <% if (muestroRegistro == "S") { %>
                                                            <br>
                                                            <a href="#" style="width: 100%;" onclick="registrarFuncion('`+datos[i].nombre+`')" class="btn btn-block btn-success">Registrar funcion </a>
                                                        <% } %>
                                                    </div>
                                                </div>
                                            </div>`);
            }
        }

        function registrarFuncion(nombreFuncion) 
        {
            $("#funcionNombre").val(nombreFuncion);
            $("#registrarFuncion").modal("show");
        }

        function confirmarRegistro() {
            var nombreFuncion = $("#funcionNombre").val();
            $.ajax({
                url:"/coronatickets_web/espectaculos/registrarFuncion",
                async:false,
                cache:false,
                type:'POST',
                data: {"espectaculo":"<%=nombreEspectaculo%>","funcion":nombreFuncion},
                success: function (response) {
                    var json = response[0]
                    if(json.code == 0)//ES QUE SE REGISTRO OK
                    {
                        alert(json.msg)
                        $("#nombreFuncion").val("");
                        $("#registrarFuncion").modal("hide");
                    }else{
                        if(json.code == 10) //ES QUE TIENE CANJE
                        {
                            armarCanjes(json.registrosCanje);
                            $("#registrarFuncion").modal("hide");
                            $("#registrarCanjeFuncion").modal("show");
                        }else{
                            alert(json.msg)
                        }
                    }
                },
                error: function (error, JQhX) {
                    console.log(error);
                },
            }); 
        }

        function armarCanjes(registros) {
            $("#canjesRegistro").empty();
            for(var  i =0 ; i < registros.length; i++)
            {
                
                $("#canjesRegistro").append(`<div class="col-12 mb-3">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="`+registros[i].idRegistro+`" id="`+registros[i].idRegistro+`">
                                                    <label class="form-check-label" for="`+registros[i].idRegistro+`">
                                                        `+registros[i].nombre+`
                                                    </label>
                                                </div>
                                             </div>`);
            }
        }

        function confirmarCanjeRegistro(esCanje = "S") {
            var nombreFuncion = $("#funcionNombre").val();
            var idRegistros = "";
            var i = 0 ;
            $("#canjesRegistro input[type='checkbox']:checked").each(function(){
                if(i > 0)
                {
                    idRegistros = idRegistros + ",";    
                }
                idRegistros = idRegistros + $(this).val();
                i++;
            });
            if((esCanje == "S" && i == 3) || esCanje == "N")
            {
                $.ajax({
                    url:"/coronatickets_web/espectaculos/confirmarRegistrarFuncion",
                    async:false,
                    cache:false,
                    type:'POST',
                    data: {"espectaculo":"<%=nombreEspectaculo%>",
                           "esCanje":esCanje,
                           "registros":idRegistros,
                           "funcion":nombreFuncion},
                    success: function (response) {
                        var json = response[0]
                        if(json.code == 0)//ES QUE SE REGISTRO OK
                        {
                            alert(json.msg)
                            $("#nombreFuncion").val("");
                            $("#canjesRegistro").empty();
                            $("#registrarCanjeFuncion").modal("hide");
                        }else{
                            alert("Error a la hora de registrar/canjear. Intentelo nuevamente.");
                        }
                    },
                    error: function (error, JQhX) {
                        console.log(error);
                    },
                }); 
            }else{
                alert("Se tiene que seleccionar 3 registros para realizar el canje");
            }
        }

    </script>
</body>
</html>
