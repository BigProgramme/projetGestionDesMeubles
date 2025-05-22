package model;

public class EtapeFabrication {

    private int idEtape;
    private String nomEtape;
    private int personnesNecessaires;

    // Constructeur par défaut
    public EtapeFabrication() {}

    // Constructeur avec paramètres
    public EtapeFabrication(int idEtape, String nomEtape, int personnesNecessaires) {
        this.idEtape = idEtape;
        this.nomEtape = nomEtape;
        this.personnesNecessaires = personnesNecessaires;
    }

    // Getters et Setters
    public int getIdEtape() {
        return idEtape;
    }

    public void setIdEtape(int idEtape) {
        this.idEtape = idEtape;
    }

    public String getNomEtape() {
        return nomEtape;
    }

    public void setNomEtape(String nomEtape) {
        this.nomEtape = nomEtape;
    }

    public int getPersonnesNecessaires() {
        return personnesNecessaires;
    }

    public void setPersonnesNecessaires(int personnesNecessaires) {
        this.personnesNecessaires = personnesNecessaires;
    }

    // toString (optionnel, utile pour debug)
    @Override
    public String toString() {
        return "EtapeFabrication{" +
               "idEtape=" + idEtape +
               ", nomEtape='" + nomEtape + '\'' +
               ", personnesNecessaires=" + personnesNecessaires +
               '}';
    }
}
