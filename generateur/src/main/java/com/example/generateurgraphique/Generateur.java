package com.example.generateurgraphique;


import java.util.Scanner;
import java.util.ArrayList;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;

/**
 * Cette classe fournit un jeu d'essai SQL.
 * <p>
 * Dans cette version, on possède la génération des clients, des adresses, des commandes, des paiements et des categories.
 * <p>
 * Pour simplifier, on suppose ici que l'utilisateur ne fait pas d'erreurs de saisie.
 *
 * @author Gabriel HAUSS / Thomas SOARES
 * @version graphique
 */

public class Generateur extends Main {
    // variable d'instances
    private Scanner scanner;
    private Integer nbClients;
    private Integer nbMaxCommandesClients;
    private Integer nbCommandes;
    private String dateDebuts;
    private String dateFins;
    private Integer nbMaxProduitsCommandes;
    private Integer nbProduits;
    private Integer TauxParrainages;
    private Integer nbMaxAdresseClients;
    private ArrayList<Client> c1;
    private ArrayList<Adresse> a1;
    private ArrayList<Paiement> p1;
    private ArrayList<Commande> c2;
    private ArrayList<Categorie> c3;
    private ArrayList<Produit> p2;
    private ArrayList<Porter> p3;
    private ArrayList<String> noms;
    private ArrayList<String> prenoms;
    private ArrayList<String> naissances;
    private ArrayList<String> voies;
    private ArrayList<String> libelle_voies;
    private ArrayList<String> villes;
    private ArrayList<String> Paiements;
    private ArrayList<String> Categories;
    private ArrayList<String> nomProdPrefixe;
    private ArrayList<String> nomProd;
    private ArrayList<String> nomProdSuffixe;


    /**
     * <u>Générateur</u> : constructeur
     */
    public Generateur(Integer nbMaxCommandesClient, Integer nbClient, String dateDebut, String dateFin, Integer nbMaxProduitsCommande, Integer nbProduit, Integer TauxParrainage, Integer nbMaxAdresseClient) {
        scanner = new Scanner(System.in);
        c1 = new ArrayList<>();
        a1 = new ArrayList<>();
        p1 = new ArrayList<>();
        p2 = new ArrayList<>();
        p3 = new ArrayList<>();
        c2 = new ArrayList<>();
        c3 = new ArrayList<>();
        noms = new ArrayList<>();
        prenoms = new ArrayList<>();
        naissances = new ArrayList<>();
        voies = new ArrayList<>();
        libelle_voies = new ArrayList<>();
        villes = new ArrayList<>();
        Paiements = new ArrayList<>();
        Categories = new ArrayList<>();
        nomProdPrefixe = new ArrayList<>();
        nomProd = new ArrayList<>();
        nomProdSuffixe = new ArrayList<>();
        nbCommandes = 0;
        nbClients = nbClient;
        nbMaxCommandesClients = nbMaxCommandesClient;
        dateDebuts = dateDebut;
        dateFins = dateFin;
        nbMaxProduitsCommandes = nbMaxProduitsCommande;
        nbProduits = nbProduit;
        TauxParrainages = TauxParrainage;
        nbMaxAdresseClients = nbMaxAdresseClient;
    }

    public Generateur() {

    }

    /**
     * <u>la méthode demarrer</u> : démarre l'application proprement dite <br>
     * <p>On retrouve un menu avec les actions de base <br>
     * mettre à jour / ajouter / supprimer / consulter <br>
     * puis envoie vers les méthodes correspondantes au choix de l'utilisateur
     * </p>
     */
    public void demarrer() {
        lireFichiersDonnees();
        genererClient();
        genererAdresse();
        genererPaiement();
        genererCommande();
        genererCategorie();
        genererProduit();
        genererPorter();
        ecrireSQL();

    }

