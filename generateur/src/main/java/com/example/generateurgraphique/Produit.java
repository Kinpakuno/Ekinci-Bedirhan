package com.example.generateurgraphique;

public class Produit extends Generateur {
    private Integer ref;
    private String nom;
    private Double prix;
    private Integer idCategorie;

    public Produit(Integer ref, String nom, Double prix, Integer idCategorie) {
        this.ref = ref;
        this.nom = nom;
        this.prix = prix;
        this.idCategorie = idCategorie;
    }

    public void afficher() {
        System.out.print(this.ref + " - " + this.nom + " - " + this.prix + " - " + this.idCategorie);
    }

    public int getRef() {
        return this.ref;
    }

    public int getRef(int id) {
        return this.ref;
    }

    public String getNom() {
        return this.nom;
    }

    public double getPrix() {
        return this.prix;
    }

    public int getIdCategorie() {
        return this.idCategorie;
    }
}
