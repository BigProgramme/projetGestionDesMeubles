package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBConnection;

/**
 * Servlet implementation class SupprimerMeubleServelet
 */
@WebServlet("/supprimer")
public class SupprimerMeubleServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reference = request.getParameter("reference");

        if (reference != null && !reference.trim().isEmpty()) {
            try {
                Connection con = DBConnection.getConnection();


             // suppression d'abord  dans meuble_bois d'abord pour éviter...
             String deleteBois = "DELETE FROM meuble_bois WHERE id_meuble = (SELECT id_meuble FROM meuble WHERE reference = ?)";
             PreparedStatement stmtBois = con.prepareStatement(deleteBois);
             stmtBois.setString(1, reference);
             stmtBois.executeUpdate();
             stmtBois.close();

           //     
                
                String query = "DELETE FROM meuble WHERE reference = ?";
                PreparedStatement stmt = con.prepareStatement(query);
                stmt.setString(1, reference);

                int rowsDeleted = stmt.executeUpdate();
                System.out.println("Meuble supprimé ? " + (rowsDeleted > 0));

                stmt.close();
                con.close();

            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Erreur lors de la suppression : " + e.getMessage());
                return;
            }
        } else {
            response.getWriter().println("Référence manquante ou invalide.");
            return;
        }

        // Rediriger vers la liste après suppression
        response.sendRedirect("listedesmeubles");
    }
}
