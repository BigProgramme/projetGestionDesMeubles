<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Insert title here</title>

 <style>
        .etape-card {
            transition: transform 0.2s;
            cursor: pointer;
        }
        .etape-card:hover {
            transform: translateY(-5px);
        }
        .progress-bar-custom {
            height: 8px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container py-4">
        <h2 class="mb-4">📊 Suivi de production</h2>
        
        <div class="row g-4">
            <!-- Étape 1 -->
            <div class="col-md-4">
                <div class="card etape-card h-100 border-primary">
                    <div class="card-header bg-primary text-white">
                        🔨 Assemblage
                    </div>
                    <div class="card-body">
                        <h6 class="text-muted mb-3">5 meubles en cours</h6>
                        <div class="progress mb-3">
                            <div class="progress-bar progress-bar-custom bg-info" style="width: 75%"></div>
                        </div>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between">
                                <span>MBL-2023-001</span>
                                <small>2 jours restants</small>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>MBL-2023-003</span>
                                <small>1 jour restant</small>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Étape 2 -->
            <div class="col-md-4">
                <div class="card etape-card h-100 border-warning">
                    <div class="card-header bg-warning text-dark">
                        🎨 Peinture/Vernis
                    </div>
                    <div class="card-body">
                        <h6 class="text-muted mb-3">3 meubles en cours</h6>
                        <div class="progress mb-3">
                            <div class="progress-bar progress-bar-custom bg-warning" style="width: 45%"></div>
                        </div>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between">
                                <span>MBL-2023-005</span>
                                <small>3 jours restants</small>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Étape 3 -->
            <div class="col-md-4">
                <div class="card etape-card h-100 border-success">
                    <div class="card-header bg-success text-white">
                        📦 Colisage
                    </div>
                    <div class="card-body">
                        <h6 class="text-muted mb-3">Aucun meuble</h6>
                        <div class="progress mb-3">
                            <div class="progress-bar progress-bar-custom bg-success" style="width: 10%"></div>
                        </div>
                        <div class="text-center text-muted py-3">
                            Aucune opération en cours
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>