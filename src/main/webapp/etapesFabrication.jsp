<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Meuble" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Étapes de fabrication</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .etape-card {
        transition: transform 0.2s;
        cursor: pointer;
    }
    .etape-card:hover {
        transform: translateY(-5px);
    }
</style>
</head>
<body class="bg-light">

    <div class="container py-4">
        <h2 class="mb-4">📊 Suivi de production</h2>
        <a href="index.jsp" class="btn btn-link">Retour</a>
        <div class="row g-4">

            <!-- Étape 1 : Assemblage -->
            <div class="col-md-4">
                <div class="card etape-card h-100 border-primary">
                    <div class="card-header bg-primary text-white">
                        🔨 Assemblage
                    </div>
                    <div class="card-body">
                        <%
                        if (request.getAttribute("meubles") == null) {
                            response.sendRedirect("suivi");
                            return;
                        }
                        List<Meuble> meubles = (List<Meuble>) request.getAttribute("meubles");
                        
                        
                            boolean videEtape1 = true;
                            for (Meuble m : meubles) {
                                if (m.getIdEtape() == 1) {
                                    videEtape1 = false;
                        %>
                        <ul class="list-group mb-2">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <strong><%= m.getReference() %></strong><br>
                                    <small class="text-muted"><%= m.getMateriau() %></small>
                                </div>
                                <form method="post" action="changerEtape">
                                    <input type="hidden" name="reference" value="<%= m.getReference() %>" />
                                    <button class="btn btn-sm btn-outline-secondary">⏩ Étape suivante</button>
                                </form>
                            </li>
                        </ul>
                        <%
                                }
                            }
                            if (videEtape1) {
                        %>
                            <p class="text-muted">Aucun meuble en cours.</p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>

            <!-- Étape 2 : Peinture/Vernis -->
            <div class="col-md-4">
                <div class="card etape-card h-100 border-warning">
                    <div class="card-header bg-warning text-dark">
                        🎨 Peinture / Vernis
                    </div>
                    <div class="card-body">
                        <%
                            boolean videEtape2 = true;
                            for (Meuble m : meubles) {
                                if (m.getIdEtape() == 2) {
                                    videEtape2 = false;
                        %>
                        <ul class="list-group mb-2">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <strong><%= m.getReference() %></strong><br>
                                    <small class="text-muted"><%= m.getMateriau() %></small>
                                </div>
                                <form method="post" action="changerEtape">
                                    <input type="hidden" name="reference" value="<%= m.getReference() %>" />
                                    <button class="btn btn-sm btn-outline-secondary">⏩ Étape suivante</button>
                                </form>
                            </li>
                        </ul>
                        <%
                                }
                            }
                            if (videEtape2) {
                        %>
                            <p class="text-muted">Aucun meuble en cours.</p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>

            <!-- Étape 3 : Colisage -->
            <div class="col-md-4">
                <div class="card etape-card h-100 border-success">
                    <div class="card-header bg-success text-white">
                        📦 Colisage
                    </div>
                    <div class="card-body">
                        <%
                            boolean videEtape3 = true;
                            for (Meuble m : meubles) {
                                if (m.getIdEtape() == 3) {
                                    videEtape3 = false;
                        %>
                        <ul class="list-group mb-2">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <strong><%= m.getReference() %></strong><br>
                                    <small class="text-muted"><%= m.getMateriau() %></small>
                                </div>
                                <!-- Pas de bouton pour la dernière étape -->
                            </li>
                        </ul>
                        <%
                                }
                            }
                            if (videEtape3) {
                        %>
                            <p class="text-muted">Aucun meuble en cours.</p>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
