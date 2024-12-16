<%-- 
    Document   : navCliente
    Created on : 15/12/2024, 02:17:53
    Author     : DANIELS SYSTEMS
--%>

<style>
    /* Definir un color morado personalizado */
    .bg-morado {
        background-color: #414395; /* Color morado (puedes cambiar el código de color) */
    }
</style>



<ul class="nav w-100 justify-content-between bg-morado">
    <!-- Imagen alineada a la izquierda -->
    <li class="nav-item mt-2 mb-3 ms-2 me-2 d-flex align-items-center">
        <img src="assets/images/logob.png" alt="Logo" width="75px" class="img-fluid">
    </li>

    <!-- Formulario y botón alineado a la derecha -->
    <li class="nav-item mt-2 mb-3 ms-2 me-2 d-flex align-items-center">
        <form action="cLogin" method="post" class="d-inline">
            <input type="hidden" name="accion" value="ver">
            <button type="submit" class="btn btn-primary">Iniciar Sesion</button>
        </form>    
    </li>
</ul>


