/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Serverlets;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ConsultaEspectaculo", urlPatterns = {"/ConsultaEspectaculo"})
public class ConsultaEspectaculo extends HttpServlet {

    IControladorEspetaculo ICE = Fabrica.getInstance().getIControladorEspectaculo();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String parametro = request.getParameter("parametro");

        switch (parametro) {
            case "plataformas":
                String plataformas = ICE.Plataformas();
                response.getWriter().print(plataformas);
                break;

            case "categorias":
                String categorias = ICE.Categorias();
                response.getWriter().print(categorias);
                break;

            case "espectaculosPlataforma":
                String espectaculosPlataforma = ICE.espectaculosPlataforma(request.getParameter("nombrePlataforma"));
                response.getWriter().print(espectaculosPlataforma);
                break;

            case "espectaculosCategoria":
                String espectaculosCategoria = ICE.espectaculosCategoria(request.getParameter("nombreCategoria"));
                response.getWriter().print(espectaculosCategoria);
                break;

            case "datosEspectaculo":
                String datosEspectaculo = ICE.Espectaculo(request.getParameter("nombreEspectaculo"));
                response.getWriter().print(datosEspectaculo);
                break;

            case "funcionesEspectaculo":
                String funcionesEspectaculo = ICE.funcionesEspectaculo(request.getParameter("nombreEspectaculo"));
                response.getWriter().print(funcionesEspectaculo);
                break;

            case "paquetesEspectaculo":
                String paquetesEspectaculo = ICE.paquetesEspectaculo(request.getParameter("nombreEspectaculo"));
                response.getWriter().print(paquetesEspectaculo);
                break;

            case "categoriasEspectaculo":
                String categoriasEspectaculo = ICE.categoriasEspectaculo(request.getParameter("nombreEspectaculo"));
                response.getWriter().print(categoriasEspectaculo);
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
