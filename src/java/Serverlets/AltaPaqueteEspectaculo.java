/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Serverlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.interfaz.IControladorPaquetes;

/**
 *
 * @author Luciano
 */
@WebServlet(name = "AltaPaqueteEspectaculo", urlPatterns = {"/AltaPaqueteEspectaculo"})
public class AltaPaqueteEspectaculo extends HttpServlet {

    IControladorPaquetes ICP = Fabrica.getInstance().getIControladorPaquete();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");
        String descuento = request.getParameter("descuento");
        String URLImagen = request.getParameter("urlImagen");

        String actualizar = request.getParameter("actualizar");

        if (actualizar.equals("no")) {

            ICP.AltaPaquete(nombre, descripcion, fechaInicio, fechaFin, descuento, URLImagen);
        }else{
            ICP.ActualizarPaquete(nombre, descripcion, fechaInicio, fechaFin, descuento, URLImagen);
        }
        RequestDispatcher view = request.getRequestDispatcher("/IniciarSesion.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");

        String paquete = ICP.obtenerPaquete(nombre);

        response.getWriter().print(paquete);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
