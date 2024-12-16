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
import modelo.productos;
import modeloDAO.productosDAO;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class cProductos extends HttpServlet {

    productos pro = new productos();
    productosDAO proDAO = new productosDAO();
    int id;

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
            acceso = "admin/productos/mostrar.jsp";
        } else if (action.equalsIgnoreCase("Guardar")) {
            String titulo = request.getParameter("txtTitulo");
            String descripcion = request.getParameter("txtDescripcion");
            String precio = request.getParameter("txtPrecio");
            String foto = request.getParameter("txtFoto");

            String foto2 = convertirUrlImgur(foto);

            pro.setTitulo(titulo);
            pro.setDescripcion(descripcion);
            pro.setPrecio(precio);
            pro.setFoto(foto2); 
            proDAO.guardar(pro);

            request.setAttribute("mensaje", "Datos guardados exitosamente.");
            acceso = "admin/productos/mostrar.jsp";

        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtId"));
            String titulo = request.getParameter("txtTitulo");
            String descripcion = request.getParameter("txtDescripcion");
            String precio = request.getParameter("txtPrecio");
            String foto = request.getParameter("txtFoto");
            
            String foto2 =  convertirUrlImgur(foto);

            pro.setTitulo(titulo);
            pro.setDescripcion(descripcion);
            pro.setPrecio(precio);
            pro.setFoto(foto2);
            pro.setId(id);
            proDAO.editar(pro);
            request.setAttribute("mensaje", "Datos actualizados exitosamente.");
            acceso = "admin/productos/mostrar.jsp";
        } else if (action.equalsIgnoreCase("Eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            proDAO.eliminar(id);
            request.setAttribute("mensaje", "Datos elimandos exitosamente.");
            acceso = "admin/productos/mostrar.jsp";
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    public String convertirUrlImgur(String url) {
        // Verificamos si la URL empieza con 'https://imgur.com/'
        if (url != null && url.startsWith("https://imgur.com/")) {
            // Obtenemos el identificador de la imagen (parte después de 'https://imgur.com/')
            String imageId = url.substring("https://imgur.com/".length());
            // Devolvemos la URL directa de la imagen con la extensión '.jpg'
            return "https://i.imgur.com/" + imageId + ".jpg";
        }
        // Si no es una URL válida de Imgur, devolvemos la URL tal cual
        return url;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
