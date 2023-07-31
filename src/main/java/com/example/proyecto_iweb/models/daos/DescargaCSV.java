package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.dtos.UsuarioTabla;
import com.opencsv.CSVWriter;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class DescargaCSV {
    public static void exportarListaCSV(UsuarioTabla usuario) {

        // Obtener el directorio de descargas del usuario actual
        String descargasDir = null;

        String os = System.getProperty("os.name").toLowerCase();
        if (os.contains("win")) { // Windows
            descargasDir = System.getenv("USERPROFILE") + "\\Downloads\\";
        } else if (os.contains("nix") || os.contains("nux") || os.contains("mac")) { // Linux o macOS
            descargasDir = System.getProperty("user.home") + "/Descargas/";
        } else {
            // Otros sistemas operativos o casos no reconocidos
            System.err.println("Sistema operativo no reconocido. No se pudo obtener la ruta de descargas.");
            return;
        }

        // Asegurarnos de que el directorio de Descargas exista, si no, créalo
        try {
            Files.createDirectories(Paths.get(descargasDir));
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        String archivoCSV = descargasDir + usuario.getNombre() + ".csv";

        try (CSVWriter writer = new CSVWriter(new FileWriter(archivoCSV))) {

            String[] encabezados = {"Nombre Completo", "Juegos Comprados", "Juegos Vendidos", "Dinero Ganado", "Dinero Gastado"};
            writer.writeNext(encabezados);

            String[] fila = {usuario.getNombre(), String.valueOf(usuario.getJuegosComprados()), String.valueOf(usuario.getJuegosVendidos()), String.valueOf((int) usuario.getDineroGanado()), String.valueOf((int) usuario.getDineroGastado())};
            writer.writeNext(fila);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
