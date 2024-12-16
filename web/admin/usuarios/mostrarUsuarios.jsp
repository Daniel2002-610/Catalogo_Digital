<%-- 
    Document   : mostrarUsuarios
    Created on : 15/12/2024, 03:49:27
    Author     : DANIELS SYSTEMS
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.usuarios"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.usuariosDAO"%>
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
            <h1>Usuarios</h1>
            <form  class="row g-3 align-items-center" >
                <div class="col-auto d-flex align-items-center">
                    <input type="text" class="form-control mb-3" placeholder="Busqueda" id="txtBusqueda" name="txtBusqueda"> 
                </div> 
                <div class="col-auto d-flex align-items-center">
                    <button type="button" class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#GuardarUsuariosModal">Agregar</button>
                </div> 
            </form>
            <div class="table-responsive">
                <table class="table table-striped" id="tableUsuarios">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Clave</th>
                            <th scope="col">Estado</th>                
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>

                    <%
                        usuariosDAO dao = new usuariosDAO();
                        List<usuarios> list = dao.mostrar();
                        Iterator<usuarios> iter = list.iterator();
                        usuarios usu = null;
                        while (iter.hasNext()) {
                            usu = iter.next();

                    %>
                    <tbody>
                        <tr>
                            <td><%=usu.getId()%></td>
                            <td><%=usu.getUsuario()%></td>
                            <td><%=usu.getClave()%></td>
                            <td>
                                <span class="<%= usu.getEstado().equalsIgnoreCase("INACTIVO") ? "text-white bg-danger" : "text-white bg-success"%> p-2 rounded">
                                    <%= usu.getEstado()%>
                                </span>
                            </td>

                            <td>
                                <button type="button" class="btn btn-warning" 
                                        data-bs-toggle="modal" data-bs-target="#editarUsuariosModal" 
                                        data-id="<%=usu.getId()%>" 
                                        data-usuario="<%=usu.getUsuario()%>" 
                                        data-clave="<%=usu.getClave()%>" 
                                        data-estado="<%=usu.getEstado()%>"                                    
                                        >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                    <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
                                    </svg>
                                </button>                                
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>

        <jsp:include page="guardarUsuarios.jsp" />
        <jsp:include page="editarUsuarios.jsp" />

        <div id="confirmDeleteMessage" class="confirm-delete">
            <h5>Confirmar Eliminación</h5>
            <p>¿Estás seguro de que deseas eliminar este producto?</p>
            <button type="button" class="btn btn-danger" onclick="deleteRecord()">Eliminar</button>
            <button type="button" class="btn btn-secondary" onclick="closeConfirmDelete()">Cancelar</button>
        </div>
        <script>


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
                const codigoFilter = document.getElementById('txtBusqueda').value.toLowerCase().trim();

                const table = document.querySelector('#tableUsuarios');
                const rows = table.getElementsByTagName('tr');

                for (let i = 1; i < rows.length; i++) { // Empieza en 1 para omitir el encabezado
                    const cells = rows[i].getElementsByTagName('td');
                    let showRow = true;

                    if (codigoFilter) { // Solo se hace el filtrado si hay algo en el filtro
                        // Verifica si las celdas en la columna 1 o 2 contienen el texto de búsqueda
                        const cell1 = cells[1] ? cells[1].textContent.toLowerCase() : '';


                        // Si no coincide con ninguna de las celdas, oculta la fila
                        if (cell1.indexOf(codigoFilter) === -1) {
                            showRow = false;
                        }
                    }

                    rows[i].style.display = showRow ? '' : 'none';
                }
            }

// Evento para escuchar cuando el usuario escriba en el campo de búsqueda
            document.getElementById('txtBusqueda').addEventListener('keyup', filterTable);


            ///2------------
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
