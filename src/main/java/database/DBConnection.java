package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Charger le driver JDBC MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Configuration de la connexion
        String url = "jdbc:mysql://localhost:3306/gestion_meubles?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String user = "your user";
        String password = "your passeword"; // 

        // Retourne la connexion
        return DriverManager.getConnection(url, user, password);
    }

}
