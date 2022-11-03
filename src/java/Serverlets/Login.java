/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Serverlets;

import java.io.IOException;
<<<<<<< HEAD
import java.io.PrintWriter;
=======
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Fabrica;
import logica.interfaz.IControladorUsuario;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    IControladorUsuario ICU = Fabrica.getInstance().getIControladorUsuario();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nickCorreo = request.getParameter("nick-correo");
        String password = request.getParameter("password");

            if(nickCorreo.contains("@")){
            nickCorreo = ICU.nickUsuario(nickCorreo, password);
        }
        
        int resultado = ICU.login(nickCorreo, password);
        
<<<<<<< HEAD
         switch (resultado) {
=======
        switch (resultado) {
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
            case 1: {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("nickCorreo", nickCorreo);
                sesion.setAttribute("password", password);
                sesion.setAttribute("tipoUsuario", 1);

                request.setAttribute("tipoUsuario", 1);
<<<<<<< HEAD
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/IniciarSesion.jsp");
=======
                RequestDispatcher view = request.getRequestDispatcher("/IniciarSesion.jsp");
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
                view.forward(request, response);
                break;
            }
            case 2: {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("nickCorreo", nickCorreo);
                sesion.setAttribute("password", password);
                sesion.setAttribute("tipoUsuario", 2);

                request.setAttribute("tipoUsuario", 2);
<<<<<<< HEAD
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/IniciarSesion.jsp");
=======
                RequestDispatcher view = request.getRequestDispatcher("/IniciarSesion.jsp");
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
                view.forward(request, response);
                break;
            }
            default: {
                request.setAttribute("tipoUsuario", 0);
<<<<<<< HEAD
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/IniciarSesion.jsp");
=======
                RequestDispatcher view = request.getRequestDispatcher("/IniciarSesion.jsp");
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
                view.forward(request, response);
            }
            break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
