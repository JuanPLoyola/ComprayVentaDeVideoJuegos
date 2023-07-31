package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.beans.Juegos;
import com.example.proyecto_iweb.models.dtos.EmpleadosTabla;
import com.example.proyecto_iweb.models.dtos.UsuarioTabla;
import com.example.proyecto_iweb.models.dtos.HistorialAdmin;

import java.sql.*;
import java.util.ArrayList;

public class ManagerCuentasDaos extends DaoBase{

    /* ------------------------------- DTOS ----------------------- */

    /* --------- dto:empeladostabla -------*/
    public ArrayList<EmpleadosTabla> listarEmpleadosTabla(){
        ArrayList<EmpleadosTabla> lista = new ArrayList<>();

        String sql = "SELECT\n" +
                "  c.idCuenta,\n" +
                "  CONCAT(c.nombre, \" \", c.apellido) AS \"Nombres\",\n" +
                "  co.cantidad AS \"Juegos vendidos\",\n" +
                "  v.juegos_comprados AS \"Juegos comprados\",\n" +
                "  co.precioCompra AS \"Dinero ganado\",\n" +
                "  v.dinero_gastado AS \"Dinero Gastado\",\n" +
                "  c.foto\n" +
                "FROM\n" +
                "  cuenta c\n" +
                "LEFT JOIN (\n" +
                "  SELECT idAdmin, SUM(cantidad) AS cantidad, SUM(precioCompra) AS precioCompra\n" +
                "  FROM comprausuario\n" +
                "  WHERE idEstados = \"7\"\n" +
                "  GROUP BY idAdmin\n" +
                ") co ON c.idCuenta = co.idAdmin\n" +
                "LEFT JOIN (\n" +
                "  SELECT idAdmin, COUNT(DISTINCT idVenta) AS juegos_comprados, SUM(precioVenta) AS dinero_gastado\n" +
                "  FROM ventausuario\n" +
                "  WHERE idEstados = \"2\"\n" +
                "  GROUP BY idAdmin\n" +
                ") v ON c.idCuenta = v.idAdmin\n" +
                "WHERE\n" +
                "  c.idRol = \"2\" AND c.desabilitado = \"0\"\n" +
                "ORDER BY\n" +
                "  co.precioCompra - v.dinero_gastado DESC;";

        try (Connection connection =this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql);) {

            while(resultSet.next() ){
                EmpleadosTabla empleadosTabla = new EmpleadosTabla();
                empleadosTabla.setIdCuenta(resultSet.getInt(1));
                empleadosTabla.setNombre(resultSet.getString(2));
                empleadosTabla.setJuegosVendidos(resultSet.getInt(3));
                empleadosTabla.setJuegosComprados(resultSet.getInt(4));
                empleadosTabla.setDineroGanado(resultSet.getDouble(5));
                empleadosTabla.setDineroGastado(resultSet.getDouble(6));
                empleadosTabla.setFoto(resultSet.getString(7));

                lista.add(empleadosTabla);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    /* --------- dto:usuariotabla --------*/
    public ArrayList<UsuarioTabla> listarUsuariosTabla(){
        ArrayList<UsuarioTabla> lista = new ArrayList<>();

        String sql = "SELECT\n" +
                "  c.idCuenta,\n" +
                "  CONCAT(c.nombre, \" \", c.apellido) AS \"Nombres\",\n" +
                "  co.juegos_comprados AS \"Juegos Comprados\",\n" +
                "  v.juegos_vendidos AS \"Juegos Vendidos\",\n" +
                "  co.dinero_gastado AS \"Dinero Gastado\",\n" +
                "  v.dinero_ganado AS \"Dinero Ganado\",\n" +
                "  c.desabilitado\n" +
                "FROM\n" +
                "  cuenta c\n" +
                "LEFT JOIN (\n" +
                "  SELECT idUsuario, SUM(cantidad) AS juegos_comprados, SUM(precioCompra) AS dinero_gastado\n" +
                "  FROM comprausuario\n" +
                "  WHERE idEstados = \"7\"\n" +
                "  GROUP BY idUsuario\n" +
                ") co ON c.idCuenta = co.idUsuario\n" +
                "LEFT JOIN (\n" +
                "  SELECT idUsuario, COUNT(DISTINCT idVenta) AS juegos_vendidos, SUM(precioVenta) AS dinero_ganado\n" +
                "  FROM ventausuario\n" +
                "  WHERE idEstados = \"2\"\n" +
                "  GROUP BY idUsuario\n" +
                ") v ON c.idCuenta = v.idUsuario\n" +
                "WHERE\n" +
                "  c.idRol = \"3\"\n" +
                "GROUP BY\n" +
                "  c.idCuenta,\n" +
                "  c.nombre,\n" +
                "  c.apellido\n" +
                "ORDER BY\n" +
                "  co.juegos_comprados DESC;";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                UsuarioTabla usuarioTabla = new UsuarioTabla();
                usuarioTabla.setIdCuenta(resultSet.getInt(1));
                usuarioTabla.setNombre(resultSet.getString(2));
                usuarioTabla.setJuegosComprados(resultSet.getInt(3));
                usuarioTabla.setJuegosVendidos(resultSet.getInt(4));
                usuarioTabla.setDineroGastado(resultSet.getDouble(5));
                usuarioTabla.setDineroGanado(resultSet.getDouble(6));
                usuarioTabla.setDeshabilitado(resultSet.getInt(7));
                lista.add(usuarioTabla);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    /* -----------dto : historial Admin -------*/
    public ArrayList<HistorialAdmin> tablaHistorial(String id){
        ArrayList<HistorialAdmin> lista = new ArrayList<>();

        String sql = "select j. nombre, ve.precioVenta as \"Precio pagado\", j.precio as \"Precio de venta\" from ventausuario ve\n" +
                "inner join juego j on j.idJuego = ve.idJuego and ve.idEstados = 2\n" +
                "where ve.idAdmin = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    HistorialAdmin historialAdmin = new HistorialAdmin();
                    historialAdmin.setNombreJuego(rs.getString(1));
                    historialAdmin.setPrecioPagado(rs.getInt(2));
                    historialAdmin.setPrecioDeVenta(rs.getInt(3));
                    lista.add(historialAdmin);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    /* ----------------------------------------------------------- */

    public UsuarioTabla ListarRegistro(String id){
        UsuarioTabla usuarioTabla = null ;

        String sql = "SELECT\n" +
                "    c.idCuenta,\n" +
                "    CONCAT(c.nombre, \" \", c.apellido) AS \"Nombres\",\n" +
                "    SUM(DISTINCT co.cantidad) AS \"Juegos vendidos\",\n" +
                "    COUNT(DISTINCT v.idVenta) AS \"Juegos comprados\",\n" +
                "    SUM(DISTINCT co.precioCompra) AS \"Dinero ganado\",\n" +
                "    SUM(v.precioVenta) AS \"Dinero Gastado\",\n" +
                "    c.foto\n" +
                "FROM\n" +
                "    cuenta c\n" +
                "    LEFT JOIN ventausuario v ON (c.idCuenta = v.idAdmin OR c.idCuenta = v.idUsuario) AND v.idEstados = \"2\"\n" +
                "    LEFT JOIN comprausuario co ON (c.idCuenta = co.idAdmin OR c.idCuenta = co.idUsuario) AND co.idEstados = \"7\"\n" +
                "WHERE\n" +
                "    c.idCuenta = ?\n" +
                "GROUP BY\n" +
                "    c.idCuenta,\n" +
                "    c.nombre,\n" +
                "    c.apellido,\n" +
                "    c.foto;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuarioTabla = new UsuarioTabla();
                    usuarioTabla.setIdCuenta(rs.getInt(1));
                    usuarioTabla.setNombre(rs.getString(2));
                    usuarioTabla.setJuegosVendidos(rs.getInt(3));
                    usuarioTabla.setJuegosComprados(rs.getInt(4));
                    usuarioTabla.setDineroGanado(rs.getDouble(5));
                    usuarioTabla.setDineroGastado(rs.getDouble(6));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuarioTabla;
    }


    /* ------------ botones de banear/despedir ------- */

    public void deshabilitarCuenta(String id) {

        String sql = "UPDATE cuenta SET desabilitado = 1 WHERE idCuenta = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void habilitarCuenta(String id) {

        String sql = "UPDATE cuenta SET desabilitado = 0 WHERE idCuenta = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /*------------------------------------------------*/

    /* ---------------- Perfil -----------------------*/
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
                    cuentas.setIdRol(rs.getInt(10));
                    cuentas.setPasswordHashed(rs.getString(11));

                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cuentas;
    }

    // TODO: este se usa para correo
    public Cuentas correo(String id) {
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
    //------------- actualizar las fotos -----------------------
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
    //-------------------------------------------------------

    //------------- actualizar los datos-----------------------
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

    // ---------------- buscar usuario------------------------

    public ArrayList<UsuarioTabla> buscarPorTitle(String title) {
        ArrayList<UsuarioTabla> lista = new ArrayList<>();


        String sql = "SELECT\n" +
                "  c.idCuenta,\n" +
                "  CONCAT(c.nombre, \" \", c.apellido) AS \"Nombres\",\n" +
                "  co.juegos_comprados AS \"Juegos Comprados\",\n" +
                "  v.juegos_vendidos AS \"Juegos Vendidos\",\n" +
                "  co.dinero_gastado AS \"Dinero Gastado\",\n" +
                "  v.dinero_ganado AS \"Dinero Ganado\",\n" +
                "  c.desabilitado\n" +
                "FROM\n" +
                "  cuenta c\n" +
                "LEFT JOIN (\n" +
                "  SELECT idUsuario, SUM(cantidad) AS juegos_comprados, SUM(precioCompra) AS dinero_gastado\n" +
                "  FROM comprausuario\n" +
                "  WHERE idEstados = \"7\"\n" +
                "  GROUP BY idUsuario\n" +
                ") co ON c.idCuenta = co.idUsuario\n" +
                "LEFT JOIN (\n" +
                "  SELECT idUsuario, COUNT(DISTINCT idVenta) AS juegos_vendidos, SUM(precioVenta) AS dinero_ganado\n" +
                "  FROM ventausuario\n" +
                "  WHERE idEstados = \"2\"\n" +
                "  GROUP BY idUsuario\n" +
                ") v ON c.idCuenta = v.idUsuario\n" +
                "WHERE\n" +
                "  c.idRol = \"3\"\n" +
                "  and c.nombre like ? or c.apellido like ?\n" +
                "GROUP BY\n" +
                "  c.idCuenta,\n" +
                "  c.nombre,\n" +
                "  c.apellido\n" +
                "ORDER BY\n" +
                "  co.juegos_comprados DESC;";
        try (Connection connection = this.getConection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, "%" + title + "%");
            preparedStatement.setString(2, "%" + title + "%");

            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    UsuarioTabla usuarioTabla = new UsuarioTabla();
                    usuarioTabla.setIdCuenta(resultSet.getInt(1));
                    usuarioTabla.setNombre(resultSet.getString(2));
                    usuarioTabla.setJuegosComprados(resultSet.getInt(3));
                    usuarioTabla.setJuegosVendidos(resultSet.getInt(4));
                    usuarioTabla.setDineroGastado(resultSet.getDouble(5));
                    usuarioTabla.setDineroGanado(resultSet.getDouble(6));
                    usuarioTabla.setDeshabilitado(resultSet.getInt(7));
                    lista.add(usuarioTabla);
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
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

    //todo: Si se banea a un admin pasan su cola de compras a otro, y sus ventas
    public void actualizarBaneoCompras (int idAdminNuevo ,int idAdminViejo){
        String sql = "update comprausuario set idAdmin = ? \n" +
                "where idAdmin = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idAdminNuevo);
            pstmt.setInt(2, idAdminViejo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarBaneoVentas (int idAdminNuevo,int idAdminViejo){
        String sql = "update ventausuario set idAdmin = ? \n" +
                "where idAdmin = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idAdminNuevo);
            pstmt.setInt(2, idAdminViejo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}