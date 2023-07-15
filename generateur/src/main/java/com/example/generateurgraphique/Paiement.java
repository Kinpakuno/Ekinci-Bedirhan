package com.example.generateurgraphique;

public class Paiement extends Generateur {
    private Integer id;
    private String libelle;

    public Paiement(Integer id, String libelle) {
        this.id = id;
        this.libelle = libelle;

    }

    public void afficher() {
        System.out.print(this.id + " - " + this.libelle);
    }

    public int getId() {
        return this.id;
    }

    public String getLibelle() {
        return this.libelle;
    }

}
