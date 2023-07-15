package com.example.generateurgraphique;

public class Categorie extends Generateur {
    private Integer id;
    private String libelle;
    private Integer prixMin;
    private Integer prixMax;

    public Categorie(Integer id, String libelle, Integer prixMin, Integer prixMax) {
        this.id = id;
        this.libelle = libelle;
        this.prixMin = prixMin;
        this.prixMax = prixMax;

    }

    public void afficher() {
        System.out.print(this.id + " - " + this.libelle + " - " + this.prixMin + " - " + this.prixMax);
    }

    public int getId() {
        return this.id;
    }

    public int getId(int id) {
        return this.id;
    }

    public String getLibelle() {
        return this.libelle;
    }

    public int getPrixMin(int id) {
        return this.prixMin;
    }

    public int getPrixMax(int id) {
        return this.prixMax;
    }
}
