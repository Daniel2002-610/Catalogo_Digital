<%-- 
    Document   : editarUsuarios
    Created on : 15/12/2024, 04:06:21
    Author     : DANIELS SYSTEMS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


    </head>
    <body>
        <div class="modal fade" id="editarUsuariosModal" tabindex="-1" aria-labelledby="editarUsuariosModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarUsuariosModalLabel">Editar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formEditar" action="cUsuarios" method="post">

                            <input type="hidden" class="form-control" name="txtId"  >                          
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="txtUsuario" required>
                            <label>Clave</label>
                            <input type="text" class="form-control" name="txtClave" required>
                           <label>Estado</label>
                            <select class="form-select "  name='txtEstado' >
                                <option value="ACTIVO">ACTIVO</option>
                                <option value="INACTIVO">INACTVO</option>
                            </select>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" form="formEditar" class="btn btn-warning" name="accion" value="Actualizar">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const editarUsuariosModal = document.getElementById('editarUsuariosModal');
            editarUsuariosModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // Botón que activó el modal
                const id = button.getAttribute('data-id');
                const usuario = button.getAttribute('data-usuario');
                const clave = button.getAttribute('data-clave');
                const estado = button.getAttribute('data-estado');


                // Rellenar los campos del formulario en el modal
                const modalForm = editarUsuariosModal.querySelector('form');
                modalForm.querySelector('input[name="txtId"]').value = id;
                modalForm.querySelector('input[name="txtUsuario"]').value = usuario;
                modalForm.querySelector('input[name="txtClave"]').value = clave;
                modalForm.querySelector('select[name="txtEstado"]').value = estado;
            });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>

