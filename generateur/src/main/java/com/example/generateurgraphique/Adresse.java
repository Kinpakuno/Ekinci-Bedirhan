package com.example.generateurgraphique;

public class Adresse extends Generateur {
    private Integer id;
    private Integer idClient;
    private Integer numero;
    private String voie;
    private String libelleVoie;
    private String codePostal;
    private String ville;

    public Adresse(Integer id, Integer idClient, Integer numero, String voie, String libelleVoie, String codePostal, String ville) {
        this.id = id;
        this.idClient = idClient;
        this.numero = numero;
        this.voie = voie;
        this.libelleVoie = libelleVoie;
        this.codePostal = codePostal;
        this.ville = ville;
    }

    public void afficher() {
        System.out.print(this.id + " - " + this.idClient + " - " + this.numero + " - " + this.voie + " - " + this.libelleVoie + " - " + this.codePostal + " - " + this.ville);
    }

    public int getId() {
        return this.id;
    }

    public int getIdClient() {
        return this.idClient;
    }

    public int getNumero() {
        return this.numero;
    }

    public String getVoie() {
        return this.voie;
    }

    public String getLibelleVoie() {
        return this.libelleVoie;
    }

    public String getCodePOstal() {
        return this.codePostal;
    }

    public String getVille() {
        return this.ville;
    }

    public int getId(int idClient) {
        return this.id;
    }

}
