/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Clases.Artista;
import Clases.Espectaculo;
import Clases.Funciones;
import Serverlets.Espectaculos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.interfaz.IControladorCategoria;
import Interface.IControladorFuncion;
import logica.interfaz.IControladorEspetaculo;
import com.google.gson.*;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import logica.interfaz.IControladorPaquetes;

/**
 *
 * @author Nico
 */
public class EspectaculosController {
    
    IControladorEspetaculo ICE = Fabrica.getInstance().getIControladorEspectaculo();
    IControladorFuncion ICF = Fabrica.getInstance().getIControladorFuncion();
    IControladorPaquetes ICP = Fabrica.getInstance().getIControladorPaquete();
            
    public void obtenerEspectaculos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {
        String estado = "";
        if(request.getParameter("estado") != null)
        {
            estado = request.getParameter("estado");
        }
        
        List<Espectaculo> espectaculos = (List<Espectaculo>) ICE.obtenerEspectaculosEstado(estado);
        
        String json = "";
        
        for(int i = 0; i < espectaculos.size(); i ++)
        {
            if(i > 0)
            {
                json = json +",";
            }
            json = json +"{"
                    + "\"nombre\":" + "\""+ espectaculos.get(i).getNombre() +"\","
                    + "\"artista\":" + "\""+ espectaculos.get(i).getArtistaOrganizador()+"\","
                    + "\"descripcion\":" + "\""+ espectaculos.get(i).getDescripcion().trim() +"\","
                    + "\"url\":" + "\""+ espectaculos.get(i).getURL() +"\","
                    + "\"duracion\":" + ""+ String.valueOf(espectaculos.get(i).getDuracion()) +","
                    + "\"minima\":" + ""+ String.valueOf(espectaculos.get(i).getCapacidadMinima()) +","
                    + "\"maxima\":" + ""+ String.valueOf(espectaculos.get(i).getCapacidadMaxima()) +","
                    + "\"costo\":" + ""+ String.valueOf(espectaculos.get(i).getCosto()) +","
                    + "\"creado\":" + "\""+ String.valueOf(espectaculos.get(i).getFechaCreado()) +"\","
                    + "\"plataforma\":" + "\""+ String.valueOf(espectaculos.get(i).getPLataforma()) +"\","
                    + "\"estado\":" + "\""+ espectaculos.get(i).getEstado()+"\""
                    + "}";
        }
        
        PrintWriter out = response.getWriter();
        response.setHeader("Content-Type", "application/json");
        response.setCharacterEncoding("UTF-8");
        out.print("["+json+"]");
        out.flush(); 
    }
    
    public void verificarNombreFuncion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {
        String nombre = request.getParameter("nombre");
        
        String existe = ICF.existeNombreFuncion(nombre);
        
        PrintWriter out = response.getWriter();
        //response.setHeader("Content-Type", "application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(existe);
        out.flush(); 
    }
    
    public void crearFuncion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {
        String espectaculo = request.getParameter("espectaculo");
        String nombre = request.getParameter("nombre");
        String fechaInicio[] = request.getParameter("fechaInicio").split("-");
        String horaInicio[] = request.getParameter("horaInicio").split(":");
        String artistas[] = request.getParameter("artistas").split(",");
        String url = request.getParameter("url");
        
        List<String> artistaList = new ArrayList<String>();
        
        for(int i = 0;i < artistas.length;i++)
        {
            artistaList.add(artistas[i]);
        }
        
        
        int resultado =  ICF.AltaFuncion(espectaculo, nombre, String.valueOf(fechaInicio[2]), String.valueOf(fechaInicio[1]), String.valueOf(fechaInicio[0]), horaInicio[0], horaInicio[1], artistaList, url );
        String creado = "S";
        if(resultado != 8 && resultado != 9)
        {
            creado = "N";
        }
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        out.print(creado);
        out.flush(); 
    }
 
    public void cargarFuncionesEspectaculos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {
        String nombreEspectaculo = request.getParameter("espectaculo");
        List<Funciones> fun = (List<Funciones>) ICF.ListarFuncionesEspectaculo(nombreEspectaculo);
        
        
        String json = "";
        
        for(int i = 0; i < fun.size(); i ++)
        {
            if(i > 0)
            {
                json = json +",";
            }
            List<Artista> artistas = (List<Artista>) ICF.obtenerArtistasFuncion(fun.get(i).getNombre());
            String jsonArtistas = "";
            for(int j = 0; j < artistas.size(); j++)
            {
                if(j > 0)
                {
                    jsonArtistas = jsonArtistas +",";
                }        
                jsonArtistas =  jsonArtistas+ "{"
                                            + "\"nombre\":" + "\""+artistas.get(j).getNombre()+" "+artistas.get(j).getApellido()+"\""
                                            + "}";
            }
            json = json +"{"
                    + "\"nombre\":" + "\""+ fun.get(i).getNombre() +"\","
                    + "\"imagen\":" + "\""+ fun.get(i).getImagen() +"\","
                    + "\"fecha\":" + "\""+ fun.get(i).getHoraDeInicio().toString()+"\","
                    + "\"artistas\": [" + jsonArtistas +" ]"
                    + "}";
        }
        PrintWriter out = response.getWriter();
        response.setHeader("Content-Type", "application/json");
        response.setCharacterEncoding("UTF-8");
        out.print("["+json+"]");
        out.flush(); 
    }
    
