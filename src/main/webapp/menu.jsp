<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .navbar {
        background: linear-gradient(145deg, #2c3e50, #34495e) !important;
        padding: 0.8rem 1rem;
        border-bottom: 3px solid #ecf0f1;
    }
    
    .navbar-brand {
        font-size: 1.5rem;
        letter-spacing: 1px;
        transition: transform 0.3s ease;
    }
    
    .navbar-brand:hover {
        transform: translateX(5px);
    }
    
    .nav-link {
        color: #ecf0f1 !important;
        padding: 0.8rem 1.2rem !important;
        margin: 0 5px;
        border-radius: 8px;
        transition: all 0.3s ease;
        position: relative;
    }
    
    .nav-link:hover {
        background: rgba(236, 240, 241, 0.1);
        transform: translateY(-2px);
    }
    
    .nav-link:hover::after {
        width: 100%;
    }
    
    .btn-logout {
        border: 2px solid #ecf0f1;
        border-radius: 8px;
        transition: all 0.3s ease;
    }
    
    .btn-logout:hover {
        background: #ecf0f1;
        color: #2c3e50 !important;
    }
    
    .navbar-toggler {
        border-color: rgba(236, 240, 241, 0.5);
    }
    
    .navbar-toggler-icon {
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(236, 240, 241, 0.8)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
    }
    
    @media (max-width: 991px) {
        .navbar-collapse {
            background: linear-gradient(145deg, #2c3e50, #34495e);
            padding: 1rem;
            margin-top: 10px;
            border-radius: 10px;
        }
        
        .nav-item {
            margin: 5px 0;
        }
        
        .btn-logout {
            margin-top: 1rem;
            width: 100%;
        }
    }
</style>
</head>
<body>
    <%@ page session="true" %>
    <nav class="navbar navbar-expand-lg navbar-dark shadow mb-4">
        <div class="container-fluid">
            
            <a class="navbar-brand fw-bold" href="index">
                <i class="fas fa-chair me-2" style="color: #ecf0f1;"></i>
                <span style="background: linear-gradient(45deg, #ecf0f1, #bdc3c7); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                    Meubles
                </span>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>

            <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
                <ul class="navbar-nav">
                
                   <li class="nav-item me-3">
				        <span class="nav-link disabled">
				          Bienvenue, <strong><%= session.getAttribute("username") %></strong>
				        </span>
      				</li>
                    
                   <li class="nav-item">
                        <a class="nav-link" href="index">
                            <i class="fas fa-home me-2"></i>
                            <span class="d-lg-none d-inline">Accueil</span>
                            <span class="d-none d-lg-inline">Accueil</span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="ajouterMeuble">
                            <i class="fas fa-plus-circle me-2"></i>
                            <span class="d-lg-none d-inline">Ajouter Meuble</span>
                            <span class="d-none d-lg-inline">Ajouter</span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="listedesmeubles">
                            <i class="fas fa-box-open me-2"></i>
                            Catalogue
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="suivi">
                            <i class="fas fa-tasks me-2"></i>
                            Suivi Production
                        </a>
                    </li>
                </ul>

                <form class="d-flex" action="logout" method="post">
                    <button class="btn btn-logout text-white" type="submit">
                        <i class="fas fa-sign-out-alt me-2"></i>
                        <span class="d-none d-lg-inline">Déconnexion</span>
                    </button>
                </form>
            </div>
        </div>
    </nav>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>