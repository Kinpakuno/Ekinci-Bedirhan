package com.example.logiciel_caisse;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class AjoutBD {
    //int id = 0;
    /*public static String getDate() {
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");//dd/MM/yyyy
        Date now = new Date();
        String strDate = sdfDate.format(now);
        return strDate;
    }

    public static String getHeure() {
        SimpleDateFormat sdfHeure = new SimpleDateFormat("HH:MM");
        Date now2 = new Date();
        String strHeure = sdfHeure.format(now2);
        return strHeure;
    }*/

    public static AjoutBD ajouter(Array liste_article, double prix_commande) {
        Connection connexion = null;
        //Object arr[] = liste_article.toArray();

        try {
            Class.forName("org.postgresql.Driver");
            connexion = DriverManager.getConnection("jdbc:postgresql:bd_magasin_0_8", "uti_gerant", "T5s3Re");
        } catch (ClassNotFoundException e) {
            System.err.println("erreur driver non trouvé");
        } catch (SQLException e) {
            System.err.println("erreur SQL au moment de la connexion");
        }

        // insertion
        PreparedStatement requete = null;

        try {
            requete = connexion.prepareStatement("INSERT INTO passage_caisse(id_passage, prix, date_passage, heure) VALUES (Default, ?, ?, ?)");
            requete.setDouble(1, prix_commande); // 3 correspond au 3ème point d'interrogation
            requete.setString(2, "2018-27-12");
            requete.setString(3, "10:29");

            requete.executeUpdate();

            //id a utilisé après pour l insert d'après
            int id = requete.executeUpdate("id");

        } catch (SQLException e) {
            e.printStackTrace(); // affichage de la trace du programme (utile pour le débogage)
            System.err.println("erreur lors de l'insertion");
            System.exit(1); // on arrête le programme
        }

        /*try {
            requete = connexion.prepareStatement("INSERT INTO jointure_produit_passage(id_jointure, id_passage_caisse, id_produit) VALUES (Default, ?, ?)");
            requete.setString(1, id);
            requete.setString(2, "10:29");

            requete.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // affichage de la trace du programme (utile pour le débogage)
            System.err.println("erreur lors de l'insertion");
            System.exit(1); // on arrête le programme
        }*/

        // la requête SQL qui a été exécutée est : insert into personne(id, nom, prenom, dateNaissance) values (1, 'MARTIN', 'Paul' '1981-05-23')
        System.out.println("insertion réussie");

        return null;
    }
}
