/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.interfaz.*;
/**
 *
 * @author Nico
 */
public class UsuarioController {
    
    IControladorUsuario ICU = Fabrica.getInstance().getIControladorUsuario();
    
    public void registroUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String nickname = "", 
               nombre = "", 
               apellido = "", 
               nacimiento = "", 
               email = "", 
               pwd = "", 
               pwd2 = "", 
               esArtista = "", 
               descripcionGeneral = "", 
               biografia = "", 
               url = "";

        //Primero cargo todas las varibles

        if(request.getParameter("Registro[nickname]") != null)
        {
            nickname = request.getParameter("Registro[nickname]");
        }

        if(request.getParameter("Registro[nombre]") != null)
        {
            nombre = request.getParameter("Registro[nombre]");
        }
       
        if(request.getParameter("Registro[apellido]") != null)
        {
            apellido = request.getParameter("Registro[apellido]");
        }

        if(request.getParameter("Registro[nacimiento]") != null)
        {
            nacimiento = request.getParameter("Registro[nacimiento]");
        }

        if(request.getParameter("Registro[email]") != null)
        {
            email = request.getParameter("Registro[email]");
        }

        if(request.getParameter("Registro[pwd]") != null)
        {
            pwd = request.getParameter("Registro[pwd]");
        }

        if(request.getParameter("Registro[pwd2]") != null)
        {
            pwd2 = request.getParameter("Registro[pwd2]");
        }

        if(request.getParameter("Registro[artista]") != null)
        {
            esArtista = request.getParameter("Registro[artista]");
        }

        if(request.getParameter("Registro[descripciongeneral]") != null)
        {
            descripcionGeneral = request.getParameter("Registro[descripciongeneral]");
        }

        if(request.getParameter("Registro[Biografia]") != null)
        {
            biografia = request.getParameter("Registro[Biografia]");
        }

        if(request.getParameter("Registro[url]") != null)
        {
            url = request.getParameter("Registro[url]");
        }   
        
        /*try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. *
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Usuarios</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Usuarios at " + esArtista + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
        if(nickname == null|| nombre == null || apellido == null || nacimiento == null || email == null || pwd == null || pwd2 == null || esArtista == null || (esArtista == "S" && descripcionGeneral == null))
        {
            request.setAttribute("error", "Revisa tus datos!");
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/registroUsuario.jsp");
            view.forward(request, response);            
        }else{
            if(!pwd.equals(pwd2))
            {
                request.setAttribute("error", "Las contraseña no coinciden");
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/registroUsuario.jsp");
                view.forward(request, response);
            }else{
                String creado = ICU.crearUsuario(nickname,nombre,apellido,nacimiento,email,pwd,esArtista,descripcionGeneral,biografia,url);
                
                if(creado.equals("S"))
                {
                    request.getRequestDispatcher("/").forward(request, response);
                }else if(creado.equals("NR"))
                {
                    request.setAttribute("error", "El nickname ya esta en uso, por favor intente con otro.");
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/registroUsuario.jsp");
                    view.forward(request, response);
                }else if(creado.equals("ER"))
                {
                    request.setAttribute("error", "El email ya esta en uso, por favor intente con otro.");
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/registroUsuario.jsp");
                    view.forward(request, response);
                }else{
                    request.setAttribute("error", "Error a la hora de crear el usuario");
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/registroUsuario.jsp");
                    view.forward(request, response);
                }
            }
        }
        

    }
    
}
