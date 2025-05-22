package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBConnection;

/**
 * Servlet implementation class AjouterMeuble
 */
@WebServlet("/ajout")
public class AjouterMeuble extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Récupération des données du formulaire
        String ref = request.getParameter("ref");
        int largeur = Integer.parseInt(request.getParameter("largeur"));
        int hauteur = Integer.parseInt(request.getParameter("hauteur"));
        int profondeur = Integer.parseInt(request.getParameter("profondeur"));
        String materiau = request.getParameter("materiau");
        int etapeId = Integer.parseInt(request.getParameter("etape")); // 1, 2 ou 3
        
        try {
            // Connexion à la base de données
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DBConnection.getConnection();

            // Requête SQL pour insérer un nouveau meuble
            String sql = "INSERT INTO meuble (reference, largeur, hauteur, profondeur, materiau, etape_actuelle) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ref);
            stmt.setInt(2, largeur);
            stmt.setInt(3, hauteur);
            stmt.setInt(4, profondeur);
            stmt.setString(5, materiau);
            stmt.setInt(6, etapeId);

            stmt.executeUpdate();
            
            // 2. Récupérer l'ID généré du meuble
            int idMeuble = -1;
            java.sql.ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                idMeuble = generatedKeys.getInt(1);
            }
            stmt.close();

            // 3. Si le matériau est "Bois", insérer dans meuble_bois
            if ("Bois".equalsIgnoreCase(materiau)) {
                String pays = request.getParameter("pays_provenance");
                int anneeCoupe = Integer.parseInt(request.getParameter("annee_coupe"));

                String boisSql = "INSERT INTO meuble_bois(id_meuble, pays_provenance, annee_coupe) VALUES (?, ?, ?)";
                PreparedStatement boisStmt = conn.prepareStatement(boisSql);
                boisStmt.setInt(1, idMeuble);
                boisStmt.setString(2, pays);
                boisStmt.setInt(3, anneeCoupe);
                boisStmt.executeUpdate();
                boisStmt.close();
            }

            //stmt.close();
            conn.close();

            
            // Redirection après succès
            response.sendRedirect("index.jsp");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Erreur lors de l'insertion : " + e.getMessage());
        }
    }
}
