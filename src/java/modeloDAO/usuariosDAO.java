/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import config.conexion;
import config.encriptar;
import interfaces.crudUsuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.usuarios;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class usuariosDAO implements crudUsuarios{
     conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    usuarios usu = new usuarios();

    @Override
    public List mostrar() {
        ArrayList<usuarios> list = new ArrayList();
        encriptar encri = new encriptar();
        String sql = "SELECT * FROM usuarios";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuarios usu = new usuarios();
                usu.setId(rs.getInt("id"));
                usu.setUsuario(rs.getString("usuario"));
                String encryptedClave = rs.getString("clave");
                try {
                    String decryptedClave = encri.desencriptar(encryptedClave);
                    usu.setClave(decryptedClave);
                } catch (Exception e) {
                    e.printStackTrace(); // Manejar excepción
                }
                usu.setEstado(rs.getString("estado"));
                list.add(usu);

            }
        } catch (Exception e) {

        }

        return list;
    }

    @Override
    public boolean guardar(usuarios usu) {
        String sql = "INSERT INTO usuarios (usuario,clave,estado) VALUES (?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getUsuario());
            String encriptado = "";
            encriptar encri = new encriptar();
            try {
                encriptado = encri.encriptar(usu.getClave());
            } catch (Exception ex) {

            }
            ps.setString(2, encriptado);
            ps.setString(3, usu.getEstado());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }

    @Override
    public boolean editar(usuarios usu) {
        String sql = "UPDATE usuarios SET  usuario=?, clave=?, estado=? WHERE id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getUsuario());
            String encriptado = "";
            encriptar encri = new encriptar();
            try {
                encriptado = encri.encriptar(usu.getClave());
            } catch (Exception ex) {

            }
            ps.setString(2, encriptado);
            ps.setString(3, usu.getEstado());
            ps.setInt(4, usu.getId());

            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.toString());
            return false;
        }
    }
    
}
