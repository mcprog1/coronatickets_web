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
import logica.Fabrica;
import logica.interfaz.IControladorUsuario;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Luciano
 */
@WebServlet(name = "ModificarUsuario", urlPatterns = {"/ModificarUsuario"})
public class ModificarUsuario extends HttpServlet {

    IControladorUsuario ICU = Fabrica.getInstance().getIControladorUsuario();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();

        String parametro = request.getParameter("parametro");
        String tipoUsuario = sesion.getAttribute("tipoUsuario").toString();
        String nick = sesion.getAttribute("nickCorreo").toString();
        String password = sesion.getAttribute("password").toString();

        if (parametro.equals("actualizar")) {

            try {
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String fechaString = request.getParameter("fecha");
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = sdf1.parse(fechaString);
                java.sql.Date fecha = new java.sql.Date(date.getTime());
                
            
                if (tipoUsuario.equals("1")) {
                    
                    ICU.EdiarEspectador(nick, nombre, apellido, password, fecha);
                    
                    request.setAttribute("actualizado", "exito");
<<<<<<< HEAD
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/IniciarSesion.jsp");
=======
                    RequestDispatcher view = request.getRequestDispatcher("/IniciarSesion.jsp");
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
                    view.forward(request, response);
                } else {
                    
                    String biografia = request.getParameter("biografia");
                    String descripcion = request.getParameter("descripcion");
                    String URL = request.getParameter("URL");
                    
                     ICU.editarArtistas(nick, nombre, apellido, password, fecha, descripcion, URL, biografia);
                    
                    request.setAttribute("actualizado", "exito");
<<<<<<< HEAD
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/IniciarSesion.jsp");
=======
                    RequestDispatcher view = request.getRequestDispatcher("/IniciarSesion.jsp");
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
                    view.forward(request, response);
                }
            } catch (ParseException ex) {
                Logger.getLogger(ModificarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {

            switch (tipoUsuario) {
                case "1": {

                    String[] infoUsuario = ICU.infoUsuario(nick, password);

                    request.setAttribute("nombre", infoUsuario[0]);
                    request.setAttribute("apellido", infoUsuario[1]);
                    request.setAttribute("fecha", infoUsuario[2]);
                    request.setAttribute("password", infoUsuario[3]);
                    request.setAttribute("tipoUsuario", 1);
<<<<<<< HEAD
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/ModificarUsuario.jsp");
=======
                    RequestDispatcher view = request.getRequestDispatcher("/ModificarUsuario.jsp");
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
                    view.forward(request, response);
                    break;
                }
                case "2": {

                    String[] infoUsuario = ICU.infoUsuario(nick, password);

                    request.setAttribute("nombre", infoUsuario[0]);
                    request.setAttribute("apellido", infoUsuario[1]);
                    request.setAttribute("fecha", infoUsuario[2]);
                    request.setAttribute("password", infoUsuario[3]);
                    request.setAttribute("biografia", infoUsuario[4]);
                    request.setAttribute("URL", infoUsuario[5]);
                    request.setAttribute("descripcion", infoUsuario[6]);
                    sesion.setAttribute("tipoUsuario", 2);
<<<<<<< HEAD
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Usuario/ModificarUsuario.jsp");
=======
                    RequestDispatcher view = request.getRequestDispatcher("/ModificarUsuario.jsp");
>>>>>>> 8f48392469a0c346ee448012d5b492895254a5cd
                    view.forward(request, response);
                    break;
                }
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
