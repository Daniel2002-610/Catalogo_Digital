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
import modelo.usuarios;
import modeloDAO.usuariosDAO;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cUsuarios extends HttpServlet {

    int id;
    usuariosDAO usuDAO = new usuariosDAO();
    usuarios usu = new usuarios();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
        if (action.equalsIgnoreCase("mostrar")) {
            acceso = "admin/usuarios/mostrarUsuarios.jsp";
        } else if (action.equalsIgnoreCase("Agregar")) {
            String usuario = request.getParameter("txtUsuario");
            String clave = request.getParameter("txtClave");

            usu.setUsuario(usuario);
            usu.setClave(clave);
            usu.setEstado("ACTIVO");
            usuDAO.guardar(usu);

            request.setAttribute("mensaje", "Datos guardados exitosamente.");
          acceso = "admin/usuarios/mostrarUsuarios.jsp";

        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtId"));
             String usuario = request.getParameter("txtUsuario");
            String clave = request.getParameter("txtClave");
            String estado = request.getParameter("txtEstado");

            usu.setUsuario(usuario);
            usu.setClave(clave);
            usu.setEstado(estado);
            usu.setId(id);
            usuDAO.editar(usu);
            request.setAttribute("mensaje", "Datos actualizados exitosamente.");
              acceso = "admin/usuarios/mostrarUsuarios.jsp";
        } 
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
