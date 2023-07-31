package com.example.proyecto_iweb.models.dtos;

public class UsuarioTabla {
    private int idCuenta;
    private String nombre;
    private int juegosComprados;
    private int juegosVendidos;
    private double dineroGastado;
    private double dineroGanado;
    private double balance;
    private int deshabilitado;

    public int getDeshabilitado() {
        return deshabilitado;
    }

    public void setDeshabilitado(int deshabilitado) {
        this.deshabilitado = deshabilitado;
    }

    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getJuegosComprados() {
        return juegosComprados;
    }

    public void setJuegosComprados(int juegosComprados) {
        this.juegosComprados = juegosComprados;
    }

    public int getJuegosVendidos() {
        return juegosVendidos;
    }

    public void setJuegosVendidos(int juegosVendidos) {
        this.juegosVendidos = juegosVendidos;
    }

    public double getDineroGastado() {
        return dineroGastado;
    }

    public void setDineroGastado(double dineroGastado) {
        this.dineroGastado = dineroGastado;
    }

    public double getDineroGanado() {
        return dineroGanado;
    }

    public void setDineroGanado(double dineroGanado) {
        this.dineroGanado = dineroGanado;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }
}
