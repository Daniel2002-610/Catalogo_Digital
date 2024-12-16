<%-- 
    Document   : editarProductos
    Created on : 12/12/2024, 04:47:57
    Author     : DANIELS SYSTEMS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


    </head>
    <body>
        <!-- editar.jsp -->
        <div class="modal fade" id="editarProductosModal" tabindex="-1" aria-labelledby="editarProductosModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editarProductosModalLabel">Editar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formEditar" action="cProductos" method="post">
                            <input type="hidden" name="txtId" value="">                  
                            <label>Titulo</label>
                            <input type="text" name="txtTitulo" class="form-control" required>
                            <label>Descripcion</label>
                            <input type="text" name="txtDescripcion" class="form-control" required>
                            <label>Precio</label>
                            <input type="text" name="txtPrecio" class="form-control" required>
                            <label>Foto</label>
                            <input type="text" name="txtFoto" class="form-control" required> 
                                              
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" form="formEditar" class="btn btn-warning" name="accion" value="Actualizar">Actualizar</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const editarProductosModal = document.getElementById('editarProductosModal');
            editarProductosModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // Botón que activó el modal
                const id = button.getAttribute('data-id');
                const titulo = button.getAttribute('data-titulo');
                const descripcion = button.getAttribute('data-descripcion');
                const precio = button.getAttribute('data-precio');
                const foto = button.getAttribute('data-foto');
                console.log(titulo);
                console.log(foto);


                // Rellenar los campos del formulario en el modal
                const modalForm = editarProductosModal.querySelector('form');
                modalForm.querySelector('input[name="txtId"]').value = id;
                modalForm.querySelector('input[name="txtTitulo"]').value = titulo;
                modalForm.querySelector('input[name="txtDescripcion"]').value = descripcion;
                modalForm.querySelector('input[name="txtPrecio"]').value = precio;
                modalForm.querySelector('input[name="txtFoto"]').value = foto;
            });


        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
