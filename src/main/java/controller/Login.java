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
import javax.servlet.http.HttpSession;

import database.DBConnection;


@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }
    
    //Affiche le formulaire quand on accède à /login (GET)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM utilisateur WHERE username = ? AND mot_de_passe = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            
           // String hashedPassword = PasswordUtils.hashPassword(password);
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Auth OK
                session.setAttribute("username", username);
                response.sendRedirect("index"); // redirige vers le servlet @WebServlet("/index")
                return; // stop ici, sinon le forward plus bas s'exécute
            } else {
                // Auth échouée
                request.setAttribute("error", "Identifiants incorrects !");
                dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erreur lors de la connexion.");
        }
    }
}
