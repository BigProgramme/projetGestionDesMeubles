package controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import database.DBConnection;
import model.Meuble;

@WebServlet("/suivi")
public class SuiviEtapes extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, List<Meuble>> meublesParEtape = new HashMap<>();
        List<Meuble> tousLesMeubles = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT m.reference, m.largeur, m.hauteur, m.profondeur, m.materiau, e.nom_etape, e.id_etape " +
                         "FROM meuble m " +
                         "LEFT JOIN etape e ON m.etape_actuelle = e.id_etape";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Meuble meuble = new Meuble();
                meuble.setReference(rs.getString("reference"));
                meuble.setLargeur(rs.getInt("largeur"));
                meuble.setHauteur(rs.getInt("hauteur"));
                meuble.setProfondeur(rs.getInt("profondeur"));
                meuble.setMateriau(rs.getString("materiau"));
                meuble.setIdEtape(rs.getInt("id_etape"));
                String nomEtape = rs.getString("nom_etape");

                tousLesMeubles.add(meuble);
                meublesParEtape.computeIfAbsent(nomEtape, k -> new ArrayList<>()).add(meuble);
            }

            rs.close();
            stmt.close();

            request.setAttribute("meubles", tousLesMeubles); // 🔧 pour la JSP actuelle
            request.setAttribute("meublesParEtape", meublesParEtape);
            request.getRequestDispatcher("/etapesFabrication.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Erreur SQL : " + e.getMessage());
        }
    }
}
