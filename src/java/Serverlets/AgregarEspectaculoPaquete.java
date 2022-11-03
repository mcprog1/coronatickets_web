/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Serverlets;

import Clases.Categoria;
import Clases.Paquetes;
import Clases.Plataformas;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.interfaz.IControladorEspetaculo;
import logica.interfaz.IControladorPaquetes;

/**
 *
 * @author Luciano
 */
@WebServlet(name = "AgregarEspectaculoPaquete", urlPatterns = {"/AgregarEspectaculoPaquete"})
public class AgregarEspectaculoPaquete extends HttpServlet {

    IControladorEspetaculo ICE = Fabrica.getInstance().getIControladorEspectaculo();
    IControladorPaquetes ICP = Fabrica.getInstance().getIControladorPaquete();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String parametro = request.getParameter("parametro");

        if (parametro.equals("Agregar")) {

            String paquete = request.getParameter("paquete");
            String espectaculo = request.getParameter("espectaculo");

            ICP.agregarPaqueteEspectaculo(espectaculo, paquete);

        }

        ArrayList<Plataformas> plataformas = ICE.tblPlataforma();
        ArrayList<Paquetes> paquetes = ICP.obtenerPaquetes();

        request.setAttribute("plataformas", plataformas);
        request.setAttribute("paquetes", paquetes);
        RequestDispatcher view = request.getRequestDispatcher("/AgregarEspectaculoPaquete.jsp");
        view.forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paquete = request.getParameter("paquete");
        String plataforma = request.getParameter("plataforma");

        String espectaculos = ICE.Espectaculos(paquete, plataforma);

        response.getWriter().print(espectaculos);
    }
}
