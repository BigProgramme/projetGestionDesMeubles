<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Réinitialisation mot de passe - Gestion Meubles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .recovery-container {
            background: linear-gradient(145deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .form-control:focus {
            border-color: #5c6c7c;
            box-shadow: 0 0 0 0.25rem rgba(92,108,124,0.25);
        }
        form{
        height: 260px
        }
        
        .brand-logo {
            width: 80px;
            filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
        }
        
        .btn-reset {
            background: #5c6c7c;
            color: white;
            padding: 12px 30px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-reset:hover {
            background: #4a575e;
            transform: translateY(-2px);
        }
        
        .password-rules {
            font-size: 0.9rem;
            color: #6c757d;
        }
    </style>
</head>
<body class="d-flex align-items-center min-vh-100" style="background: url('https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed; background-size: cover;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="recovery-container p-5">
                    <div class="text-center mb-5">
                        <img src="https://cdn-icons-png.flaticon.com/512/1534/1534959.png" alt="Logo" class="brand-logo mb-4">
                        <h2 class="mb-3" style="color: #2c3e50;">Réinitialisation du mot de passe</h2>
                        <p class="text-muted">Entrez vos informations pour réinitialiser</p>
                    </div>

		<!-- ================================== -->
					<% if (request.getAttribute("error") != null) { %>
					    <div class="alert alert-danger" role="alert">
					        <%= request.getAttribute("error") %>
					    </div>
					<% } else if (request.getAttribute("message") != null) { %>
						    <div class="alert alert-success" role="alert">
						        <%= request.getAttribute("message") %>
						    </div>
				<% } %>	
				<!-- ================================== -->
				
				<% if (request.getAttribute("message") != null) { %>
				    <div class="alert alert-success text-center" role="alert">
				        <%= request.getAttribute("message") %><br>
				        Redirection dans <span id="countdown">5</span> secondes...
				    </div>

				    <script>
				        let seconds = 5;
				        const countdown = document.getElementById("countdown");
				        const interval = setInterval(() => {
				            seconds--;
				            countdown.textContent = seconds;
				            if (seconds === 0) {
				                clearInterval(interval);
				                window.location.href = "login";
				            }
				        }, 1000);
				    </script>
				<% } %>
<!-- ================================== -->
				
				
                    <form action="resetPassword" method="post">
                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <input type="text" name="username" class="form-control form-control-lg" placeholder="Nom d'utilisateur" required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                <input type="password" name="newPassword" class="form-control form-control-lg" placeholder="Nouveau mot de passe" required>
                            </div>
                            <div class="password-rules mt-2">
                               <!--  8 caractères minimum, 1 majuscule et 1 chiffre -->
                            </div>
                        </div>

                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-check-circle"></i></span>
                                <input type="password" name="confirmPassword" class="form-control form-control-lg" placeholder="Confirmer le mot de passe" required>
                            </div>
                        </div>

                        <div class="d-grid gap-2 mt-4">
                            <button type="submit" class="btn btn-reset btn-lg">
                                <i class="fas fa-redo-alt me-2"></i>Réinitialiser
                            </button>
                        </div>
                    </form>

                    <div class="text-center mt-4">
                        <a href="login" class="text-decoration-none" style="color: #5c6c7c;">
                            <i class="fas fa-arrow-left me-2"></i>Retour à la connexion
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>