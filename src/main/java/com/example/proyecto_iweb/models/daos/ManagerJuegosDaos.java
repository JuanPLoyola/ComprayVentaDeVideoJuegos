package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.Juegos;

import java.sql.*;
import java.util.ArrayList;

public class ManagerJuegosDaos extends DaoBase{

    /* ------------------------------ listar Juegos---------------------------*/
    public ArrayList<Juegos> listarJuegos(){
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
                lista.add(juegoDisponible);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }
    /* ------------------------------- barra buscadora -----------------------*/
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

    /*--------------------------------- borrar juego -------------------------*/

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

    /*------------------------------ top5 -----------------------------*/
    public ArrayList<Juegos> listarJuegosTop5(){
        ArrayList<Juegos> lista = new ArrayList<>();
        String sql = "SELECT j.idJuego, j.nombre, j.descripcion, j.precio, j.descuento, j.foto, j.existente, j.habilitado, j.consola, j.genero, j.stock\n" +
                "FROM juego j\n" +
                "INNER JOIN comprausuario co ON j.idJuego = co.idJuego\n" +
                "WHERE j.habilitado = '1'\n" +
                "GROUP BY j.idJuego, j.nombre, j.descripcion, j.precio, j.descuento, j.foto, j.existente, j.habilitado, j.consola, j.genero, j.stock\n" +
                "ORDER BY (\n" +
                "  SELECT MAX(co.cantidad)\n" +
                "  FROM comprausuario co\n" +
                "  WHERE co.idJuego = j.idJuego\n" +
                ") DESC\n" +
                "LIMIT 5";
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
                lista.add(juegoDisponible);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }
    /*--------------------------------menos Vendidos ------------------*/
    public ArrayList<Juegos> listarJuegosMenosVendidos(){
        ArrayList<Juegos> lista = new ArrayList<>();
        String sql = "SELECT j.idJuego, j.nombre, j.descripcion, j.precio, j.descuento, j.foto, j.existente, j.habilitado, j.consola, j.genero, j.stock\n" +
                "FROM juego j\n" +
                "left JOIN comprausuario co ON j.idJuego = co.idJuego\n" +
                "WHERE j.habilitado = '1'\n" +
                "GROUP BY j.idJuego, j.nombre, j.descripcion, j.precio, j.descuento, j.foto, j.existente, j.habilitado, j.consola, j.genero, j.stock\n" +
                "ORDER BY (\n" +
                "  SELECT MAX(co.cantidad)\n" +
                "  FROM comprausuario co\n" +
                "  WHERE co.idJuego = j.idJuego\n" +
                ")\n" +
                "LIMIT 5";
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
                lista.add(juegoDisponible);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

}