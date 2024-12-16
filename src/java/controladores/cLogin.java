/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import modelo.usuarios;
import modeloDAO.usuariosDAO;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cLogin extends HttpServlet {

    usuariosDAO usuDAO = new usuariosDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("Ingresar")) {
            String fUsuario = request.getParameter("txtUsuario");
            String fClave = request.getParameter("txtPass");
            String con = "NO";
            List<usuarios> var = usuDAO.mostrar();

            for (int i = 0; i < var.size(); i++) {
                String usuario = var.get(i).getUsuario();
                String clave = var.get(i).getClave();
                String estado = var.get(i).getEstado();
                if (fUsuario.equals(usuario) && fClave.equals(clave) && estado.equals("ACTIVO")) {
                    con = "SI";
                    
                    usuarios vusu = new usuarios();
                    vusu.setUsuario(usuario);
                    HttpSession session = request.getSession();
                    session.setAttribute("nUsuario", vusu); // Usa la misma clave "buscar"
                    acceso = "admin/productos/mostrar.jsp";
                    break;
                }

                if (con.equals("NO")) {
                    request.setAttribute("mensaje", "Usuario o Contraseña incorrectos");
                }
            }

        } else if (action.equalsIgnoreCase("logout")) {
            HttpSession session = request.getSession(false); // false para no crear una nueva sesión si no existe

            if (session != null) {
                session.invalidate(); // Invalidar la sesión
            }
            acceso = "index.jsp";
        }
        else if (action.equalsIgnoreCase("Ver")) {
            acceso = "admin/login.jsp";
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
