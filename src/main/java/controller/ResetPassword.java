package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBConnection;

@WebServlet("/resetPassword")
public class ResetPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ResetPassword() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("reset_password.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        RequestDispatcher dispatcher;

        //vérification des mots de passes
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Les mots de passe ne correspondent pas.");
            dispatcher = request.getRequestDispatcher("reset_password.jsp");
            dispatcher.forward(request, response);
            return;
        }

        //tente toujours la connexion
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DBConnection.getConnection();

            // Étape 1 : on va d'abord vérifier si l'utilisateur utilisateur existe dans la bdd
            String checkUserSql = "SELECT * FROM utilisateur WHERE username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkUserSql);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (!rs.next()) {
                request.setAttribute("error", "Utilisateur introuvable.");
                dispatcher = request.getRequestDispatcher("reset_password.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Étape 2 : si le user existe, on va donc mettre à jour le mot de passe
            String updateSql = "UPDATE utilisateur SET mot_de_passe = ? WHERE username = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateSql);
            updateStmt.setString(1, newPassword); // 
            updateStmt.setString(2, username);

            int rowCount = updateStmt.executeUpdate();

            if (rowCount > 0) {
                request.setAttribute("message", "Mot de passe mis à jour avec succès !");
                //
                request.setAttribute("message", "Mot de passe mis à jour avec succès !");
                dispatcher = request.getRequestDispatcher("reset_password.jsp"); // on sur reste sur la même page pour le message + redirection JS

            } else {
                request.setAttribute("error", "Échec de la mise à jour du mot de passe.");
                dispatcher = request.getRequestDispatcher("reset_password.jsp");
            }

            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Une erreur est survenue.");
            dispatcher = request.getRequestDispatcher("reset_password.jsp");
            dispatcher.forward(request, response);
        }
    }
}