    public void preRegistroFuncion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {  

        String json = "";
        String nombreEspectaculo = request.getParameter("espectaculo");
        String nombreFuncion = request.getParameter("funcion");
        
        HttpSession sesion = request.getSession();
        String nickname = sesion.getAttribute("nickCorreo").toString();
        
            
        //Primero me fijo si esta lleno es espectaculo
        if(ICF.EspectaculoLleno(nombreEspectaculo, nombreFuncion) == 1)//Es que esta lleno
        {
            json = "{"
                    + "\"code\":" + "100,"
                    + "\"msg\": \"El espectaculo esta lleno, intente con otro.\""
                    + "}";
        }else{
            if(ICF.EspectadorEnFuncion(nickname, nombreFuncion) == 1)
            {
                json = "{"
                    + "\"code\":" + "30,"
                    + "\"msg\": \"Ya esta registrado a la funcion intente otro.\""
                    + "}";
            }else{
                //Me fijo si tiene para canjear
                if(ICF.tieneCanjeDisponible(nickname).equals("S")) //Si tiene canje entonces retorno para canjear
                {
                    String jsonRegistro = ICF.obtenerRegistroCanjera(nickname);
                    json = "{"
                        + "\"code\":" + "10,"
                        + "\"msg\": \"Tienes canje para realizar, seleccione dos registros para poder realizar el canje.\","
                        + "\"registrosCanje\":" + "["+jsonRegistro+"]"
                        + "}";
                }else{ //Si no hago el registro
                    ICF.RegistrarEspectadorFuncion(nickname, nombreEspectaculo, nombreFuncion);
                    json = "{"
                        + "\"code\":" + "0,"
                        + "\"msg\": \"Se registro correctamente a la funcion.\""
                        + "}";
                }
                
            }
        }
        
        PrintWriter out = response.getWriter();
        response.setHeader("Content-Type", "application/json");
        response.setCharacterEncoding("UTF-8");
        out.print("["+json+"]");
        out.flush(); 
    }
    
    public void registrarFuncion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {
        String json = "";
        String esCanje = "N";
        String nombreEspectaculo = request.getParameter("espectaculo");
        String nombreFuncion = request.getParameter("funcion");
        HttpSession sesion = request.getSession();
        String nickname = sesion.getAttribute("nickCorreo").toString();
        
        if(request.getParameter("esCanje") != null)//Si se envia el parametro entonces continuo
        {
            esCanje = request.getParameter("esCanje");
        }
        //Primero chequeo si 
        
        if(esCanje.equals("S"))//Si es canje entonces sigo con lo que tengo que hacer
        {
            String registrosCanjear =  request.getParameter("registros");
            String[] registros = registrosCanjear.split(",");
            List registrosPrevios = new ArrayList<>();
            for(int i = 0;i < registros.length; i++)
            {
                registrosPrevios.add(registros[i]);
            }
            ICF.CanjearRegistroEspectadorFuncion(nickname, nombreEspectaculo, nombreFuncion, registrosPrevios);
            json = "{"
                    + "\"code\":" + "0,"
                    + "\"msg\": \"Se registro correctamente a la funcion y se realizo el canje correctamente.\""
                    + "}";
        }else{
            ICF.RegistrarEspectadorFuncion(nickname, nombreEspectaculo, nombreFuncion);
            json = "{"
                    + "\"code\":" + "0,"
                    + "\"msg\": \"Se registro correctamente a la funcion.\""
                    + "}";
        }
        
        
        PrintWriter out = response.getWriter();
        response.setHeader("Content-Type", "application/json");
        response.setCharacterEncoding("UTF-8");
        out.print("["+json+"]");
        out.flush(); 
    }
    
    public void comprarPaquete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException     
    {
        String json = "";
        String paquete = request.getParameter("paquete");
        HttpSession sesion = request.getSession();
        String nickname = sesion.getAttribute("nickCorreo").toString();
        
        String compra = ICP.comprarPaquete(paquete, nickname);
        
        if(compra.equals("S"))///Todo ok
        {
            json = "{"
                    + "\"code\":" + "0,"
                    + "\"msg\": \"Se compro correctamente el paquete.\""
                    + "}";
        }else if(compra.equals("Y")){
            json = "{"
                    + "\"code\":" + "10,"
                    + "\"msg\": \"Ya se compro el paquete..\""
                    + "}";
        } else{
            json = "{"
                    + "\"code\":" + "101,"
                    + "\"msg\": \"Error a la hora de comprar el paquete.\""
                    + "}";
        }
        
        
        PrintWriter out = response.getWriter();
        response.setHeader("Content-Type", "application/json");
        response.setCharacterEncoding("UTF-8");
        out.print("["+json+"]");
        out.flush(); 
    }
    
}
