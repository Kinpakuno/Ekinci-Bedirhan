package com.example.generateurgraphique;

public class Client extends Generateur {
    private Integer id;
    private String nom;
    private String prenom;
    private String dateNaissance;
    private String genre;
    private Integer parrain;

    public Client(Integer id, String nom, String prenom, String naissance, String genre, Integer parrain) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.dateNaissance = naissance;
        this.genre = genre;
        if (parrain <= 0) {
            this.parrain = 1;
        } else {
            this.parrain = parrain;
        }
    }

    public void afficher() {
        System.out.print(this.id + " - " + this.nom + " - " + this.prenom + " - " + this.dateNaissance + " - " + this.genre + " - " + this.parrain);
    }

    public int getId() {
        return this.id;
    }

    public String getNom() {
        return this.nom;
    }

    public String getPrenom() {
        return this.prenom;
    }

    public String getNaissance() {
        return this.dateNaissance;
    }

    public String getGenre() {
        return this.genre;
    }

    public int getParrain() {
        return this.parrain;
    }

}
