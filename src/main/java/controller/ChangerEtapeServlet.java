package controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import database.DBConnection;

@WebServlet("/changerEtape")
public class ChangerEtapeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reference = request.getParameter("reference");

        try (Connection conn = DBConnection.getConnection()) {
            // Récupérer l'étape actuelle
            String selectSQL = "SELECT etape_actuelle FROM meuble WHERE reference = ?";
            PreparedStatement selectStmt = conn.prepareStatement(selectSQL);
            selectStmt.setString(1, reference);
            ResultSet rs = selectStmt.executeQuery();

            if (rs.next()) {
                int etapeActuelle = rs.getInt("etape_actuelle");
                int etapeSuivante = etapeActuelle < 3 ? etapeActuelle + 1 : etapeActuelle;

                // Mettre à jour si pas déjà à la dernière étape
                if (etapeActuelle < 3) {
                    String updateSQL = "UPDATE meuble SET etape_actuelle = ? WHERE reference = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
                    updateStmt.setInt(1, etapeSuivante);
                    updateStmt.setString(2, reference);
                    updateStmt.executeUpdate();
                    updateStmt.close();
                }
            }

            rs.close();
            selectStmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Erreur SQL : " + e.getMessage());
            return;
        } catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

        // Redirection vers la page de suivi
        response.sendRedirect("suivi");
    }
}
