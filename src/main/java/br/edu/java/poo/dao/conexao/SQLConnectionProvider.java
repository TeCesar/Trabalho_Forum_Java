package br.edu.java.poo.dao.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLConnectionProvider {

    public static String url = "jdbc:mysql://localhost:3306/trabalho_java_forum_test";
    public static String usuario = "root";
    public static String senha = "";

    public static Connection openConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url, usuario, senha);
    }
}
