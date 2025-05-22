package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Meuble {
	
	 private String reference;
	    private int largeur;
	    private int hauteur;
	    private int profondeur;
	    private String materiau;
	    private String etape;
	    private int idEtape;
	    private LocalDateTime  dateDeCreation;
	    
	    
	    
	    
	    public LocalDateTime getDateDeCreation() {
			return dateDeCreation;
		}

		public void setDateDeCreation(LocalDateTime dateDeCreation) {
			this.dateDeCreation = dateDeCreation;
		}

		public int getIdEtape() {
			return idEtape;
		}

		public void setIdEtape(int idEtape) {
			this.idEtape = idEtape;
		}

		

	    // Constructeur par défaut
	    public Meuble() {
	    }

	    // Getters et Setters
	    public String getReference() {
	        return reference;
	    }

	    public void setReference(String reference) {
	        this.reference = reference;
	    }

	    public int getLargeur() {
	        return largeur;
	    }

	    public void setLargeur(int largeur) {
	        this.largeur = largeur;
	    }

	    public int getHauteur() {
	        return hauteur;
	    }

	    public void setHauteur(int hauteur) {
	        this.hauteur = hauteur;
	    }

	    public int getProfondeur() {
	        return profondeur;
	    }

	    public void setProfondeur(int profondeur) {
	        this.profondeur = profondeur;
	    }

	    public String getMateriau() {
	        return materiau;
	    }

	    public void setMateriau(String materiau) {
	        this.materiau = materiau;
	    }

	    public String getEtape() {
	        return etape;
	    }

	    public void setEtape(String etape) {
	        this.etape = etape;
	    }
	    
	    
	    ////////
	    public void setDateDeCreation(String dateDeCreation) {
	        // Convertir la chaîne en LocalDateTime
	        this.dateDeCreation = LocalDateTime.parse(dateDeCreation, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	    }
	    
	    public String formatDate() {
	        // Format pour afficher "19 Mai 2025 à 14h34"
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM yyyy 'à' HH'h'mm");
	        return dateDeCreation.format(formatter);
	    }

}
