
<%@page import="Clases.Espectaculo"%>
<%@page import="java.util.ListIterator"%>
<%@page import="Clases.Categorias"%>
<%@page import="Clases.Plataformas"%>
<%@page import="java.util.List"%>   

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/Pages/Common/Header.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Consulta de usuario</title>
</head>
<body>
    <%@include file="/Pages/Common/navs.jsp" %>
    <%@include file="/Pages/Common/buscador.jsp" %>
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <div class="card mb-3" style="">
                        <div class="card-header">
                            Plataformas
                        </div>
                        <ul class="list-group list-group-flush">
                        <%
                            List<Plataformas> plataformas = (List<Plataformas>) request.getAttribute("plataformas");
                            
                           for(Plataformas elemento : plataformas){
                        %>
                            <a onclick="console.log('Holi')"><li class="list-group-item"><%=elemento.getNombre()%></li></a>
                        <% } %>
                        </ul>
                    </div>
                    <div class="card" style="">
                        <div class="card-header">
                          Categorias
                        </div>
                        <ul class="list-group list-group-flush">
                        <%
                            List<Categorias> categoria = (List<Categorias>) request.getAttribute("categorias");
                            
                           for(Categorias element : categoria){
                        %>
                            <a onclick="console.log('Holi')"><li class="list-group-item"><%=element.getNombre()%></li></a>
                        <% } %>
                        </ul>
                    </div>
                </div>
                <div class="col-12 col-md-10">
                    <div class="container-fluid">
                        <div class="row">
                           <div class="col-12 col-md-7">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                  <button class="nav-link active" id="nav-general-tab" data-bs-toggle="tab" data-bs-target="#nav-general" type="button" role="tab" aria-controls="nav-home" aria-selected="true">General</button>
                                  <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</button>
                                  <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>
                                </div>
                              </nav>
                              <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-general" role="tabpanel" aria-labelledby="nav-general-tab" tabindex="0">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12">
                                                <form action="" class="mt-3">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col-12 col-md-6">
                                                                <label for="nickname" class="form-label">Nickname</label>
                                                                <input type="text" class="form-control" id="nickname" disabled>
                                                            </div>
                                                            <div class="col-12 col-md-6">
                                                                <label for="nickname" class="form-label">Email</label>
                                                                <input type="email" class="form-control" id="nickname" disabled>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12 col-md-6">
                                                                <label for="nickname" class="form-label">Nombre</label>
                                                                <input type="text" class="form-control" id="nickname" disabled>
                                                            </div>
                                                            <div class="col-12 col-md-6">
                                                                <label for="nickname" class="form-label">Apellido</label>
                                                                <input type="email" class="form-control" id="nickname" disabled>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12 col-md-6">
                                                                <label for="fechanac" class="form-label">Fecha de nacimiento</label>
                                                                <input type="date" class="form-control" id="fechanac" disabled>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12 col-md-6">
                                                                <label for="nickname" class="form-label">Descripcion general</label>
                                                                <textarea name="descGrn" id="desGrn" disabled></textarea>
                                                            </div>
                                                            <div class="col-12 col-md-6">
                                                                <label for="nickname" class="form-label">Biografia</label>
                                                                <textarea name="biografia" id="biografia" disabled></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <label for="nickname" class="form-label">URL</label>
                                                                <input type="text" class="form-control" id="url" name="url" disabled>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <a onclick="mostrarCampos('S')" href="#" style="float: right;position: relative;top: 45%;" class="btn btn-primary">Editar</a>
                                                                <a onclick="mostrarCampos('N');editarDatos()" href="#" style="float: right;position: relative;top: 45%;display:none;" class="btn btn-success">Confirmar</a>
                                                            </div>
                                                        </div>
                                                    </div>                                                
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">

                                </div>
                                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">

                                </div>
                              </div>                              
                           </div>
                           <div class="col-12 col-md-5">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-12">
                                            <img src="" alt="Mi imagen">
                                        </div>
                                    </div>
                                </div>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     
    
    
    <%@include file="/Pages/Common/Footer.jsp" %>
    <script>
        function mostrarCampos(muestro = "S") {
            if(muestro == "S")
            {
                
            }else{

            }
        }
    </script>
</body>
</html>
