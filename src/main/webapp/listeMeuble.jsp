<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
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
    <div class="container py-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Catalogue des meubles</h2>
            <a href="index.jsp" class="btn btn-link">Retour</a>
        </div>

        <div class="card shadow">
            <div class="card-body">
                <table class="table catalogue-table">
                    <thead class="table-light">
                        <tr>
                            <th>Référence</th>
                            <th>Dimensions</th>
                            <th>Matériau</th>
                            <th>État</th>
                            <th>Détails</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="bg-white align-middle">
                            <td>MBL-2023-001</td>
                            <td>120x80x40</td>
                            <td>Bois</td>
                            <td><span class="status-badge en-cours">En production</span></td>
                            <td><button class="btn btn-sm btn-outline-primary">➕ Suivi</button></td>
                        </tr>
                        <tr class="bg-white align-middle">
                            <td>MBL-2023-002</td>
                            <td>150x90x50</td>
                            <td>Métal</td>
                            <td><span class="status-badge termine">Terminé</span></td>
                            <td><button class="btn btn-sm btn-outline-primary">➕ Suivi</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>