package com.example.logiciel_caisse;

public class LigneProduit {
    private Produit produit;
    private int quantite;

    public LigneProduit(Produit produit) {
        this.produit = produit;
        this.quantite = 1;
    }

    public void incrementer() {
        this.quantite++;
    }

    public boolean contient(Produit produit) {
        return this.produit.getReference() == produit.getReference();
    }

    public Produit getProduit() {
        return produit;
    }

    public int getQuantite() {
        return quantite;
    }

    @Override
    public String toString() {
        return produit + " x" + quantite + " " + produit.getPrix() * quantite;
    }

}