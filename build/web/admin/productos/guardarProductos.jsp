<%-- 
    Document   : guardarProductos
    Created on : 12/12/2024, 04:09:33
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

        <div class="modal fade" id="guardarProductosModal" tabindex="-1" aria-labelledby="guardarProductosModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="guardarProductosModalLabel">Agregar Datos</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="formGuardar" action="cProductos" method="post">
                            <label>Titutlo</label>
                            <input type="text" class="form-control"  placeholder="Titulo" name="txtTitulo">
                            <label>Descripcion</label>
                            <input type="text" class="form-control"  placeholder="Descripcion" name="txtDescripcion">
                            <label>Precio</label>
                            <input type="text" class="form-control"  placeholder="Precio" name="txtPrecio">
                            <label>Foto (Imgur)</label>
                            <input type="text" class="form-control"  placeholder="Foto" name="txtFoto">                        
                        </form>
                    </div>
                    <div class="modal-footer">              
                        <button type="submit" form="formGuardar" class="btn btn-success" name="accion" value="Guardar">Guardar</button>

                    </div>
                </div>
            </div>
        </div>


       
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
