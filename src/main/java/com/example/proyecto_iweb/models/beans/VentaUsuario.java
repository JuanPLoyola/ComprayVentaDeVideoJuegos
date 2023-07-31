package com.example.proyecto_iweb.models.beans;

public class VentaUsuario {

    private int idVenta;
    private int idUsuario;
    private int idJuego;
    private Juegos juegos;
    private double precioVenta;
    private String mensajeAdmin;
    private int idEstados;
    private Estados estados;
    private int idAdmin;
    private Cuentas usuario;
    private Cuentas admin;

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
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

    public Juegos getJuegos() {
        return juegos;
    }

    public void setJuegos(Juegos juegos) {
        this.juegos = juegos;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public String getMensajeAdmin() {
        return mensajeAdmin;
    }

    public void setMensajeAdmin(String mensajeAdmin) {
        this.mensajeAdmin = mensajeAdmin;
    }

    public int getIdEstados() {
        return idEstados;
    }

    public void setIdEstados(int idEstados) {
        this.idEstados = idEstados;
    }

    public Estados getEstados() {
        return estados;
    }

    public void setEstados(Estados estados) {
        this.estados = estados;
    }

    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
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
}
