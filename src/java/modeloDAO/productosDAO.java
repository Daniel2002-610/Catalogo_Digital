/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import config.conexion;
import interfaces.crudProductos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.productos;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class productosDAO implements crudProductos{

       conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    productos pro = new productos();
    @Override
    public List mostrar() {
        ArrayList<productos> list = new ArrayList();

        String sql = "SELECT * FROM productos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                productos pro = new productos();
                pro.setId(rs.getInt("id"));
                pro.setTitulo(rs.getString("titulo"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setPrecio(rs.getString("precio"));
                pro.setFoto(rs.getString("foto"));          
                list.add(pro);
            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(productos pro) {
         String sql = "INSERT INTO productos (titulo,descripcion,precio,foto) VALUES (?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getTitulo());
            ps.setString(2, pro.getDescripcion());
            ps.setString(3, pro.getPrecio());
            ps.setString(4, pro.getFoto());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(productos pro) {
        String sql = "UPDATE productos SET titulo = ?, descripcion=?, precio = ?, foto = ? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getTitulo());
            ps.setString(2, pro.getDescripcion());
            ps.setString(3, pro.getPrecio());
            ps.setString(4, pro.getFoto());
            ps.setInt(5, pro.getId());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "DELETE FROM productos WHERE id = ?";
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
    
}
