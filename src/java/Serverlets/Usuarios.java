/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Serverlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controller.UsuarioController;
import javax.servlet.RequestDispatcher;
import logica.Fabrica;
import logica.interfaz.*;
import Clases.*;
import java.util.List;

/**
 *
 * @author Nico
 */
@WebServlet(name = "Usuarios", urlPatterns = {"/Usuarios",
                                              "/usuarios/registro",
                                              "/usuarios/consultaDatos",
                                              "/usuarios/iniciarSesion",
                                              "/usuarios/logout",
                                              "/usuarios/misDatos"})
public class Usuarios extends HttpServlet {

    IControladorEspetaculo ICE = Fabrica.getInstance().getIControladorEspectaculo();
    IControladorCategoria ICC = Fabrica.getInstance().getIControladorCategoria();
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
        response.setContentType("text/html;charset=UTF-8");
        
        request.setAttribute("error", "");
        List<Categorias> categorias = (List<Categorias>) ICC.tblCategorias();
        List<Plataformas> plataformas = (List<Plataformas>) ICE.tblPlataforma();
        request.setAttribute("categorias", categorias);
        request.setAttribute("plataformas", plataformas);
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
        processRequest(request, response);
        String parts[] = request.getRequestURI().split("/coronatickets_web/");
        
        switch (parts[1]) {
            case "usuarios/registro"://registro de 
                request.getRequestDispatcher("/Pages/Usuario/registroUsuario.jsp").forward(request, response);
            break;
            case "usuarios/consultaDatos":
                String idUsuario = request.getParameter("id");
                request.getRequestDispatcher("/Pages/Usuario/consultaUsuario.jsp").forward(request, response);
            break;
            case "usuarios/misDatos":
                request.getRequestDispatcher("/Pages/Usuario/consultaUsuario.jsp").forward(request, response);
            break;
            case "usuarios/iniciarSesion":
                request.getRequestDispatcher("/Pages/Usuario/IniciarSesion.jsp").forward(request, response);
            break;
        }
        
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Usuarios</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Usuarios no existe la peticion " + parts[1] + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        UsuarioController controller = new UsuarioController();
           
        
        String parts[] = request.getRequestURI().split("/coronatickets_web/");
        
        switch (parts[1]) {
            case "usuarios/registro"://registro de 
                controller.registroUsuario(request, response);
            break;
            case "usuarios/iniciarSesion":
                controller.login(request, response);
            break;
            case "usuarios/logout":
                controller.logout(request, response);
            break;
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
