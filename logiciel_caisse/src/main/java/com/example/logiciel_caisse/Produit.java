package com.example.logiciel_caisse;

import java.sql.*;

public class Produit {
    private int reference;
    private String nom;
    private double prix;

    public Produit(int reference, String nom, double prix) {
        this.reference = reference;
        this.nom = nom;
        this.prix = prix;
    }

    public static Produit rechercher(int reference) {
        //recherche du produit dans la BD à partir de la référence
        Produit produit = null;
        Connection connexion = null;

        try {
            Class.forName("org.postgresql.Driver");
            connexion = DriverManager.getConnection("jdbc:postgresql:bd_magasin_0_8", "uti_gerant", "T5s3Re");
        } catch (ClassNotFoundException e) {
            System.err.println("erreur driver non trouvé");
        } catch (SQLException e) {
            System.err.println("erreur SQL au moment de la connexion");
        }

        // sélection
        PreparedStatement requete = null;
        ResultSet resultat = null; // représente le résultat de la requête
        try {
            requete = connexion.prepareStatement("SELECT * FROM produit WHERE ref = ?");
            requete.setInt(1, reference);
            resultat = requete.executeQuery();
            if (resultat.next()) {
                String nom = resultat.getString("nom");
                Double prix = resultat.getDouble("prix");
                produit = new Produit(reference, nom, prix);
            }
        } catch (SQLException e) {
            //e.printStackTrace(); // affichage de la trace du programme (utile pour le débogage)
            System.err.println("erreur lors de la sélection");
            //System.exit(1); // on arrête le programme
        }
        return produit;
    }

    @Override
    public String toString() {
        return nom + " " + prix + " €";
    }

    public Double getPrix() {
        return this.prix;
    }

    public int getReference() {
        return reference;
    }

    public String getNom() {
        return this.nom;
    }
}