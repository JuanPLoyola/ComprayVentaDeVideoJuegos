package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.beans.Roles;

import java.sql.*;
import java.util.ArrayList;

public class UsuarioCuentasDaos extends DaoBase{


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

                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cuentas;
    }

    public void actualizar(Cuentas cuentas) {

        String sql = "UPDATE cuenta SET descripcion = ?,direccion = ?,correo = ? WHERE idCuenta = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, cuentas.getDescripcion());
            pstmt.setString(2, cuentas.getDireccion());
            pstmt.setString(3,cuentas.getCorreo());
            //pstmt.setString(4,cuentas.getPasswordHashed());
            pstmt.setInt(4, cuentas.getIdCuentas());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Cuentas olvidarContrasena(String nickname, String correo) {
        Cuentas cuentas = null;

        String sql = "select * from cuenta where nickname = ? and correo = ? ;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, nickname);
            pstmt.setString(2, correo);
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

                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cuentas;
    }

    public Cuentas correo(String correo) {
        Cuentas cuentas = null;


        String sql = "select correo , nombre, apellido from cuenta \n" +
                "where correo= ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, correo);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    cuentas = new Cuentas();
                    cuentas.setCorreo(rs.getString(1));
                    cuentas.setNombre(rs.getString(2));
                    cuentas.setApellido(rs.getString(3));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cuentas;
    }

    public void actualizarContrasena(String correo) {

        String sql = "update cuenta set passwordHashed = sha2('123@asdASD',256)where correo = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1,correo);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Cuentas validateUsernameAndPassword(String correo, String password) {

        Cuentas cuentas = null;

        String sql = "SELECT * FROM cuenta \n" +
                "where correo = ? and passwordHashed = sha2(?,256) and desabilitado = \"0\";";

        try (Connection connection = getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, correo);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    cuentas = obtenerCuentas(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cuentas;
    }

    public Cuentas obtenerCuentas(int idCuenta) {

        Cuentas cuentas = null;

        String sql = "select * from cuenta c\n" +
                "inner join rol r on c.idRol = r.idRol\n" +
                "where c.idCuenta = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idCuenta);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    cuentas = new Cuentas();
                    fetchUsuarioData(cuentas, rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return cuentas;
    }

    private void fetchUsuarioData(Cuentas cuentas, ResultSet rs) throws SQLException {

        cuentas.setIdCuentas(rs.getInt(1));
        cuentas.setNombre(rs.getString(2));
        cuentas.setApellido(rs.getString(3));
        cuentas.setNickname(rs.getString(4));
        cuentas.setDireccion(rs.getString(5));
        cuentas.setCorreo(rs.getString(6));
        cuentas.setFoto(rs.getString(7));
        cuentas.setDescripcion(rs.getString(8));
        cuentas.setDesabilitado(rs.getBoolean(9));
        cuentas.setIdRol(rs.getInt(10));
        cuentas.setPasswordHashed(rs.getString(11));

        Roles roles = new Roles();
        roles.setIdRol(rs.getInt(12));
        roles.setRol(rs.getString(13));
        cuentas.setRoles(roles);

    }

    public void guardarUsuario (Cuentas cuentas) throws SQLException{

        String sql = "insert INTO cuenta (nombre,apellido,nickname,direccion,correo,desabilitado,idRol,passwordHashed)\n" +
                "values (?,?,?,?,?,0,3,SHA2(?, 256));";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            setUsuarioParams(pstmt, cuentas);
            pstmt.executeUpdate();
        }

    }

    public void validarCuenta (String correo) throws SQLException{
        String sql = "UPDATE cuenta SET desabilitado = '0'\n" +
                "WHERE correo = '?'";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.executeUpdate();
        }

    }

    private void setUsuarioParams (PreparedStatement pstmt, Cuentas cuentas) throws SQLException{

        pstmt.setString(1,cuentas.getNombre());
        pstmt.setString(2,cuentas.getApellido());
        pstmt.setString(3,cuentas.getNickname());
        pstmt.setString(4,cuentas.getDireccion());
        pstmt.setString(5,cuentas.getCorreo());
        pstmt.setString(6,cuentas.getPasswordHashed());
        //pstmt.setInt(7,usuarios.getIdEstatus());

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

    public void actualizarLatLong(int idCuenta,double longitud , double latitud) {

        String sql = "update cuenta set latitud = ?,longitud=? where idCuenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setDouble(1, latitud);
            pstmt.setDouble(2, longitud);
            pstmt.setInt(3, idCuenta);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // TODO: este se usa para correo
    // TODO: este se usa para correo
    public Cuentas correo2(String id) {
        Cuentas cuentas = null;


        String sql = "select correo , nombre, apellido from cuenta \n" +
                "where idCuenta= ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    cuentas = new Cuentas();
                    cuentas.setCorreo(rs.getString(1));
                    cuentas.setNombre(rs.getString(2));
                    cuentas.setApellido(rs.getString(3));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cuentas;
    }
    public Cuentas validarCambioPassword(int idCuenta, String password){
        String sql = "select * from cuenta where idCuenta = ? and passwordHashed = sha2(?, 256)";
        Cuentas cuentas = null;
        try(Connection conn = this.getConection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

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


    public Cuentas lista1(){
        Cuentas cuentas = null;

        String sql = "SELECT idAdmin, COUNT(*) AS count\n" +
                "FROM comprausuario\n " +
                "GROUP BY idAdmin\n " +
                "ORDER BY count ASC\n " +
                "LIMIT 1";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                cuentas = new Cuentas();
                cuentas.setIdCuentas(rs.getInt(1));
                return cuentas;
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cuentas;
    }
}

