package com.example.proyecto_iweb.models.daos;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidacionAdminDaos extends DaoBase{

    public boolean nombreyApellidoValid(String nombre) {
        String regex = "^[A-Za-zñÑáéíóúÁÉÍÓÚ][^_\\-!¡?÷¿\\+/=@`#$%'ˆ^&*()\\\\\\[\\]{}|~,<>;:]{1,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(nombre);
        return matcher.find();
    }





}
