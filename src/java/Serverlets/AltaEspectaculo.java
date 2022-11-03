/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Serverlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luciano
 */
@WebServlet(name = "AltaEspectaculo", urlPatterns = {"/AltaEspectaculo"})
public class AltaEspectaculo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          String parametro = request.getParameter("parametro");
          
          if(parametro.equals("noAlta")){
              
          }
   
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
