<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Ajouter un meuble</title>

<style>
        .form-container {
            max-width: 700px;
            margin: 2rem auto;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .dimension-inputs input {
            max-width: 120px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="my-4">➕ Nouveau meuble</h2>
        
        <div class="form-container bg-white">
            <form action="ajout"  method="post">
                <div class="mb-3">
                    <label class="form-label">Référence</label>
                    <input type="text" class="form-control" placeholder="Ex: MBL-2023-001" name="refe">
                </div>

                <div class="mb-3">
                    <label class="form-label">Dimensions (cm)</label>
                    <div class="d-flex gap-3 dimension-inputs">
                        <input type="number" class="form-control" placeholder="Largeur">
                        <input type="number" class="form-control" placeholder="Hauteur">
                        <input type="number" class="form-control" placeholder="Profondeur">
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label">Matériau principal</label>
                    <select class="form-select">
                        <option value="bois">Bois</option>
                        <option value="metal">Métal</option>
                        <option value="resine">Résine</option>
                    </select>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-success">Enregistrer</button>
                    <a href="index.jsp" class="btn btn-outline-secondary">Annuler</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>