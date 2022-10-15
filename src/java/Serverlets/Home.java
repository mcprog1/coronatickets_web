/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Serverlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.interfaz.*;
import Clases.*;
import java.util.List;

/**
 *
 * @author Nico
 */
@WebServlet(name = "Home", urlPatterns = {"/Home","/"})
public class Home extends HttpServlet {
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
        List<Categorias> categorias = (List<Categorias>) ICC.tblCategorias();
        List<Plataformas> plataformas = (List<Plataformas>) ICE.tblPlataforma();
        request.setAttribute("categorias", categorias);
        request.setAttribute("plataformas", plataformas);
        try ( PrintWriter out = response.getWriter()) {
             RequestDispatcher view = request.getRequestDispatcher("/Pages/index.jsp");
            view.forward(request, response);
        }
    }

    
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
        response.setContentType("text/html;charset=UTF-8");
        
        List<Categorias> categorias = (List<Categorias>) ICC.tblCategorias();
        List<Plataformas> plataformas = (List<Plataformas>) ICE.tblPlataforma();
        List<Espectaculo> espectaculo = (List<Espectaculo>) ICE.tblEspectaculo();
        try ( PrintWriter out = response.getWriter()) {
            request.setAttribute("categorias", categorias);
            request.setAttribute("plataformas", plataformas);
            request.setAttribute("espectaculo", espectaculo);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/index.jsp");
            view.forward(request, response);
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
