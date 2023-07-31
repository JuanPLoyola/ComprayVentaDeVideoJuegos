package com.example.proyecto_iweb.models.dtos;

public class EmpleadosTabla {

    private int idCuenta;
    private String nombre;
    private int juegosVendidos;
    private int juegosComprados;
    private double dineroGanado;
    private double dineroGastado;
    private double balance;
    private String foto;

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getJuegosVendidos() {
        return juegosVendidos;
    }

    public void setJuegosVendidos(int juegosVendidos) {
        this.juegosVendidos = juegosVendidos;
    }

    public int getJuegosComprados() {
        return juegosComprados;
    }

    public void setJuegosComprados(int juegosComprados) {
        this.juegosComprados = juegosComprados;
    }

    public double getDineroGanado() {
        return dineroGanado;
    }

    public void setDineroGanado(double dineroGanado) {
        this.dineroGanado = dineroGanado;
    }

    public double getDineroGastado() {
        return dineroGastado;
    }

    public void setDineroGastado(double dineroGastado) {
        this.dineroGastado = dineroGastado;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }
}



