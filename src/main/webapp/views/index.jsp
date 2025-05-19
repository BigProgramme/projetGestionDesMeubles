<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Accueil</title>

<style>
        .custom-bg {
            background: linear-gradient(120deg, #f0f8ff, #e6e6fa);
            min-height: 100vh;
            padding: 2rem;
        }
    </style>
    
</head>

<body class="custom-bg">
    <div class="container">
        <h1 class="text-center mb-5"> Gestion des Meubles</h1>

        
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 shadow">
                    <div class="card-body text-center">
                        <h5 class="card-title">Nouveau meuble</h5>
                        <a href="ajouterMeuble.jsp" class="btn btn-primary mt-3">Commencer</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow">
                    <div class="card-body text-center">
                        <h5 class="card-title">Catalogue</h5>
                        <a href="listeMeuble.jsp" class="btn btn-info mt-3">Voir la liste</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow">
                    <div class="card-body text-center">
                        <h5 class="card-title"> Production</h5>
                        <a href="etapesFabrication.jsp" class="btn btn-warning mt-3">Suivre</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>