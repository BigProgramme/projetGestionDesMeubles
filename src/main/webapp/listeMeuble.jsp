<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Catalogue des meubles</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.catalogue-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 15px;
    table-layout: auto;
}


    .catalogue-table {
        border-collapse: separate;
        border-spacing: 0 15px;
    }
    .status-badge {
        padding: 0.4em 0.8em;
        border-radius: 20px;
        font-size: 0.9em;
    }
    .en-cours { background: #fff3cd; color: #856404; }
    .termine { background: #d4edda; color: #155724; }
</style>
</head>

<body class="bg-light">
<jsp:include page="menu.jsp" />
<%@ include file="auth_check.jsp" %>


    <div class="container py-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Catalogue des meubles</h2>
             <!--  <a href="index" class="btn btn-link">Retour</a> -->
        </div>
        

        <div class="card shadow">
            <div class="card-body">
            <div class="table-responsive">
            
            
                <table class="table catalogue-table">
                    <thead class="table-light">
                        <tr>
                            <th>Référence</th>
                            <th>Dimensions</th>
                            <th>Matériau</th>
                            <th>Étape de prod actuelle</th>
                            <th>Date de création</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        @SuppressWarnings("unchecked")
                            // Récupération de la liste des meubles passée en attribut request
                            java.util.List<model.Meuble> meubles = (java.util.List<model.Meuble>) request.getAttribute("meubles");
                            if (meubles != null) {
                                for (model.Meuble meuble : meubles) {
                        %>
                            <tr class="bg-white align-middle">
                                <td><%= meuble.getReference() %></td>
                                <td><%= meuble.getLargeur() %>x<%= meuble.getHauteur() %>x<%= meuble.getProfondeur() %></td>
                                <td><%= meuble.getMateriau() %></td>
                                <td>
                                    <%
                                        String etape = meuble.getEtape();
                                        if ("En production".equalsIgnoreCase(etape) || "en cours".equalsIgnoreCase(etape)) {
                                    %>
                                        <span class="status-badge en-cours">En production</span>
                                    <%
                                        } else if ("Terminé".equalsIgnoreCase(etape) || "termine".equalsIgnoreCase(etape)) {
                                    %>
                                        <span class="status-badge termine">Terminé</span>
                                    <%
                                        } else {
                                    %>
                                        <span class="status-badge"><%= etape %></span>
                                    <%
                                        }
                                    %>
                                </td>
                                 <td><%= meuble.formatDate() %></td>
                                <td>
								    <a href="supprimer?reference=<%= meuble.getReference() %>" 
								       class="btn btn-sm btn-outline-danger"
								       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce meuble ?');">
								       <i class="fa fa-trash"></i> Supprimer
								    </a>
							</td>

                            </tr>
                        <%
                       
                                }
                            } else {
                        %>
                            <tr><td colspan="5" class="text-center">Aucun meuble trouvé.</td></tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
               </div>
            </div>
        </div>
    </div>
</body>

</html>
