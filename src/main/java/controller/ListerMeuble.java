package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import database.DBConnection;
import model.Meuble;

@WebServlet("/listedesmeubles")
public class ListerMeuble extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT m.reference, m.largeur, m.hauteur, m.profondeur, m.materiau, e.nom_etape, m.date_creation " +
                         "FROM meuble m LEFT JOIN etape e ON m.etape_actuelle = e.id_etape";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            ArrayList<Meuble> meubles = new ArrayList<>();

            while (rs.next()) {
                Meuble m = new Meuble();
                m.setReference(rs.getString("reference"));
                m.setLargeur(rs.getInt("largeur"));
                m.setHauteur(rs.getInt("hauteur"));
                m.setProfondeur(rs.getInt("profondeur"));
                m.setMateriau(rs.getString("materiau"));
                m.setEtape(rs.getString("nom_etape")); // peut être null
                m.setDateDeCreation(rs.getString("date_creation"));
                meubles.add(m);
            }

            rs.close();
            stmt.close();
            conn.close();

            // Debug
           // System.out.println("Nombre de meubles récupérés : " + meubles.size());

            request.setAttribute("meubles", meubles);
            request.getRequestDispatcher("/listeMeuble.jsp").forward(request, response);
            
            //System.out.println(request.getParameter("reference")); //

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erreur : " + e.getMessage());
        }
    }
}
