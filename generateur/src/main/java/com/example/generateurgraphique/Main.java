package com.example.generateurgraphique;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

import java.io.*;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;


public class Main extends Application {

    // mettre une icône pour l'appli V
    // mettre les nombres à droite V
    // bouton plus large, même taille V
    // choisir le fichier d'export V
    // enregistrer les paramètres dans un fichier de paramètre V
    // vérifier les données V

    @Override
    public void start(Stage fenetre) throws IOException {
        fenetre.setTitle("Générateur Interface graphique"); // titre de la fenêtre
        fenetre.getIcons().add(new Image(Main.class.getResourceAsStream("generateur.png"))); // mise en place d'une icône (visible dans le panneau)

        GridPane panneau = new GridPane();

        // étiquette
        Label etiquette = new Label("Nb max de commandes par client :");
        etiquette.setStyle("-fx-border-style: solid inside;" + "-fx-border-width: 2;" + "-fx-font-size: 15pt;");

        Label etiquette2 = new Label("Nb de clients :");
        etiquette2.setStyle("-fx-border-style: solid inside;" + "-fx-border-width: 2;" + "-fx-font-size: 15pt;");

        Label etiquette3 = new Label("Date de début :");
        etiquette3.setStyle("-fx-border-style: solid inside;" + "-fx-border-width: 2;" + "-fx-font-size: 15pt;");

        Label etiquette4 = new Label("Date de fin :");
        etiquette4.setStyle("-fx-border-style: solid inside;" + "-fx-border-width: 2;" + "-fx-font-size: 15pt;");

        Label etiquette5 = new Label("Nb max de produits par commande :");
        etiquette5.setStyle("-fx-border-style: solid inside;" + "-fx-border-width: 2;" + "-fx-font-size: 15pt;");

        Label etiquette6 = new Label("Nb de produits :");
        etiquette6.setStyle("-fx-border-style: solid inside;" + "-fx-border-width: 2;" + "-fx-font-size: 15pt;");

        Label etiquette7 = new Label("taux de parrainage :");
        etiquette7.setStyle("-fx-border-style: solid inside;" + "-fx-border-width: 2;" + "-fx-font-size: 15pt;");

        Label etiquette8 = new Label("Nb max d'adresses par client :");
        etiquette8.setStyle("-fx-border-style: solid inside;" + "-fx-border-width: 2;" + "-fx-font-size: 15pt;");

        String fichierParametre = "";
        File file = new File("parametre.txt");
        if (file.exists()) {
            try {
                BufferedReader entree = new BufferedReader(new FileReader("parametre.txt")); // ouverture en lecture
                String ligne = entree.readLine();
                while (ligne != null) {
                    fichierParametre = fichierParametre + ligne;
                    ligne = entree.readLine();
                }
                entree.close();
            } catch (IOException ex) {
                System.err.println("erreur de lecture");
                ex.printStackTrace();
                System.exit(2);
            }
        }
        String[] fichierParametre2 = fichierParametre.split("/");

        // zone de texte
        TextField texte1 = new TextField();
        texte1.setAlignment(Pos.CENTER_RIGHT);
        texte1.setMaxSize(140, 20); // dimension
        texte1.setTooltip(new Tooltip("Nb max de commandes par client")); // bulle d'aide
        if (file.exists()) {
            texte1.setText(fichierParametre2[0]);
        }

        // zone de texte
        TextField texte2 = new TextField();
        texte2.setAlignment(Pos.CENTER_RIGHT);
        texte2.setMaxSize(140, 20); // dimension
        texte2.setTooltip(new Tooltip("Nb de clients")); // bulle d'aide
        if (file.exists()) {
            texte2.setText(fichierParametre2[1]);
        }

        // zone de texte
        TextField texte3 = new TextField();
        texte3.setAlignment(Pos.CENTER_RIGHT);
        texte3.setMaxSize(140, 20); // dimension
        texte3.setTooltip(new Tooltip("aaaa-mm-jj")); // bulle d'aide
        if (file.exists()) {
            texte3.setText(fichierParametre2[2]);
        }

        // zone de texte
        TextField texte4 = new TextField();
        texte4.setAlignment(Pos.CENTER_RIGHT);
        texte4.setMaxSize(140, 20); // dimension
        texte4.setTooltip(new Tooltip("aaaa-mm-jj")); // bulle d'aide
        if (file.exists()) {
            texte4.setText(fichierParametre2[3]);
        }

        // zone de texte
        TextField texte5 = new TextField();
        texte5.setAlignment(Pos.CENTER_RIGHT);
        texte5.setMaxSize(140, 20); // dimension
        texte5.setTooltip(new Tooltip("Nb max de produits par commande")); // bulle d'aide
        if (file.exists()) {
            texte5.setText(fichierParametre2[4]);
        }

        // zone de texte
        TextField texte6 = new TextField();
        texte6.setAlignment(Pos.CENTER_RIGHT);
        texte6.setMaxSize(140, 20); // dimension
        texte6.setTooltip(new Tooltip("Nb de produits")); // bulle d'aide
        if (file.exists()) {
            texte6.setText(fichierParametre2[5]);
        }

        // zone de texte
        TextField texte7 = new TextField();
        texte7.setAlignment(Pos.CENTER_RIGHT);
        texte7.setMaxSize(140, 20); // dimension
        texte7.setTooltip(new Tooltip("En pourcentage (ex: 10)")); // bulle d'aide
        if (file.exists()) {
            texte7.setText(fichierParametre2[6]);
        }

        // zone de texte
        TextField texte8 = new TextField();
        texte8.setAlignment(Pos.CENTER_RIGHT);
        texte8.setMaxSize(140, 20); // dimension
        texte8.setTooltip(new Tooltip("Nb max d'adresses par client")); // bulle d'aide
        if (file.exists()) {
            texte8.setText(fichierParametre2[7]);
        }


        // création et configuration du bouton Mettre à Zéro
        Button bouton = new Button();
        bouton.setText("Générer");
        bouton.setStyle("-fx-alignment: center;" + "-fx-pref-width: 140px;");
        bouton.setOnAction((ActionEvent event) -> {
            int valide = 1;
            if (!texte1.getText().matches("(\\d)|(\\d\\d)|(\\d\\d\\d)|(\\d\\d\\d\\d)|(\\d\\d\\d\\d\\d)|(\\d\\d\\d\\d\\d\\d)") || texte1.getText() == null) {
                texte1.setStyle("-fx-background-color: yellow;"); // on passe le fond en jaune pour signaler l'erreur
                valide = 0;
            } else {
                texte1.setStyle("-fx-background-color: white;"); // on passe le fond en jaune pour signaler l'erreur
            }
            if (!texte2.getText().matches("(\\d)|(\\d\\d)|(\\d\\d\\d)|(\\d\\d\\d\\d)|(\\d\\d\\d\\d\\d)|(\\d\\d\\d\\d\\d\\d)") || texte2.getText() == null) {
                texte2.setStyle("-fx-background-color: yellow;"); // on passe le fond en jaune pour signaler l'erreur
                valide = 0;
            } else {
                texte2.setStyle("-fx-background-color: white;"); // on passe le fond en jaune pour signaler l'erreur
            }
            if (!texte3.getText().matches("^(\\d\\d\\d\\d)(-)(0[1-9]|1[012])(-)(0[1-9]|[12][0-9]|3[01])$") || texte3.getText() == null) {
                texte3.setStyle("-fx-background-color: yellow;"); // on passe le fond en jaune pour signaler l'erreur
                valide = 0;
            } else {
                texte3.setStyle("-fx-background-color: white;"); // on passe le fond en jaune pour signaler l'erreur
            }
            if (!texte4.getText().matches("^(\\d\\d\\d\\d)(-)(0[1-9]|1[012])(-)(0[1-9]|[12][0-9]|3[01])$") || texte4.getText() == null) {
                texte4.setStyle("-fx-background-color: yellow;"); // on passe le fond en jaune pour signaler l'erreur
                valide = 0;
            } else {
                texte4.setStyle("-fx-background-color: white;"); // on passe le fond en jaune pour signaler l'erreur
            }
            if (!texte5.getText().matches("(\\d)|(\\d\\d)|(\\d\\d\\d)|(\\d\\d\\d\\d)") || texte5.getText() == null) {
                texte5.setStyle("-fx-background-color: yellow;"); // on passe le fond en jaune pour signaler l'erreur
                valide = 0;
            } else {
                texte5.setStyle("-fx-background-color: white;"); // on passe le fond en jaune pour signaler l'erreur
            }
            if (!texte6.getText().matches("(\\d)|(\\d\\d)|(\\d\\d\\d)|(\\d\\d\\d\\d)") || texte6.getText() == null) {
                texte6.setStyle("-fx-background-color: yellow;"); // on passe le fond en jaune pour signaler l'erreur
                valide = 0;

            } else {
                texte6.setStyle("-fx-background-color: white;"); // on passe le fond en jaune pour signaler l'erreur
            }
            if (!texte7.getText().matches("(\\d)|(\\d\\d)|(100)") || texte7.getText() == null) {
                texte7.setStyle("-fx-background-color: yellow;"); // on passe le fond en jaune pour signaler l'erreur
                valide = 0;
            } else {
                texte7.setStyle("-fx-background-color: white;"); // on passe le fond en jaune pour signaler l'erreur
            }
            if (!texte8.getText().matches("(\\d)|(\\d\\d)") || texte8.getText() == null) {
                texte8.setStyle("-fx-background-color: yellow;"); // on passe le fond en jaune pour signaler l'erreur
                valide = 0;
            } else {
                texte8.setStyle("-fx-background-color: white;"); // on passe le fond en jaune pour signaler l'erreur
            }
            if (valide == 1) {
                try {
                    PrintWriter sortie = new PrintWriter("parametre.txt");  // ouverture de la sortie
                    sortie.println(texte1.getText() + "/" + texte2.getText() + "/" + texte3.getText() + "/" + texte4.getText() + "/" + texte5.getText() + "/" + texte6.getText() + "/" + texte7.getText() + "/" + texte8.getText());
                    sortie.close(); // fermeture de la sortie
                } catch (IOException ex) {
                    System.err.println("erreur");
                    ex.printStackTrace();
                    System.exit(1);
                }
                Generateur generateur = new Generateur(Integer.parseInt(texte1.getText()), Integer.parseInt(texte2.getText()), texte3.getText(), texte4.getText(), Integer.parseInt(texte5.getText()), Integer.parseInt(texte6.getText()), Integer.parseInt(texte7.getText()), Integer.parseInt(texte8.getText()));
                generateur.demarrer();


            }
        });


        // panneau sous forme de grille
        panneau.setGridLinesVisible(false); // utile pour le débogage : passer à true pour voir la grille
        panneau.setPadding(new Insets(20));
        panneau.setHgap(10); // écart horizontal
        panneau.setVgap(10); // écart vertical
        panneau.setStyle("-fx-border-style: solid inside;" + "-fx-border-width: 4;" + "-fx-border-radius: 5;" + "-fx-border-color: blue;");

        panneau.add(etiquette, 0, 0); // colonne 0, ligne 0
        panneau.add(etiquette2, 0, 1); // colonne 0, ligne 1
        panneau.add(etiquette3, 0, 2); // colonne 0, ligne 2
        panneau.add(etiquette4, 0, 3); // colonne 0, ligne 3
        panneau.add(etiquette5, 0, 4); // colonne 0, ligne 4
        panneau.add(etiquette6, 0, 5); // colonne 0, ligne 5
        panneau.add(etiquette7, 0, 6); // colonne 0, ligne 6
        panneau.add(etiquette8, 0, 7); // colonne 0, ligne 7

        panneau.add(texte1, 1, 0); // colonne 1, ligne 0
        panneau.add(texte2, 1, 1); // colonne 1, ligne 1
        panneau.add(texte3, 1, 2); // colonne 1, ligne 2
        panneau.add(texte4, 1, 3); // colonne 1, ligne 3
        panneau.add(texte5, 1, 4); // colonne 1, ligne 4
        panneau.add(texte6, 1, 5); // colonne 1, ligne 5
        panneau.add(texte7, 1, 6); // colonne 1, ligne 6
        panneau.add(texte8, 1, 7); // colonne 1, ligne 7

        panneau.add(bouton, 1, 9); // colonne 1, ligne 9

        fenetre.setScene(new Scene(panneau, 580, 400)); // ajout du panneau à une scène, ajout de la scène à la fenêtre
        fenetre.show(); // affichage de la fenêtre
    }

    public static void main(String[] args) {
        launch();
    }

    public String getFichierExport() {
        // choix du fichier
        AtomicReference<String> choixDuFichier = new AtomicReference<>("");
        TextInputDialog dialogue = new TextInputDialog();

        dialogue.setTitle("Nom du fichier d'export");
        dialogue.setHeaderText("");
        dialogue.setContentText("fichier : ");

        AtomicReference<Optional<String>> resultat = new AtomicReference<>(dialogue.showAndWait()); // affiche la fenêtre des dialogues et attend la réponse
        resultat.get().ifPresent(fichier -> {
            if (fichier != null) {
                choixDuFichier.set(fichier);
            }
        });
        return choixDuFichier.toString() + ".txt";
    }

}
