<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un meuble</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
        #bois-fields {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="my-4">➕ Nouveau meuble</h2>
        <div class="form-container bg-white">
            <form action="ajout" method="post">
                <div class="mb-3">
                    <label class="form-label">Référence</label>
                    <input type="text" class="form-control" placeholder="Ex: MBL-2023-001" name="ref" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Dimensions (cm)</label>
                    <div class="d-flex gap-3 dimension-inputs">
                        <input type="number" class="form-control" placeholder="Largeur" name="largeur" required>
                        <input type="number" class="form-control" placeholder="Hauteur" name="hauteur" required>
                        <input type="number" class="form-control" placeholder="Profondeur" name="profondeur" required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label">Matériau principal</label>
                    <select class="form-select" name="materiau" id="materiau-select" required>
                        <option value="">-- Sélectionner --</option>
                        <option value="bois">Bois</option>
                        <option value="metal">Métal</option>
                        <option value="resine">Résine</option>
                    </select>
                </div>

                <!-- Champs spécifiques au bois -->
                <div id="bois-fields" class="mb-4">
                    <div class="mb-3">
                        <label class="form-label">Pays de provenance</label>
                        <input type="text" class="form-control" name="pays_provenance" placeholder="Ex: Canada">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Année de coupe</label>
                        <input type="number" class="form-control" name="annee_coupe" placeholder="Ex: 2022" min="1900" max="2100">
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label">Étape de fabrication</label>
                    <select class="form-select" name="etape" required>
                        <option value="1">Assemblage</option>
                        <option value="2">Peinture</option>
                        <option value="3">Colisage</option>
                    </select>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-success">Enregistrer</button>
                    <a href="index.jsp" class="btn btn-outline-secondary">Annuler</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Script pour afficher les champs si "Bois" est sélectionné -->
    <script>
        document.getElementById("materiau-select").addEventListener("change", function() {
            const boisFields = document.getElementById("bois-fields");
            if (this.value === "bois") {
                boisFields.style.display = "block";
            } else {
                boisFields.style.display = "none";
            }
        });
    </script>
</body>
</html>
