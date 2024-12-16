<%-- 
    Document   : newjsp
    Created on : 13/12/2024, 21:45:27
    Author     : DANIELS SYSTEMS
--%>


<style>
    /* Definir un color morado personalizado */
    .bg-morado {
        background-color: #414395; /* Color morado (puedes cambiar el código de color) */
    }
</style>

<ul class="nav w-100 bg-morado d-flex justify-content-between align-items-center">
    <!-- Imagen alineada a la izquierda -->
    <li class="nav-item mt-2 mb-3 ms-2 me-2 d-flex align-items-center">
        <img src="assets/images/logob.png" alt="Logo" width="75px" class="img-fluid">
    </li>

    <!-- Contenedor para los botones alineados a la derecha -->
    <div class="d-flex ms-auto">
        <li class="nav-item mt-2 mb-3 ms-2 me-2 d-flex align-items-center">
            <form action="cUsuarios" method="post" class="d-inline">
                <input type="hidden" name="accion" value="mostrar">
                <button type="submit" class="btn btn-primary">Usuarios</button>
            </form>    
        </li>

        <li class="nav-item mt-2 mb-3 ms-2 me-2 d-flex align-items-center">
            <form action="cProductos" method="post" class="d-inline">
                <input type="hidden" name="accion" value="mostrar">
                <button type="submit" class="btn btn-primary">Productos</button>
            </form>    
        </li>

        <li class="nav-item mt-2 mb-3 ms-2 me-2 d-flex align-items-center">
            <form action="cLogin" method="post" class="d-inline">
                <input type="hidden" name="accion" value="logout">
                <button type="submit" class="btn btn-danger">Salir</button>
            </form>
        </li>
    </div>
</ul>



