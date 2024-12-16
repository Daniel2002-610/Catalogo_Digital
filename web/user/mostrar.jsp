<%-- 
    Document   : mostrar
    Created on : 13/12/2024, 22:44:51
    Author     : DANIELS SYSTEMS
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.productos"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.productosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Galeria</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <jsp:include page="../assets/extras/navCliente.jsp" />
        <div class="container">
            <div>
                <p class="titulo1">Catálogo Digital</p>
                <p class="parrafo1">Explora nuestro catálogo digital y descubre una amplia gama de productos disponibles en nuestra tienda física.</p>
            </div>
            <div  class="row g-3 align-items-center">
                <div class="col-auto d-flex align-items-center">
                    <input type="text" class="form-control mb-3" placeholder="Buscar" id="txtBusqueda" name="txtBusqueda"> 
                </div> 
            </div>

            <div class="row">
                <!-- Se repiten 6 veces los div-externo para mostrar el comportamiento -->
                <%
                    productosDAO dao = new productosDAO();
                    List<productos> list = dao.mostrar();
                    Iterator<productos> iter = list.iterator();
                    productos pro = null;
                    while (iter.hasNext()) {
                        pro = iter.next();

                %>
                <div class="col-12 col-md-2 div-externo">
                    <div class="div-interno">
                        <img  src="<%= pro.getFoto()%>"  alt="Imagen de prueba" class="imagen">
                    </div>
                    <div class="div-interno2">
                        <p class="titulo" id="txtTitulo"><%=pro.getTitulo()%></p>
                        <p class="precio" id="txtPrecio">Q. <%=pro.getPrecio()%></p>
                        <p class="descripcion" id="txtDescripcion"><%=pro.getDescripcion()%></p>
                    </div>
                </div>
                <%}%>

                <!-- Más divs aquí si lo necesitas -->
            </div>
        </div>

        <script>
            document.getElementById('txtBusqueda').addEventListener('input', function () {
                var busqueda = this.value.toLowerCase();
                var productos = document.querySelectorAll('.div-externo');

                productos.forEach(function (producto) {
                    var titulo = producto.querySelector('#txtTitulo').textContent.toLowerCase();
                    var descripcion = producto.querySelector('#txtDescripcion').textContent.toLowerCase();

                    if (titulo.includes(busqueda) || descripcion.includes(busqueda)) {
                        producto.style.display = '';
                    } else {
                        producto.style.display = 'none';
                    }
                });
            });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
