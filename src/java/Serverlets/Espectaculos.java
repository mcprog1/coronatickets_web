/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Serverlets;

import Clases.Artista;
import Clases.Categorias;
import Clases.Funciones;
import Clases.Plataformas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.interfaz.*;
import Interface.IControladorFuncion;
import Controller.EspectaculosController;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nico
 */
@WebServlet(name = "Espectaculos", urlPatterns = {"/Espectaculos",
                                                  "/espectaculos/misEspectaculos",
                                                  "/espectaculos/obtenerEspectaculos",
                                                  "/espectaculos/verificarNombreFuncion",
                                                  "/espectaculos/crearFuncion",
                                                  "/esoectaculos/obtenerFuncion",
                                                  "/espectaculos/obtenerFunciones",
                                                  "/espectaculos/registrarFuncion",
                                                  "/espectaculos/confirmarRegistrarFuncion",
                                                  "/paquete/comprarPaquete"})
public class Espectaculos extends HttpServlet {
    IControladorEspetaculo ICE = Fabrica.getInstance().getIControladorEspectaculo();
    IControladorCategoria ICC = Fabrica.getInstance().getIControladorCategoria();
    IControladorUsuario ICU = Fabrica.getInstance().getIControladorUsuario();
    IControladorFuncion ICF = Fabrica.getInstance().getIControladorFuncion();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        EspectaculosController controller = new EspectaculosController();
        response.setContentType("text/html;charset=UTF-8");
        
        request.setAttribute("error", "");
        List<Categorias> categorias = (List<Categorias>) ICC.tblCategorias();
        List<Plataformas> plataformas = (List<Plataformas>) ICE.tblPlataforma();
        request.setAttribute("categorias", categorias);
        request.setAttribute("plataformas", plataformas);
        
        String parts[] = request.getRequestURI().split("/coronatickets_web/");
        
        switch (parts[1]) {
            case "espectaculos/misEspectaculos":
                List<Artista> listArtista = (List<Artista>) ICU.tablaArtistas();
                request.setAttribute("artistas", listArtista);
            break;
            case "esoectaculos/obtenerFuncion":
                String destino = request.getParameter("d");
                String muestroRegistro = "N";
                
                HttpSession sesion = request.getSession();
                String inicioSesion = "N";
                int tipoUsuario = 0;//Es decir que es un visitante
                if(sesion.getAttribute("tipoUsuario") != null)
                {
                    tipoUsuario = Integer.parseInt(sesion.getAttribute("tipoUsuario").toString());
                    inicioSesion = "S";
                }
                if(inicioSesion.equals("S") && tipoUsuario != 2)
                {
                    muestroRegistro = "S";
                }
                request.setAttribute("muestroRegistro", muestroRegistro);
            break;
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EspectaculosController controller = new EspectaculosController();
        processRequest(request, response);
         
        String parts[] = request.getRequestURI().split("/coronatickets_web/");
        
        switch (parts[1]) {
            case "espectaculos/misEspectaculos":
                request.getRequestDispatcher("/Pages/Espectaculos/misEspectaculos.jsp").forward(request, response);
            break;
            case "esoectaculos/obtenerFuncion":
                request.getRequestDispatcher("/Pages/Espectaculos/funcionesEspectaculos.jsp").forward(request, response);
            break;
            case "espectaculos/obtenerFunciones":
                controller.cargarFuncionesEspectaculos(request,response);
            break;
            default:
                try ( PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Espectaculos</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet Espectaculos no existe la peticion " + parts[1] + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }
        
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        EspectaculosController controller = new EspectaculosController();
        
        String parts[] = request.getRequestURI().split("/coronatickets_web/");
        
        switch (parts[1]) {
            case "espectaculos/obtenerEspectaculos":
                controller.obtenerEspectaculos(request,response);
            break;
            case "espectaculos/verificarNombreFuncion":
                controller.verificarNombreFuncion(request,response);
            break;
            case "espectaculos/crearFuncion":
                controller.crearFuncion(request,response);
            break;
            case "espectaculos/registrarFuncion":
                controller.preRegistroFuncion(request,response);
            break;
            case "espectaculos/confirmarRegistrarFuncion":
                controller.registrarFuncion(request,response);
            break;
            case "paquete/comprarPaquete":
                controller.comprarPaquete(request,response);
            break;
            default:
                try ( PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet Espectaculos</title>");            
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Servlet Espectaculos no existe la peticion " + parts[1] + "</h1>");
                    out.println("</body>");
                    out.println("</html>");
                }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
