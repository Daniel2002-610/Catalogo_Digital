/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.productos;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudProductos {
 
    
    public List mostrar();

    public boolean guardar(productos pro);

    public boolean editar(productos pro);
    
    public boolean eliminar(int id);
    
    
}
