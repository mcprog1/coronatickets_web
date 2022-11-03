/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Serverlets;

import Clases.Paquetes;
import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "ConsultaPaqueteEspectaculos", urlPatterns = {"/ConsultaPaqueteEspectaculos"})
public class ConsultaPaqueteEspectaculos extends HttpServlet {

    IControladorEspetaculo ICE = Fabrica.getInstance().getIControladorEspectaculo();
    IControladorPaquetes ICP = Fabrica.getInstance().getIControladorPaquete();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Paquetes> paquetes = ICP.obtenerPaquetes();
        String Paquetes = "";

        for (int i = 0; i < paquetes.size(); i++) {

          Paquetes = Paquetes + "-" + paquetes.get(i).getNombre();
        }

         response.getWriter().print(Paquetes);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paquete = request.getParameter("nombre");
        String parametro = request.getParameter("parametro");
        String nombre = request.getParameter("nombre");

        if (parametro.equals("espectaculos")) {

            String espectaculos = ICE.espectaculosPaquete(paquete);

            response.getWriter().print(espectaculos);
        } else if (parametro.equals("datos")) {

            String datos = ICP.obtenerPaquete(nombre);

            response.getWriter().print(datos);
        } else if (parametro.equals("categorias")) {
            String categorias = ICP.categoriasPaquete(nombre);

            response.getWriter().print(categorias);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
