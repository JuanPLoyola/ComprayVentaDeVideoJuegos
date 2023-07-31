package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.Cuentas;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminCuentasDaos extends DaoBase{

    /* ------------------------------- CUENTAS ----------------------- */



    public Cuentas listar(int id) {
        Cuentas cuentas = null;


        String sql = "select * from cuenta where idCuenta = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    cuentas = new Cuentas();
                    cuentas.setIdCuentas(rs.getInt(1));
                    cuentas.setNombre(rs.getString(2));
                    cuentas.setApellido(rs.getString(3));
                    cuentas.setNickname(rs.getString(4));
                    cuentas.setDireccion(rs.getString(5));
                    cuentas.setCorreo(rs.getString(6));
                    cuentas.setFoto(rs.getString(7));
                    cuentas.setDescripcion(rs.getString(8));
                    cuentas.setPasswordHashed(rs.getString(11));
                    cuentas.setLatitud(rs.getString(12));
                    cuentas.setLongitud(rs.getString(13));

                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cuentas;
    }


    public void actualizarPerfil(int idCuentas, String descripcion, String direccion) {

        String sql = "UPDATE cuenta SET descripcion = ?, direccion = ? WHERE idCuenta = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, descripcion);
            pstmt.setString(2, direccion);
            pstmt.setInt(3, idCuentas);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    public void actualizarFoto1(int idUsuario) {

        String sql = "update cuenta set foto = 'img/usuario/pokemon1.png' where idCuenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarFoto2(int idUsuario) {

        String sql = "update cuenta set foto = 'img/usuario/pokemon2.png' where idCuenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarFoto3(int idUsuario) {

        String sql = "update cuenta set foto = 'img/usuario/pokemon3.png' where idCuenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarFoto4(int idUsuario) {

        String sql = "update cuenta set foto = 'img/usuario/pokemon4.png' where idCuenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // --------------------------------------- CAMBIO DE CONTRASEÑA ---------------------------------------
    public Cuentas validarCambioPassword(int idCuenta, String password){
        String sql = "select * from cuenta where idCuenta = ? and passwordHashed = sha2(?, 256)";
        Cuentas cuentas = null;
        try(Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1, idCuenta);
            pstmt.setString(2, password);

            try(ResultSet rs = pstmt.executeQuery()){

                if (rs.next()){
                    cuentas = new Cuentas();
                    cuentas.setIdCuentas(rs.getInt(1));
                    cuentas.setCorreo(rs.getString(6));
                    cuentas.setPasswordHashed(rs.getString(11));
                }

            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return cuentas;
    }

    public void actualizarPassword(int idCuenta, String nuevaPassword){

        String sql = "update cuenta set passwordHashed = sha2(?, 256) where idCuenta = ?";

        try(Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1, nuevaPassword);
            pstmt.setInt(2, idCuenta);
            pstmt.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
