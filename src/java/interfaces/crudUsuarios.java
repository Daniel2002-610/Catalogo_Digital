/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.util.List;
import modelo.usuarios;

/**
 *
 * @author DANIELS SYSTEMS
 */
public interface crudUsuarios {
       
     public List mostrar();

    public boolean guardar(usuarios usu);

    public boolean editar(usuarios usu);
}
