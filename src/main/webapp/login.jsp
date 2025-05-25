<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Connexion - Gestion Meubles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .login-container {
            background: linear-gradient(145deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .form-control:focus {
            border-color: #5c6c7c;
            box-shadow: 0 0 0 0.25rem rgba(92,108,124,0.25);
        }
        
        .brand-logo {
            width: 80px;
            filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
        }
        
        .btn-custom {
            background: #5c6c7c;
            color: white;
            padding: 12px 30px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-custom:hover {
            background: #4a575e;
            transform: translateY(-2px);
        }
        
        .decorative-line {
            height: 4px;
            background: linear-gradient(90deg, transparent, #5c6c7c, transparent);
            margin: 2rem 0;
        }
    </style>
</head>
<body class="d-flex align-items-center min-vh-100" style="background: url('https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed; background-size: cover;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="login-container p-5">
                    <div class="text-center mb-5">
                        <img src="https://cdn-icons-png.flaticon.com/512/1534/1534959.png" alt="Logo" class="brand-logo mb-4">
                        <h2 class="mb-3" style="color: #2c3e50;">Gestion des Meubles</h2>
                        <p class="text-muted">Connectez-vous pour accéder au système de production</p>
                    </div>

                    <form action="login" method="post">
                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <input type="text" name="username" class="form-control form-control-lg" placeholder="Nom d'utilisateur" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                <input type="password" name="password" class="form-control form-control-lg" placeholder="Mot de passe" required>
                            </div>
                        </div>

                        <div class="d-grid gap-2 mt-5">
                            <button type="submit" class="btn btn-custom btn-lg">
                                <i class="fas fa-sign-in-alt me-2"></i>Connexion
                            </button>
                        </div>
                    </form>

                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger mt-4 d-flex align-items-center" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <div class="text-center mt-4">
                        <a href="resetPassword" class="text-decoration-none" style="color: #5c6c7c;">Mot de passe oublié ?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>