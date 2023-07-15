package com.example.generateurgraphique;

public class Porter extends Generateur {
    private Integer idCommande;
    private Integer refProduit;
    private Integer quantite;

    public Porter(Integer idCommande, Integer refProduit, Integer quantite) {
        this.idCommande = idCommande;
        this.refProduit = refProduit;
        this.quantite = quantite;
    }

    public void afficher() {
        System.out.print(this.idCommande + " - " + this.refProduit + " - " + this.quantite);
    }

    public int getIdCommande() {
        return this.idCommande;
    }

    public int getRefProduit() {
        return this.refProduit;
    }

    public int getQuantite() {
        return this.quantite;
    }
}
