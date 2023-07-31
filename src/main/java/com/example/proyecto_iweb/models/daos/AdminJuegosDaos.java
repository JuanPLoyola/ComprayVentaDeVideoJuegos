package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.*;
import com.example.proyecto_iweb.models.dtos.*;

import java.io.InputStream;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class AdminJuegosDaos  extends DaoBase{
    /** SECCIÓN DE ROMMEL **/
    /** Juegos disponibles **/
    /** Listar todos los juegos (View: Index principal del Admin) **/

    public ArrayList<Juegos> buscarPorTitle(String title) {
        ArrayList<Juegos> lista = new ArrayList<>();


        String sql = "select * from juego where nombre like ?";
        try (Connection connection = this.getConection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, "%" + title + "%");

            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(resultSet.getInt(1));
                    juegos.setNombre(resultSet.getString(2));
                    juegos.setDescripcion(resultSet.getString(3));
                    juegos.setPrecio(resultSet.getDouble(4));
                    juegos.setDescuento(resultSet.getDouble(5));
                    juegos.setStock(resultSet.getInt(11));
                    juegos.setFoto(resultSet.getString(6));
                    juegos.setExistente(resultSet.getBoolean(7));
                    juegos.setHabilitado(resultSet.getBoolean(8));
                    juegos.setConsola(resultSet.getString(9));
                    juegos.setGenero(resultSet.getString(10));
                    lista.add(juegos);
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Juegos> listarJuegosDisponibles(){

        ArrayList<Juegos> lista = new ArrayList<>();
        String sql = "select * from juego where habilitado = 1";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                Juegos juegoDisponible = new Juegos();

                juegoDisponible.setIdJuegos(resultSet.getInt(1));
                juegoDisponible.setNombre(resultSet.getString(2));
                juegoDisponible.setDescripcion(resultSet.getString(3));
                juegoDisponible.setPrecio(resultSet.getFloat(4));
                juegoDisponible.setDescuento(resultSet.getInt(5));
                juegoDisponible.setFoto(resultSet.getString(6));
                juegoDisponible.setStock(resultSet.getInt("stock"));
                juegoDisponible.setFotoJuego(resultSet.getString("fotoJuego"));
                lista.add(juegoDisponible);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Consolas> consolas(){

        ArrayList<Consolas> lista = new ArrayList<>();
        String sql = "select distinct consola from juego";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                Consolas consolas = new Consolas();
                consolas.setNombre(resultSet.getString(1));
                lista.add(consolas);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Generos> generos(){

        ArrayList<Generos> lista = new ArrayList<>();
        String sql = "select distinct genero from juego";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Generos generos = new Generos();

                generos.setNombre(resultSet.getString(1));
                lista.add(generos);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public void crearJuego(String nombre, String descripcion, double precio, String consola, String genero, InputStream file, String idAdmin){

        String sql = "INSERT INTO juego (nombre,descripcion,precio,descuento,stock,consola,genero,fotoJuego,existente,habilitado,idAdmin) VALUES (?,?,?,'0','1',?,?,?,'1','1',?)";

        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, descripcion);
            pstmt.setDouble(3, precio);
            pstmt.setString(4, consola);
            pstmt.setString(5, genero);

            pstmt.setBlob(6, file);
            pstmt.setString(7, idAdmin);
            //pstmt.setBytes(7, foto);
            pstmt.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Juegos obtenerJuego(String idJuego) {

        Juegos juegos = null;
        String sql = "SELECT * FROM juego WHERE idJuego = ?";

        try {
            try (Connection conn = this.getConection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, idJuego);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        juegos = new Juegos();
                        juegos.setIdJuegos(rs.getInt(1));
                        juegos.setNombre(rs.getString(2));
                        juegos.setDescripcion(rs.getString(3));
                        juegos.setPrecio(rs.getDouble(4));
                        juegos.setDescuento(rs.getDouble(5));
                        juegos.setConsola(rs.getString(9));
                        juegos.setGenero(rs.getString(10));
                        juegos.setStock(rs.getInt(11));
                        juegos.setFotoJuego(rs.getString(12));
                        juegos.setIdAdminEncargado(rs.getInt(13));
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return juegos;
    }

    public void actualizarJuego(int idJuego, String nombre, String descripcion, double precio, String consola, String genero, int stock){
        String sql = "UPDATE juego SET nombre = ?,descripcion = ?,precio = ?, consola = ?, genero = ?, stock = ? WHERE idJuego = ?";
        try (Connection connection = this.getConection()){

            try (PreparedStatement pstmt = connection.prepareStatement(sql)){
                pstmt.setString(1, nombre);
                pstmt.setString(2, descripcion);
                pstmt.setDouble(3, precio);
                pstmt.setString(4, consola);
                pstmt.setString(5, genero);
                pstmt.setInt(6, stock);
                pstmt.setInt(7, idJuego);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarFotoJuego(int idJuego, InputStream file){
        String sql = "UPDATE juego SET fotoJuego = ? WHERE idJuego = ?";
        try (Connection connection = this.getConection()){
            try (PreparedStatement pstmt = connection.prepareStatement(sql)){
                pstmt.setBlob(1, file);
                pstmt.setInt(2, idJuego);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void desabilitarJuego(String id) {

        String sql = "UPDATE juego SET habilitado = 0 WHERE idJuego = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /** Reservas y comprados**/
    public ArrayList<CompraUsuario> compradosAndReservados(int idAdmin){

        ArrayList<CompraUsuario> lista = new ArrayList<>();

        String sql1 = "select * from comprausuario cu\n" +
                "left join estados e on cu.idEstados = e.idestados \n" +
                "left join cuenta c on cu.idUsuario = c.idCuenta\n" +
                "left join juego j on cu.idJuego = j.idJuego\n" +
                "where cu.idAdmin = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql1)) {


            pstmt.setInt(1, idAdmin);
            try(ResultSet resultSet = pstmt.executeQuery()){
                while(resultSet.next()){
                    CompraUsuario compraUsuario = new CompraUsuario();
                    compraUsuario.setIdCompra(resultSet.getInt(1));
                    compraUsuario.setIdUsuario(resultSet.getInt(2));
                    compraUsuario.setIdJuego(resultSet.getInt(3));
                    compraUsuario.setCantidad(resultSet.getInt(4));
                    compraUsuario.setFechaCompra(resultSet.getDate(5));
                    compraUsuario.setDireccion(resultSet.getString(6));
                    compraUsuario.setIdAdmin(resultSet.getInt(7));
                    compraUsuario.setPrecioCompra(resultSet.getInt(8));
                    compraUsuario.setIdEstados(resultSet.getInt(9));
                    compraUsuario.setFechaEntrega(resultSet.getDate(10));

                    Cuentas cuentas = new Cuentas();
                    cuentas.setIdCuentas(resultSet.getInt("c.idCuenta"));
                    cuentas.setNombre(resultSet.getString("c.nombre"));
                    cuentas.setApellido(resultSet.getString("c.apellido"));
                    compraUsuario.setUsuario(cuentas);

                    Estados estados = new Estados();
                    estados.setIdEstados(resultSet.getInt("e.idestados"));
                    estados.setEstados(resultSet.getString("e.nombreEstados"));
                    compraUsuario.setEstados(estados);

                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(resultSet.getInt("j.idJuego"));
                    juegos.setNombre(resultSet.getString("j.nombre"));
                    compraUsuario.setJuegos(juegos);

                    lista.add(compraUsuario);
                }
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }



    public CompraUsuario comprados(int idCompra) {
        CompraUsuario compraUsuario = null;
        String sql1 = "SELECT * FROM comprausuario cu\n" +
                "LEFT JOIN estados e ON cu.idEstados = e.idestados\n" +
                "LEFT JOIN cuenta c ON cu.idUsuario = c.idCuenta\n" +
                "LEFT JOIN juego j ON cu.idJuego = j.idJuego\n" +
                "WHERE cu.idCompra = ?";  // Agregar condición para el idVenta
        try (Connection connection = this.getConection();
             PreparedStatement stmt = connection.prepareStatement(sql1)) {
            stmt.setInt(1, idCompra);  // Establecer el valor del parámetro idCompra
            try (ResultSet resultSet = stmt.executeQuery()) {
                while (resultSet.next()) {
                    compraUsuario = new CompraUsuario();
                    compraUsuario.setIdCompra(resultSet.getInt(1));
                    compraUsuario.setIdUsuario(resultSet.getInt(2));
                    compraUsuario.setIdJuego(resultSet.getInt(3));
                    compraUsuario.setCantidad(resultSet.getInt(4));
                    compraUsuario.setFechaCompra(resultSet.getDate(5));
                    compraUsuario.setDireccion(resultSet.getString(6));
                    compraUsuario.setIdAdmin(resultSet.getInt(7));
                    compraUsuario.setPrecioCompra(resultSet.getInt(8));
                    compraUsuario.setIdEstados(resultSet.getInt(9));
                    compraUsuario.setFechaEntrega(resultSet.getDate(10));

                    Cuentas cuentas = new Cuentas();
                    cuentas.setIdCuentas(resultSet.getInt("c.idCuenta"));
                    cuentas.setNombre(resultSet.getString("c.nombre"));
                    cuentas.setApellido(resultSet.getString("c.apellido"));
                    cuentas.setFoto(resultSet.getString("c.foto"));
                    cuentas.setLatitud(resultSet.getString("c.latitud"));
                    cuentas.setLongitud(resultSet.getString("c.longitud"));
                    compraUsuario.setUsuario(cuentas);

                    Estados estados = new Estados();
                    estados.setIdEstados(resultSet.getInt("e.idestados"));
                    estados.setEstados(resultSet.getString("e.nombreEstados"));
                    compraUsuario.setEstados(estados);

                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(resultSet.getInt("j.idJuego"));
                    juegos.setNombre(resultSet.getString("j.nombre"));
                    juegos.setDescripcion(resultSet.getString("j.descripcion"));
                    juegos.setStock(resultSet.getInt("j.stock"));
                    compraUsuario.setJuegos(juegos);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return compraUsuario;
    }


    public ArrayList<VentaUsuario> juegosPropuestos(){

        ArrayList<VentaUsuario> lista = new ArrayList<>();
        String sql1 = "select * from ventausuario v \n" +
                "left join estados e on v.idEstados = e.idestados \n" +
                "left join cuenta c on v.idUsuario = c.idCuenta\n" +
                "left join juego j on v.idJuego = j.idJuego where e.idestados in (1, 3)";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql1)) {

            while(resultSet.next()){
                VentaUsuario ventaUsuario = new VentaUsuario();
                ventaUsuario.setIdVenta(resultSet.getInt(1));
                ventaUsuario.setIdUsuario(resultSet.getInt(2));
                ventaUsuario.setIdJuego(resultSet.getInt(3));
                ventaUsuario.setPrecioVenta(resultSet.getDouble(4));
                ventaUsuario.setMensajeAdmin(resultSet.getString(5));
                ventaUsuario.setIdEstados(resultSet.getInt(7));

                Cuentas cuentas = new Cuentas();
                cuentas.setIdCuentas(resultSet.getInt("c.idCuenta"));
                cuentas.setNombre(resultSet.getString("c.nombre"));
                ventaUsuario.setUsuario(cuentas);

                Estados estados = new Estados();
                estados.setIdEstados(resultSet.getInt("e.idestados"));
                estados.setEstados(resultSet.getString("e.nombreEstados"));
                ventaUsuario.setEstados(estados);

                Juegos juegos = new Juegos();
                juegos.setIdJuegos(resultSet.getInt("j.idJuego"));
                juegos.setNombre(resultSet.getString("j.nombre"));
                ventaUsuario.setJuegos(juegos);

                lista.add(ventaUsuario);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }


    /** Ofertas **/
    public ArrayList<Juegos> listarOfertas() {

        ArrayList<Juegos> ofertas = new ArrayList<>();
        String sql1 = "select * from juego where descuento != 0";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql1)) {

            while (resultSet.next()) {
                Juegos juegoOferta = new Juegos();

                juegoOferta.setIdJuegos(resultSet.getInt(1));
                juegoOferta.setNombre(resultSet.getString(2));
                juegoOferta.setPrecio(resultSet.getInt(4));
                juegoOferta.setDescuento(resultSet.getInt(5));

                juegoOferta.setFoto(resultSet.getString(6));
                juegoOferta.setStock(resultSet.getInt(11));
                ofertas.add(juegoOferta);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return ofertas;
    }

    public Juegos listarJuegoAdmin(String id) {
        Juegos juego = null;

        String sql = "select * from juego where idJuego = ?";
        try (Connection connection = this.getConection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, id);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    juego = new Juegos();
                    juego.setIdJuegos(rs.getInt(1));
                    juego.setNombre(rs.getString(2));
                    juego.setDescripcion(rs.getString(3));
                    juego.setPrecio(rs.getDouble(4));
                    juego.setDescuento(rs.getDouble(5));
                    juego.setFoto(rs.getString(6));
                    juego.setExistente(rs.getBoolean(7));
                    juego.setHabilitado(rs.getBoolean(8));
                    juego.setConsola(rs.getString(9));
                    juego.setGenero(rs.getString(10));
                    juego.setStock(rs.getInt(11));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return juego;
    }

    public void eliminarOferta(String id){

        String sql = "UPDATE juego SET descuento = 0 WHERE idJuego = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void ofertarJuego(int id, double descuento){

        String sql = "UPDATE juego SET descuento = ? WHERE idJuego = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, String.valueOf(descuento));
            pstmt.setString(2, String.valueOf(id));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void aceptarUsuario(String id){

        String sql = "UPDATE ventausuario SET idEstados = 2 WHERE idVenta = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void rechazarUsuario(String id){

        String sql = "UPDATE ventausuario SET idEstados = 4 WHERE idVenta = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    /** SECCIÓN DE OSCAR **/
    public ArrayList<VentaUsuario> listarCola(){
        ArrayList<VentaUsuario> lista = new ArrayList<>();

        String sql =    "SELECT c.nombre, c.apellido, j.nombre, v.idEstados, j.existente , v.idVenta\n" +
                "FROM cuenta AS c\n" +
                "JOIN ventausuario AS v ON c.idCuenta = v.idUsuario\n" +
                "JOIN juego AS j ON v.idJuego = j.idJuego\n" +
                "WHERE v.idEstados = 1;";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){

                VentaUsuario ventausuario = new VentaUsuario();

                Cuentas cuenta = new Cuentas();
                cuenta.setNombre(resultSet.getNString(1));
                cuenta.setApellido(resultSet.getNString(2));
                ventausuario.setUsuario(cuenta);

                Juegos juegos = new Juegos();
                juegos.setNombre(resultSet.getString(3));

                ventausuario.setIdEstados(resultSet.getInt(4));

                juegos.setExistente(resultSet.getBoolean(5));
                ventausuario.setJuegos(juegos);

                ventausuario.setIdVenta(resultSet.getInt(6));


                lista.add(ventausuario);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<VentaUsuario> listarnuevos(){ //categoria, fecga agregado, estado

        ArrayList<VentaUsuario> lista = new ArrayList<>();

        //se obtiene  1.idVenta, 2.idJuego, 3.nombre (juego), 4.nombre 5.apellido (cuenta), 6.precio, 7.foto, 8.genero
        String sql =    "SELECT vu.idVenta, vu.idJuego, j.nombre, c.nombre, c.apellido, vu.precioVenta, j.fotojuego, j.genero\n" +
                        "FROM ventausuario vu\n" +
                        "JOIN juego j ON vu.idJuego = j.idJuego\n" +
                        "JOIN cuenta c ON vu.idUsuario = c.idCuenta\n" +
                        "WHERE j.existente = 0 AND vu.idEstados = 1;\n";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){

                VentaUsuario ventausuario = new VentaUsuario();
                ventausuario.setIdVenta(resultSet.getInt(1));
                ventausuario.setIdJuego(resultSet.getInt(2));
                Juegos juegos = new Juegos();
                juegos.setNombre(resultSet.getString(3));
                juegos.setFotoJuego(resultSet.getString(7));
                juegos.setGenero(resultSet.getString(8));
                ventausuario.setJuegos(juegos);
                Cuentas cuenta = new Cuentas();
                cuenta.setNombre(resultSet.getNString(4));
                cuenta.setApellido(resultSet.getNString(5));
                ventausuario.setUsuario(cuenta);
                ventausuario.setPrecioVenta(resultSet.getDouble(6));

                lista.add(ventausuario);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<JuegosExistentes> listarexistentes(){ //num stock, reg venta
        ArrayList<JuegosExistentes> lista = new ArrayList<>();

        String sql =    "SELECT v.idVenta, v.idJuego, j.nombre, v.precioVenta, j.stock, COALESCE(cant_ventas, 0) AS cant_ventas, j.fotoJuego\n" +
                        "FROM ventausuario v\n" +
                        "JOIN juego j ON v.idJuego = j.idJuego\n" +
                        "LEFT JOIN (\n" +
                        "    SELECT idJuego, COUNT(*) AS cant_ventas\n" +
                        "    FROM comprausuario\n" +
                        "    WHERE idEstados = 6\n" +
                        "    GROUP BY idJuego\n" +
                        ") c ON j.idJuego = c.idJuego\n" +
                        "WHERE j.existente = 1 AND v.idEstados = 1\n" +
                        "ORDER BY cant_ventas DESC;";

//                        "SELECT v.idVenta, v.idJuego, j.nombre, v.precioVenta, j.stock , COUNT(v.idVenta) AS cant_ventas\n" +
//                        "FROM ventausuario v\n" +
//                        "JOIN juego j ON v.idJuego = j.idJuego\n" +
//                        "WHERE j.existente = 1 AND v.idEstados = 1\n" +
//                        "GROUP BY v.idVenta, v.idJuego, j.nombre, v.precioVenta, j.stock \n" +
//                        "ORDER BY cant_ventas DESC;";

        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                JuegosExistentes juegosExistentes = new JuegosExistentes();
                juegosExistentes.setIdVenta(resultSet.getInt(1));
                juegosExistentes.setIdJuego(resultSet.getInt(2));
                juegosExistentes.setNombre(resultSet.getString(3));
                juegosExistentes.setPrecioVenta(resultSet.getDouble(4));
                juegosExistentes.setStock(resultSet.getInt(5));
                juegosExistentes.setCant_ventas(resultSet.getInt(6));
                juegosExistentes.setFotojuego(resultSet.getString(7));
                lista.add(juegosExistentes);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public void cambiarestadoaceptar(String idventa){

        String sql = "UPDATE ventausuario SET idEstados = 2 WHERE idVenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, idventa);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void cambiarestadonoaceptar(String idventa){

        String sql = "UPDATE ventausuario SET idEstados = 3 WHERE idVenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, idventa);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void cambiarestadorechazar(String idventa){

        String sql = "UPDATE ventausuario SET idEstados = 4 WHERE idVenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, idventa);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void dejarMensaje(String mensajeAdmin, String idventa){
        String sql = "UPDATE ventausuario SET mensajeAdmin = ? WHERE idVenta = ?";
        try (Connection connection = this.getConection()){

            try (PreparedStatement pstmt = connection.prepareStatement(sql)){
                pstmt.setString(1, mensajeAdmin);
                pstmt.setString(2, idventa);

                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public VentaUsuario obtenerVentaUsuario(String idVenta) {

        VentaUsuario ventaUsuario = null;
        String sql = "SELECT * FROM ventausuario WHERE idVenta = ?";

        try {
            try (Connection conn = this.getConection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, idVenta);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        ventaUsuario = new VentaUsuario();
                        ventaUsuario.setIdVenta(rs.getInt(1));
                        ventaUsuario.setIdUsuario(rs.getInt(2));
                        ventaUsuario.setIdJuego(rs.getInt(3));
                        ventaUsuario.setPrecioVenta(rs.getDouble(4));
                        ventaUsuario.setMensajeAdmin(rs.getString(5));
                        ventaUsuario.setIdAdmin(rs.getInt(6));
                        ventaUsuario.setIdEstados(rs.getInt(7));
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ventaUsuario;
    }
    public ArrayList<DetallesNuevos> detallesNuevos(String idVenta){

        ArrayList<DetallesNuevos> lista = new ArrayList<>();
        String sql =    "SELECT vu.idVenta, vu.idJuego, c.idCuenta, j.nombre, CONCAT(c.nombre, ' ', c.apellido) AS nombreUsuario, vu.precioVenta, j.descripcion, j.consola, j.genero, vu.mensajeAdmin, j.foto\n" +
                        "FROM ventausuario vu\n" +
                        "JOIN juego j ON vu.idJuego = j.idJuego\n" +
                        "JOIN cuenta c ON vu.idUsuario = c.idCuenta\n" +
                        "WHERE vu.idVenta = ?;\n";
        try {
            try (Connection conn = this.getConection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, idVenta);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        DetallesNuevos detallesNuevos = new DetallesNuevos();
                        detallesNuevos.setIdVenta(rs.getInt(1));
                        detallesNuevos.setIdJuego(rs.getInt(2));
                        detallesNuevos.setIdCuenta(rs.getInt(3));
                        detallesNuevos.setNombre(rs.getString(4));
                        detallesNuevos.setNombreUsuario(rs.getString(5));
                        detallesNuevos.setPrecioVenta(rs.getDouble(6));
                        detallesNuevos.setDescripcion(rs.getString(7));
                        detallesNuevos.setConsola(rs.getString(8));
                        detallesNuevos.setGenero(rs.getString(9));
                        detallesNuevos.setMensajeAdmin(rs.getString(10));
                        detallesNuevos.setFoto(rs.getString(11));

                        lista.add(detallesNuevos);
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    public ArrayList<DetallesExistentes> detallesExistentes(String idVenta){

        ArrayList<DetallesExistentes> lista = new ArrayList<>();
        String sql =    "SELECT v.idVenta, v.idJuego, c.idCuenta, j.nombre,  CONCAT(c.nombre, ' ', c.apellido) AS nombreUsuario, v.precioVenta, j.stock , COUNT(v.idVenta) AS cant_ventas, j.genero, j.consola\n" +
                        "FROM ventausuario v\n" +
                        "JOIN juego j ON v.idJuego = j.idJuego\n" +
                        "JOIN cuenta c ON v.idUsuario = c.idCuenta\n" +
                        "WHERE j.existente = 1 AND v.idVenta = ?\n" +
                        "GROUP BY v.idVenta, v.idJuego, j.nombre, v.precioVenta, j.stock \n" +
                        "ORDER BY cant_ventas DESC;";
        try {
            try (Connection conn = this.getConection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, idVenta);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        DetallesExistentes detallesExistentes = new DetallesExistentes();
                        detallesExistentes.setIdVenta(rs.getInt(1));
                        detallesExistentes.setIdJuego(rs.getInt(2));
                        detallesExistentes.setIdCuenta(rs.getInt(3));
                        detallesExistentes.setNombre(rs.getString(4));
                        detallesExistentes.setNombreUsuario(rs.getString(5));
                        detallesExistentes.setPrecioVenta(rs.getDouble(6));
                        detallesExistentes.setStock(rs.getInt(7));
                        detallesExistentes.setCant_ventas(rs.getInt(8));
                        detallesExistentes.setConsola(rs.getString(9));
                        detallesExistentes.setGenero(rs.getString(10));

                        lista.add(detallesExistentes);
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
//    para NUEVOS
    public void noAceptar(String mensajeAdmin,int idVenta){
        String sql = "UPDATE ventausuario SET idEstados = 3, mensajeAdmin = ? WHERE idVenta = ?;";
//                            UPDATE ventausuario SET idEstados = 3 WHERE idVenta = ?;
        try (Connection connection = this.getConection()){

            try (PreparedStatement pstmt = connection.prepareStatement(sql)){
                pstmt.setString(1, mensajeAdmin);
                pstmt.setInt(2, idVenta);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void rechazar(String mensajeAdmin,int idVenta){
        String sql = "UPDATE ventausuario SET idEstados = 4, mensajeAdmin = ? WHERE idVenta = ?;";
//                            UPDATE ventausuario SET idEstados =4 WHERE idVenta = ?;
        try (Connection connection = this.getConection()){

            try (PreparedStatement pstmt = connection.prepareStatement(sql)){
                pstmt.setString(1, mensajeAdmin);
                pstmt.setInt(2, idVenta);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void pasarNuevoAExistente(String id) {

        String sql =    "UPDATE juego\n" +
                        "SET existente = 1, habilitado = 1\n" +
                        "WHERE idJuego = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
    public void aumentarStock(String id) {
        String sql =    "UPDATE juego\n" +
                        "SET stock = stock + 1\n" +
                        "WHERE idJuego = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }




    //Rommel
    public void juegoEntregado(String idCompra, Date fechaEntrega){

        String sql = "UPDATE comprausuario SET idEstados = '7', fechaEntrega = ? WHERE idCompra = ?";
        try (Connection connection = this.getConection()){

            try (PreparedStatement pstmt = connection.prepareStatement(sql)){
                pstmt.setDate(1, fechaEntrega);
                pstmt.setString(2, idCompra);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<VentaUsuario> listarNotificaciones(int id) {

        ArrayList<VentaUsuario> lista = new ArrayList<>();

        String sql = "SELECT * FROM ventausuario vu\n" +
                "inner join juego j on j.idJuego = vu.idJuego\n" +
                "inner join estados e on vu.idEstados = e.idEstados\n" +
                "where vu.idEstados != 8 and vu.idUsuario = ? and vu.mensajeAdmin is not null;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    VentaUsuario ventaUsuario = new VentaUsuario();
                    ventaUsuario.setIdVenta(rs.getInt(1));
                    ventaUsuario.setPrecioVenta(rs.getInt(4));
                    ventaUsuario.setMensajeAdmin(rs.getString(5));

                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(rs.getInt(8));
                    juegos.setNombre(rs.getString(9));
                    juegos.setFoto(rs.getString(19));
                    ventaUsuario.setJuegos(juegos);

                    Estados estados = new Estados();
                    estados.setIdEstados(rs.getInt(21));
                    estados.setEstados(rs.getString(22));
                    ventaUsuario.setEstados(estados);
                    lista.add(ventaUsuario);
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();

        }

        return lista;
    }



}