    private void lireFichiersDonnees() {
        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/noms.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                noms.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }

        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/prenoms.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                prenoms.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }

        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/naissance.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                naissances.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }

        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/voies.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                voies.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }

        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/libellesVoies.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                libelle_voies.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }

        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/villes.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                villes.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }

        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/paiements.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                Paiements.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }

        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/categories.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                Categories.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }

        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/nom_prod.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                nomProd.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }

        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/nom_prod-prefixes.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                nomProdPrefixe.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }

        try {
            BufferedReader entree = new BufferedReader(new FileReader("/home/slam/IdeaProjects/Generateur/GenerateurGraphique/src/main/java/com/example/generateurgraphique/ressources/nom_prod-suffixes.txt")); // ouverture en lecture
            String ligne = entree.readLine();
            while (ligne != null) {
//                 System.out.println(ligne);
                nomProdSuffixe.add(ligne);
                ligne = entree.readLine();
            }
            entree.close();  // fermeture du fichier
        } catch (IOException ex) {
            System.err.println("erreur de lecture"); // écriture sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution
            System.exit(2); // fin du programme avec le code d'erreur 2
        }
    }

    private void genererClient() {
        int nbrdm = 0;
        int parrain = 0;
        String nomInsert = "";
        String prenomInsert = "";
        String date_naissance = "";

        for (int i = 0; i < nbClients; i++) {
            nbrdm = nbAleatoire(0, 65199);
            nomInsert = noms.get(nbrdm);
            nbrdm = nbAleatoire(0, 49);
            prenomInsert = prenoms.get(nbrdm);
            String[] preInsert = prenomInsert.split(";");
            nbrdm = nbAleatoire(0, 67);
            date_naissance = naissances.get(nbrdm);
            nbrdm = nbAleatoire(0, i - 1);
            parrain = nbrdm;
            c1.add(new Client(i + 1, nomInsert, preInsert[1], date_naissance, preInsert[0], parrain));
        }

    }

    private void genererAdresse() {
        int id = 1;
        int nbrdm = 0;
        int nbrdmAdresse = 0;
        int numero = 0;
        String voie = "";
        String libelle_voie = "";
        String infosVille = "";
        String codePostal = "";
        String ville = "";

        for (int i = 0; i < nbClients; i++) {
            nbrdmAdresse = nbAleatoire(1, nbMaxAdresseClients);
            for (int j = 0; j < nbrdmAdresse; j++) {
                numero = nbAleatoire(1, 100);
                nbrdm = nbAleatoire(0, 5);
                voie = voies.get(nbrdm);
                nbrdm = nbAleatoire(0, 7);
                libelle_voie = libelle_voies.get(nbrdm);
                nbrdm = nbAleatoire(0, 5);
                infosVille = villes.get(nbrdm);
                String[] preVille = infosVille.split(";");
                codePostal = preVille[0];
                ville = preVille[1];
                a1.add(new Adresse(id, i+1, numero, voie, libelle_voie, codePostal, ville));
                id++;
            }
        }

    }

    private void genererPaiement() {
        String libelle = "";

        for (int i = 0; i < 3; i++) {
            libelle = Paiements.get(i);
            p1.add(new Paiement(i+1, libelle));
        }

    }

    private void genererCommande() {
        int id = 1;
        int nbrdm = 0;
        int nbrdm1 = 0;
        int nbrdm2 = 0;
        int nbrdmCommande = 0;
        int idLivraison = 0;
        int idPaiement = 0;
        int tour = 1;
        String nbrdm3 = "";
        String date = "";
        ArrayList<Integer> idClient2;

        for (int i = 0; i < nbClients; i++) {
            nbrdmCommande = nbAleatoire(1, nbMaxCommandesClients);
            idClient2 = new ArrayList<>();
            int taille = 0;
            for (Adresse a : a1) { // pour chaque p (de type Personne) de (la collection) personne
                if (a.getIdClient() == (i+1)) {
                    idClient2.add(a.getId());
                    taille++;
                }
            }

            for (int j = 0; j < nbrdmCommande; j++) {
                nbrdm = nbAleatoire(0, (taille - 1));
                idLivraison = idClient2.get(nbrdm);
                String[] dateDepart = dateDebuts.split("-");
                String[] dateFin = dateFins.split("-");
                nbrdm = nbAleatoire(Integer.parseInt(dateDepart[0]), Integer.parseInt(dateFin[0]));
                nbrdm1 = nbAleatoire(Integer.parseInt(dateDepart[1]), Integer.parseInt(dateFin[1]));
                nbrdm2 = nbAleatoire(Integer.parseInt(dateDepart[2]), Integer.parseInt(dateFin[2]));
                nbrdm3 = Integer.toString(nbrdm2);
                if (nbrdm2 < 10) {
                    nbrdm3 = "0" + Integer.toString(nbrdm2);
                }
                date = Integer.toString(nbrdm) + "-" +Integer.toString(nbrdm1) + "-" + nbrdm3;
                idPaiement = nbAleatoire(1, 3);
                c2.add(new Commande(id, i+1, date, idLivraison, idPaiement));
                id++;
                tour++;
                nbCommandes++;
            }
        }

    }

    private void genererCategorie() {
        int id = 0;
        String Prelibelle = "";

        for (int i = 0; i < 6; i++) {
            Prelibelle = Categories.get(i);
            String[] libelle = Prelibelle.split(";");
            id = i + 1;
            c3.add(new Categorie(id, libelle[0], Integer.parseInt(libelle[1]), Integer.parseInt(libelle[2])));
        }
        // libelle, prix min, prix max
    }

    private void genererProduit() {
        int nbrdm1 = 0;
        int nbrdm2 = 0;
        int nbrdm3 = 0;
        int ref = 0;
        int idCate = 0;
        int prixMin = 0;
        int prixMax = 0;
        double prix = 0.0;
        String nom = "";
        String depPrix = "";

        for (int i = 0; i < nbProduits; i++) {
            ref = i + 1;
            nbrdm1 = nbAleatoire(0, 10);
            nbrdm2 = nbAleatoire(0, 13);
            nbrdm3 = nbAleatoire(0, 7);
            nom = nomProdPrefixe.get(nbrdm1) + nomProd.get(nbrdm2) + nomProdSuffixe.get(nbrdm3);
            nbrdm1 = nbAleatoire(0, 5);
            for (Categorie c : c3) {
                if (c.getId() == nbrdm1) {
                    prixMin = c.getPrixMin(nbrdm1);
                    prixMax = c.getPrixMax(nbrdm1);
                    idCate = c.getId();
//                    System.out.println(c.getId());
                }
            }
            nbrdm1 = nbAleatoire(prixMin, prixMax);
            nbrdm2 = nbAleatoire(prixMin, prixMax-1);
//            System.out.println(nbrdm1);
//            System.out.println(nbrdm2);
            depPrix = Integer.toString(nbrdm1) + "." + Integer.toString(nbrdm2);
            prix = Double.parseDouble(depPrix);
            if (prix == 0.0) {
                prix = 1.5;
            }
            p2.add(new Produit(ref, nom, prix, idCate));

        }
    }

    private void genererPorter() {
        int idCommande = 0;
        int refProduit = 0;
        int quantite = 0;

        for (int i = 0; i < nbCommandes; i++) {
            for (Commande c : c2) {
                if (c.getId() == i + 1) {
                    idCommande = c.getId();
                }
            }

            refProduit = nbAleatoire(1, nbProduits);
            quantite = nbAleatoire(1, nbMaxProduitsCommandes);

            p3.add(new Porter(idCommande, refProduit, quantite));
        }
    }

    private void ecrireSQL() {
        try {
            Main main = new Main();
            String fichier = main.getFichierExport();
            PrintWriter sortie = new PrintWriter(fichier);  // ouverture de la sortie

            sortie.println("\\c bd_magasin_0_8");

            for (Client c : c1) { // pour chaque p (de type Personne) de (la collection) personnes
                sortie.print("INSERT INTO client (id, nom, prenom, date_naissance, genre, parrain) VALUES ");
                sortie.print("(");
                sortie.print(c.getId());
                sortie.print(", '");
                sortie.print(c.getNom());
                sortie.print("', '");
                sortie.print(c.getPrenom());
                sortie.print("', '");
                sortie.print(c.getNaissance());
                sortie.print("', '");
                sortie.print(c.getGenre());
                sortie.print("', ");
                sortie.print(c.getParrain());
                sortie.println(");");
            }

            for (Adresse a : a1) { // pour chaque p (de type Personne) de (la collection) personnes
                sortie.print("INSERT INTO adresse (id, id_client, numero, voie, libelle_voie, code_postal, ville) VALUES ");
                sortie.print("(");
                sortie.print(a.getId());
                sortie.print(", ");
                sortie.print(a.getIdClient());
                sortie.print(", ");
                sortie.print(a.getNumero());
                sortie.print(", '");
                sortie.print(a.getVoie());
                sortie.print("', '");
                sortie.print(a.getLibelleVoie());
                sortie.print("', '");
                sortie.print(a.getCodePOstal());
                sortie.print("', '");
                sortie.print(a.getVille());
                sortie.println("');");
            }

            for (Paiement p : p1) { // pour chaque p (de type Personne) de (la collection) personnes
                sortie.print("INSERT INTO paiement (id, libelle) VALUES ");
                sortie.print("(");
                sortie.print(p.getId());
                sortie.print(", '");
                sortie.print(p.getLibelle());
                sortie.println("');");
            }

            for (Commande c : c2) { // pour chaque p (de type Personne) de (la collection) personnes
                sortie.print("INSERT INTO commande (id, id_client, la_date, id_adr_livraison, id_paiement) VALUES ");
                sortie.print("(");
                sortie.print(c.getId());
                sortie.print(", ");
                sortie.print(c.getIdClient());
                sortie.print(", '");
                sortie.print(c.getDate());
                sortie.print("', ");
                sortie.print(c.getIdLivraison());
                sortie.print(", ");
                sortie.print(c.getIdPaiement());
                sortie.println(");");
            }

            for (Categorie c : c3) { // pour chaque p (de type Personne) de (la collection) personnes
                sortie.print("INSERT INTO categorie (id, libelle) VALUES ");
                sortie.print("(");
                sortie.print(c.getId());
                sortie.print(", '");
                sortie.print(c.getLibelle());
                sortie.println("');");
            }

            for (Produit p : p2) { // pour chaque p (de type Personne) de (la collection) personnes
                sortie.print("INSERT INTO produit (ref, nom, prix, id_categorie) VALUES ");
                sortie.print("(");
                sortie.print(p.getRef());
                sortie.print(", '");
                sortie.print(p.getNom());
                sortie.print("', ");
                sortie.print(p.getPrix());
                sortie.print(", ");
                sortie.print(p.getIdCategorie());
                sortie.println(");");
            }

            for (Porter p : p3) { // pour chaque p (de type Personne) de (la collection) personnes
                sortie.print("INSERT INTO porter (id_commande, ref_produit, quantite) VALUES ");
                sortie.print("(");
                sortie.print(p.getIdCommande());
                sortie.print(", ");
                sortie.print(p.getRefProduit());
                sortie.print(", ");
                sortie.print(p.getQuantite());
                sortie.println(");");
            }


            sortie.close(); // fermeture de la sortie
        } catch (IOException ex) { // gestion d'une éventuel comportement inattendu (exception)
            System.err.println("erreur"); // écriture d'un message sur la sortie erreur standard
            ex.printStackTrace(); // écriture de la trace d'éxecution (à utiliser pour déboguer)
            System.exit(1); // fin du programme avec le code d'erreur 1
        }
    }

    /**
     * renvoie un nombre entier (de type int) compris entre min (inclus) et max
     * (inclus)
     */
    private int nbAleatoire(int min, int max) {
        return ((int) Math.round(Math.random() * (max - min))) + min;
    }


}
