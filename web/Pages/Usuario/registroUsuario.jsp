

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/Pages/Common/Header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
    </head>
<body>
    <%@include file="/Pages/Common/navs.jsp" %>
    <div class="main">        
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <%
                    String error = (String) request.getAttribute("error");
                    if (error != "") {
                    %>
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <form name="formRegistroUsuario" id="formRegistroUsuario" onsubmit="realizarRegistro()" method="post" action="/coronatickets_web/usuarios/registro">
                <div class="row mb-3">
                    <div class="col-12 col-md-4">
                        <label for="nickname_art" class="col-12 col-sm-3 col-form-label" style="text-align: start;">Nickname: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <input  required type="text" class="form-control" id="nickname_art" placeholder="Nickname" name="Registro[nickname]">
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <label for="nombre_art" class="col-12 col-sm-3 col-form-label" style="text-align: start;">Nombre: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <input  required type="text" class="form-control" id="nombre_art" placeholder="Nombre" name="Registro[nombre]">
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <label for="apellido_art" class="col-12 col-sm-3 col-form-label" style="text-align: start;">Apellido: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <input required  type="text" class="form-control" id="apellido_art" placeholder="Apellido" name="Registro[apellido]">
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-md-4">
                        <label for="email_art" class="col-12 col-sm-3 col-form-label" style="text-align: start;">Email: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <input  required type="email" class="form-control" id="email_art" placeholder="Correo electronico" name="Registro[email]">
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <label for="pwd_art" class="col-12 col-sm-3 col-form-label" style="text-align: start;">Contraseña: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <input type="password" class="form-control" id="pwd_art" placeholder="Contraseña" name="Registro[pwd]">
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <label for="pwd2_art" class="col-12 col-sm-5 col-form-label" style="text-align: start;">Confrimar contraseña: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <input  required type="password" class="form-control" id="pwd2_art" placeholder="Confirmar contraseña" name="Registro[pwd2]">
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12 col-md-4">
                        <label for="nacimiento_art" class="col-12 col-sm-5 col-form-label" style="text-align: start;">Fecha de nacimiento: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <input  required type="date" class="form-control" id="nacimiento_art" placeholder="Fecha de nacimiento" name="Registro[nacimiento]">
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <label for="imagen_art" class="col-12 col-sm-3 col-form-label" style="text-align: start;">Imagen: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <input type="file" class="form-control" id="imagen_art" placeholder="" name="Registro[imagen]">
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12">
                        <center>
                            <div class="mb-3">
                                <label for="nickname" class="form-label" style="margin-right: 20px;">Eres artista</label>
                                <input type="hidden" name="Registro[artista]" id="esArtista" value="N">
                                <label class="switch">
                                <input type="checkbox" id="switch-input_check_artistaes" class="switch-input">
                                <span class="slider round"></span>
                                </label>
                            </div>
                        </center>
                    </div>
                </div>
                <div class="row mb-3" id="divArtista" style="display: none;">
                    <div class="col-12 col-md-4">
                        <label for="descripciongeneral_art" class="col-12 col-sm-3 col-form-label" style="text-align: start;">Descripcion general: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <textarea class="form-control" id="descripciongeneral_art" placeholder="Descripcion general del artista" name="Registro[descripciongeneral]">
                            </textarea>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <label for="biografia_art" class="col-12 col-sm-3 col-form-label" style="text-align: start;">Biografia: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <textarea class="form-control" id="biografia_art" placeholder="Biografia" name="Registro[Biografia]">
                            </textarea>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <label for="url_art" class="col-12 col-sm-3 col-form-label" style="text-align: start;">URL: <span style="color: red;">*</span></label>
                        <div class="col-12 col-sm-9">
                            <input type="text" class="form-control" id="url_art" placeholder="URL sitio web" name="Registro[url]">
                        </div>
                    </div>
                </div>
                <div style="display: flex;float: right; margin-right: 20px; margin-bottom: 20px;">
                    <button type="submit" class="btn btn-success" name="registroUsuario">Registrarme</button>
                </div>
            </form>
        </div>
    </div>
        

    <%@include file="/Pages/Common/Footer.jsp" %>
    <script>
        (() => {
                'use strict';
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                const forms = document.querySelectorAll('.needs-validation');
                // Loop over them and prevent submission
                Array.prototype.slice.call(forms).forEach((form) => {
                    fdorm.addEventListener('submit', (event) => {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
        })();
        $("#switch-input_check_artistaes").on("click",function(){
            if(this.checked == true)
            {
            $("#esArtista").val("S");
            $("#divArtista").css("display","flex");
            }else{
            $("#esArtista").val("N");
            $("#divArtista").css("display","none");
            }    
        });
        
        
        var validadorEmail = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        
        function realizarRegistro() {
            var nickname = $("#nickname_art").val();
            var nombre = $("#nombre_art").val();
            var apellido = $("#apellido_art").val();
            var email = $("#email_art").val();
            var password = $("#pwd_art").val();
            var repassword = $("#pwd2_art").val();
            var nacimiento = $("#nacimiento_art").val();
            var imagen = $("#imagen_art").val();
            var biografia = $("#descripciongeneral_art").val();
            var descripcion = $("#biografia_art").val();
            var url = $("#url_art").val();
            
            var esArtista = $("#esArtista").val();
            var todoOk = "S";
            if(nickname == "")
            {
                alert("El nickname es obligatorio.");
                todoOk = "N";
                return false;
            }
        
            if(nombre == "")
            {
                alert("El nombre es obligatorio");
                todoOk = "N";
                return false;
            }
        
            if(apellido == "")
            {
                alert("El apellido es obligatorio");
                todoOk = "N";
                return false;
            }
        
            if(email == "")
            {
                alert("El email es obligatorio");
                todoOk = "N";
                return false;
            }
        
            if(!validadorEmail.test(correoElectronico))
            {
                alert("El correo electronico no es valido.");
                todoOk = "N";
                return false;
            }
        
            if(password == "")
            {
                alert("La contraseña es obligatoria.");
                todoOk = "N";
                return false;
            }
        
            if(repassword == "")
            {
                alert("Se debe confirmar la contraseña");
                todoOk = "N";
                return false;
            }
        
            if(password != repassword)
            {
                alert("Las contraseña no coninciden");
                todoOk = "N";
                return false;
            }
        
            if(nacimiento == "")
            {
                alert("La fecha de nacimiento es obligatoria");
                todoOk = "N";
                return false;
            }
        
        /*   if(imagen == "")
            {
                alert();
                return false;
            }*/
        
            if(esArtista == "S")//Si es artista entonces verifico que haga todo bien
            {
                if(biografia == "")
                {
                    alert("La biografia es oblgigatoria");
                    todoOk = "N";
                    return false;
                }
        /*
                if(descripcion == "")
                {
                alert();
                return false;
                }
        
                if(url == "")
                {
                alert();
                return false;
                }*/
            }
        
        
            if(todoOk =="N")
            {
                return false;    
            }else{
                return true;
            }
        
            }

    </script>
        
    </body>
</html>