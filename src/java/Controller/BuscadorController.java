/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.interfaz.*;

/**
 *
 * @author Nico
 */
public class BuscadorController {
    
    IControladorBusqueda ICB = Fabrica.getInstance().getIControladorBusqueda();
    
    public void buscador(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String platafomas = "";
        String categorias = "";
        String busqueda = "";
        
        String json = "";
        
        
        if(request.getParameter("plataformas") != null)//Si se envia el parametro entonces continuo
        {
            platafomas = request.getParameter("plataformas");
        }
        
        
        if(request.getParameter("categorias") != null)//Si se envia el parametro entonces continuo
        {
            categorias = request.getParameter("categorias");
        }
        
        
        if(request.getParameter("busqueda") != null)//Si se envia el parametro entonces continuo
        {
            busqueda = request.getParameter("busqueda"); 
        }
        
        json = ICB.busqueda(platafomas, categorias, busqueda);
        
        PrintWriter out = response.getWriter();
        response.setHeader("Content-Type", "application/json");
        response.setCharacterEncoding("UTF-8");
        out.print("["+json+"]");
        out.flush(); 
    }
}
