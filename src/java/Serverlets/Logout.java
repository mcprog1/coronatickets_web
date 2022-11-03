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
import javax.servlet.http.HttpSession;


@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            HttpSession sesion = request.getSession();
            sesion.invalidate();

            request.setAttribute("tipoUsuario", -1);
<<<<<<< HEAD
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/IniciarSesion.jsp");
=======
            RequestDispatcher view = request.getRequestDispatcher("/IniciarSesion.jsp");
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
            view.forward(request, response);
        }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
