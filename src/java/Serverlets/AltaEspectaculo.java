/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Serverlets;

<<<<<<< HEAD
import java.io.IOException;
=======
import Clases.Categoria;
import Clases.Plataformas;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD
=======
import javax.servlet.http.HttpSession;
import logica.Fabrica;
import logica.interfaz.IControladorEspetaculo;
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd

/**
 *
 * @author Luciano
 */
@WebServlet(name = "AltaEspectaculo", urlPatterns = {"/AltaEspectaculo"})
public class AltaEspectaculo extends HttpServlet {

<<<<<<< HEAD
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          String parametro = request.getParameter("parametro");
          
          if(parametro.equals("noAlta")){
              
          }
   
=======
    IControladorEspetaculo ICE = Fabrica.getInstance().getIControladorEspectaculo();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String parametro = request.getParameter("parametro");

        if (parametro.equals("noAlta")) {

            ArrayList<Plataformas> plataformas = ICE.tblPlataforma();
            ArrayList<Categoria> categorias = ICE.tblCategoria();

            request.setAttribute("plataformas", plataformas);
            request.setAttribute("categorias", categorias);
            RequestDispatcher view = request.getRequestDispatcher("/AltaEspectaculo.jsp");
            view.forward(request, response);
        } else {

            HttpSession sesion = request.getSession();

            String nombre = request.getParameter("nombreEspectaculo");
            String descripcion = request.getParameter("descripcionEspectaculo");
            String artista = sesion.getAttribute("nickCorreo").toString();
            String duracion = request.getParameter("duracionEspectaculo");
            String espectadoresMinimos = request.getParameter("espectadoresMinimos");
            String espectadoresMaximos = request.getParameter("espectadoresMaximos");
            String URL = request.getParameter("URLEspectaculo");
            String costo = request.getParameter("costoEspectaculo");
            String plataforma = request.getParameter("plataforma");
            String categorias = request.getParameter("categorias");
            String imagen = request.getParameter("URLImagen");
            
            String[] partes = categorias.split("-");

            ArrayList<String> partesFinal = new ArrayList<>();

            partesFinal.addAll(Arrays.asList(partes));

            ICE.nuevoEspectaculo(nombre, plataforma, artista, descripcion, duracion, espectadoresMaximos, espectadoresMinimos, URL, costo, partesFinal, imagen);

            RequestDispatcher view = request.getRequestDispatcher("/IniciarSesion.jsp");
            view.forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");

        boolean existe = ICE.checkEspectaculo(nombre);

        response.getWriter().print(existe);
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
