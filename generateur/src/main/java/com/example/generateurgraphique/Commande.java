package com.example.generateurgraphique;

public class Commande extends Generateur {
    private Integer id;
    private Integer idClient;
    private String date;
    private Integer idLivraison;
    private Integer idPaiement;

    public Commande(Integer id, Integer idClient, String date, Integer idLivraison, Integer idPaiement) {
        super();
        this.id = id;
        this.idClient = idClient;
        this.date = date;
        this.idLivraison = idLivraison;
        this.idPaiement = idPaiement;

    }

    public void afficher() {
        System.out.print(this.id + " - " + this.idClient + " - " + this.date + " - " + this.idLivraison + " - " + this.idPaiement);
    }

    public int getId() {
        return this.id;
    }

    public int getIdClient() {
        return this.idClient;
    }

    public String getDate() {
        return this.date;
    }

    public int getIdLivraison() {
        return this.idLivraison;
    }

    public int getIdPaiement() {
        return this.idPaiement;
    }

}
