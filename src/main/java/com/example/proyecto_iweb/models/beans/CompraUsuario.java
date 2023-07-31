package com.example.proyecto_iweb.models.beans;

import java.sql.Date;

public class CompraUsuario {

    private int idCompra;
    private int idUsuario;
    private int idJuego;
    private int cantidad;
    private Date fechaCompra;
    private String direccion;
    private int idAdmin;
    private Estados estados;
    private int idEstados;
    private Juegos juegos;
    private double precioCompra;
    private Cuentas usuario;
    private Cuentas admin;

    /* --------------------------------------- SE AÑADIO ESTO --------------------------------------- */

    private Date fechaEntrega;
    private int raiting;

    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public int getRaiting() {
        return raiting;
    }

    public void setRaiting(int raiting) {
        this.raiting = raiting;
    }

    /* ---------------------------------------------------------------------------------------------------------------*/

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(int idJuego) {
        this.idJuego = idJuego;
    }

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
    }

    public Estados getEstados() {
        return estados;
    }

    public void setEstados(Estados estados) {
        this.estados = estados;
    }

    public int getIdEstados() {
        return idEstados;
    }

    public void setIdEstados(int idEstados) {
        this.idEstados = idEstados;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    public Cuentas getUsuario() {
        return usuario;
    }

    public void setUsuario(Cuentas usuario) {
        this.usuario = usuario;
    }

    public Cuentas getAdmin() {
        return admin;
    }

    public void setAdmin(Cuentas admin) {
        this.admin = admin;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Juegos getJuegos() {
        return juegos;
    }

    public void setJuegos(Juegos juegos) {
        this.juegos = juegos;
    }

}
