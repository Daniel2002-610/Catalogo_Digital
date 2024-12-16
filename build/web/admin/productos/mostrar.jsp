<%-- 
    Document   : mostrar
    Created on : 12/12/2024, 03:46:05
    Author     : DANIELS SYSTEMS
--%>


<%@page import="java.util.Iterator"%>
<%@page import="modelo.productos"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.productosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">

    </head>
    <body>
        <jsp:include page="../../assets/extras/nav.jsp" />
        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {
        %>

        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <%= mensaje%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
        %>

     
        <div class="tabla-madre">
              <h1>Productos</h1>
            <form  class="row g-3 align-items-center" >
                <div class="col-auto d-flex align-items-center">
                    <input type="text" class="form-control mb-3" placeholder="Busqueda" id="txtBusqueda" name="txtBusqueda"> 
                </div> 
                <div class="col-auto d-flex align-items-center">
                    <button type="button" class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#guardarProductosModal">Agregar</button>
                </div> 
            </form>
            <div class="table-responsive">
                <table class="table table-striped" id="tablaProductos">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Titulo</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Foto</th>                   
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>

                    <%
                        productosDAO dao = new productosDAO();
                        List<productos> list = dao.mostrar();
                        Iterator<productos> iter = list.iterator();
                        productos pro = null;
                        while (iter.hasNext()) {
                            pro = iter.next();

                    %>
                    <tbody>
                        <tr>
                            <td><%=pro.getId()%></td>
                            <td><%=pro.getTitulo()%></td>
                            <td><%=pro.getDescripcion()%></td>
                            <td><%=pro.getPrecio()%></td>
                            <td>
                                <!-- Mostramos la imagen con la URL que fue guardada en la base de datos -->
                                <img src="<%= pro.getFoto()%>" alt="Miniatura de producto" width="50" height="50" />
                            </td>
                            <td>


                                <button type="button" class="btn btn-warning" 
                                        data-bs-toggle="modal" data-bs-target="#editarProductosModal" 
                                        data-id="<%=pro.getId()%>" 
                                        data-titulo="<%=pro.getTitulo()%>" 
                                        data-descripcion="<%=pro.getDescripcion()%>" 
                                        data-precio="<%=pro.getPrecio()%>"
                                        data-foto="<%=pro.getFoto()%>"
                                        >

                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                    <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
                                    </svg>
                                </button>

                                <button type="button" class="btn btn-danger" 
                                        onclick="showConfirmDelete(<%=pro.getId()%>)">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                                    </svg>
                                </button>
                            </td>

                        </tr>
                        <%}%>
                    </tbody>

                </table>
            </div>

        </div>
        <jsp:include page="guardarProductos.jsp" />
        <jsp:include page="editarProductos.jsp" />

        <div id="confirmDeleteMessage" class="confirm-delete">
            <h5>Confirmar Eliminación</h5>
            <p>¿Estás seguro de que deseas eliminar este producto?</p>
            <button type="button" class="btn btn-danger" onclick="deleteRecord()">Eliminar</button>
            <button type="button" class="btn btn-secondary" onclick="closeConfirmDelete()">Cancelar</button>
        </div>
        <script>

            let recordIdToDelete = null;

            function showConfirmDelete(id) {
                recordIdToDelete = id;
                document.getElementById('confirmDeleteMessage').style.display = 'block';
            }

            function closeConfirmDelete() {
                document.getElementById('confirmDeleteMessage').style.display = 'none';
            }

            function deleteRecord() {
                if (recordIdToDelete) {
                    // Redirigir al controlador para eliminar
                    const form = document.createElement('form');
                    form.method = 'POST';
                    form.action = 'cProductos';

                    const hiddenField = document.createElement('input');
                    hiddenField.type = 'hidden';
                    hiddenField.name = 'id';
                    hiddenField.value = recordIdToDelete;

                    const actionField = document.createElement('input');
                    actionField.type = 'hidden';
                    actionField.name = 'accion';
                    actionField.value = 'Eliminar';

                    form.appendChild(hiddenField);
                    form.appendChild(actionField);
                    document.body.appendChild(form);
                    form.submit();
                }
            }

            // Función para cerrar la alerta automáticamente
            window.onload = function () {
                const alert = document.querySelector('.alert');
                if (alert) {
                    setTimeout(() => {
                        alert.classList.remove('show');
                        alert.classList.add('fade');
                        alert.style.display = 'none';
                    }, 2000); // 500 milisegundos
                }
            };

            function filterTable() {
                const busqueda = document.getElementById('txtBusqueda').value.toLowerCase();
                const table = document.querySelector('#tablaProductos');
                const rows = table.getElementsByTagName('tr');

                // Recorremos todas las filas, empezando desde la segunda fila (índice 1) porque la primera es el encabezado.
                for (let i = 1; i < rows.length; i++) {
                    const cells = rows[i].getElementsByTagName('td');
                    let showRow = true;

                    // Comprobamos si la búsqueda no es vacía y si la búsqueda no se encuentra en las celdas de las columnas que deseas filtrar.
                    // Puedes agregar más columnas si lo necesitas.
                    if (busqueda) {
                        if (cells[1] && cells[1].textContent.toLowerCase().indexOf(busqueda) === -1 &&
                                cells[2] && cells[2].textContent.toLowerCase().indexOf(busqueda) === -1) {
                            showRow = false;
                        }
                    }

                    // Mostramos u ocultamos la fila dependiendo de si se encontró un resultado.
                    rows[i].style.display = showRow ? '' : 'none';
                }
            }

// Asociamos el evento de "keyup" al input de búsqueda para filtrar la tabla cuando el usuario teclee.
            document.getElementById('txtBusqueda').addEventListener('keyup', filterTable);


            ///2------------
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
