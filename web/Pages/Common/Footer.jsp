
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>


<!-- Modal -->
<div class="modal fade" id="compraPaquetes" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Deseas comprar el paquete?</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <input type="hidden" id="nombrePaquete">
            <p>¿Deseas comprar el paquete?</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
            <button type="button" class="btn btn-success" onclick="confirmarCompra()">Confirmar</button>
        </div>
        </div>
    </div>
</div>
  

<script>

    function confirmarCompra() {
        var paquete = $("#nombrePaquete").val();
        if(paquete != "")
        {
            $.ajax({
                url:"/coronatickets_web/paquete/comprarPaquete",
                async:false,
                cache:false,
                type:'POST',
                data: {"paquete":paquete,},
                success: function (response) {
                    var json = response[0]
                        alert(json.msg);
                    
                },
                error: function (error, JQhX) {
                    console.log(error);
                },
            }); 
        }else{
            alert("Error a la hora de la compra del paquete");
        }
    }

    function busqueda(prefix, value) {
        if(prefix != "" && value != "")
        {
            var dato = value.split(prefix)
            if($("#"+dato[1]).hasClass("active"))
            {
                $("#"+dato[1]).removeClass("active")
            }else{
                $("#"+dato[1]).addClass("active")
            }
        }
     
        var categorias = [];
        var plataformas = [];
        var buscador = $("#buscador").val();

        $("#categorias li.active").each(function(){
            categorias.push(this.id);
        });

        $("#plataformas li.active").each(function(){
            plataformas.push(this.id);
        });
        
        categorias = categorias.join(",");
        plataformas = plataformas.join(",");
        if(categorias != "" || plataformas != "" || buscador != "")
        {
            $("#resultadoBusqueda").empty();
            $.ajax({
                url:"/coronatickets_web/buscador/obtenerBusqueda",
                async:false,
                cache:false,
                type:'GET',
                data: {"plataformas":plataformas,
                        "categorias":categorias,
                        "busqueda":buscador,},
                success: function (response) {
                    var json = response
                    console.log(json.length);
                    if(json.length > 0)
                    {
                        armarBusqueda(json)
                    }else{
                        alert("No se encontro ningun resultado con la busqueda");
                    }
                },
                error: function (error, JQhX) {
                    console.log(error);
                },
            }); 
        }
    }

    function armarBusqueda(datos) {
        $("#resultadoBusqueda").empty();
        <%
            HttpSession sesionF = request.getSession();
            String inicioSesionF = "N";
            int tipoUsuarioF = 0;//Es decir que es un visitante
            if(sesionF.getAttribute("tipoUsuario") != null)
            {
                tipoUsuarioF = Integer.parseInt(sesionF.getAttribute("tipoUsuario").toString());
                inicioSesionF = "S";
            }
        %>
        for(var i = 0; i < datos.length; i++)
        {
            var tipo = "Espectaculo";
            
            var url = "/coronatickets_web/esoectaculos/obtenerFuncion?espectaculo="+datos[i].nombre;
            var boton = '<a href="'+url+'" class="btn btn-primary">Ver funciones</a>';
            if(datos[i].tipo == "P")
            {
                tipo = "Paquete";
                boton = '<a href="#" onclick="$(`#nombrePaquete`).val(`'+datos[i].nombre+'`);$(`#compraPaquetes`).modal(`show`)" class="btn btn-success">Comprar paquetes</a>';

            }
            
            <% if(inicioSesionF.equals("N")){ %>
                boton = "";
            <% } %>

            $("#resultadoBusqueda").append(`<div class="col-12 col-md-4 mb-3">
                                                <div class="card" style="width: 18rem;">
                                                    <img src="`+datos[i].imagen+`" class="card-img-top" alt="`+datos[i].nombre+`">
                                                    <div class="card-body">
                                                        <h5 class="card-title">`+datos[i].nombre+`</h5>
                                                        <p class="card-text">`+tipo+`</p>
                                                        `+boton+`
                                                    </div>
                                                </div>
                                            </div>`);
        }
    }
    
</script>

<!DOCTYPE html>