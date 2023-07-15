package com.example.logiciel_caisse;

import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.Background;
import javafx.scene.layout.GridPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
//import org.apache.pdfbox.pdmodel.edit.PDPageContentStream;

import static java.lang.Math.round;

public class Main extends Application {
    private Double total;
    ObservableList<String> produitObs = FXCollections.observableArrayList();
    private int numCommande;
    private String[][] ListePause;
    ListView listView = new ListView<>();
    ListView listView2 = new ListView<>();
    private Double totalPause;
    private Double remise;
    private Array listeIdProduit;
    private int i;


    public Main() {
        this.ListePause = new String[10][10];
        this.total = 0.0;
        this.numCommande = 0;
        this.totalPause = 0.0;
        this.remise = 0.0;
        this.listeIdProduit = new Array(){
            @Override
            public String getBaseTypeName() throws SQLException {
                return null;
            }

            @Override
            public int getBaseType() throws SQLException {
                return 0;
            }

            @Override
            public Object getArray() throws SQLException {
                return null;
            }

            @Override
            public Object getArray(Map<String, Class<?>> map) throws SQLException {
                return null;
            }

            @Override
            public Object getArray(long index, int count) throws SQLException {
                return null;
            }

            @Override
            public Object getArray(long index, int count, Map<String, Class<?>> map) throws SQLException {
                return null;
            }

            @Override
            public ResultSet getResultSet() throws SQLException {
                return null;
            }

            @Override
            public ResultSet getResultSet(Map<String, Class<?>> map) throws SQLException {
                return null;
            }

            @Override
            public ResultSet getResultSet(long index, int count) throws SQLException {
                return null;
            }

            @Override
            public ResultSet getResultSet(long index, int count, Map<String, Class<?>> map) throws SQLException {
                return null;
            }

            @Override
            public void free() throws SQLException {

            }
        };
        this.i = 0;
    }

    public static void main(String[] args) {
        launch();
    }

    @Override
    public void start(Stage fenetre) throws IOException {
        Passage passage = new Passage();

        ListView<LigneProduit> lvLignesProduit = new ListView<>();
        lvLignesProduit.setItems(passage.getListeLignesProduit());
        ObservableList<Produit> listProduit = FXCollections.observableArrayList();

        ListView<Produit> listeProduit = new ListView<>();
        listeProduit.setItems(listProduit);

        ListView<LigneProduit> lvLignesProduit2 = new ListView<>();
        lvLignesProduit2.setItems(passage.getListeLignesProduit());
        ObservableList<Produit> listProduit2 = FXCollections.observableArrayList();

        ListView<Produit> listeProduit2 = new ListView<>();
        listeProduit2.setItems(listProduit2);

        TextArea affichage = new TextArea();
        affichage.setMaxSize(1000, 500); // dimension
        affichage.setEditable(false);

        TextArea affichageTotal = new TextArea();
        affichageTotal.setMaxSize(1000, 1); // dimension
        affichageTotal.setEditable(false);

        TextField texte = new TextField();
        texte.setMaxSize(1000, 500); // dimension

        TextArea affichage2 = new TextArea();
        affichage2.setMaxSize(1000, 1000); // dimension
        affichage2.setEditable(false);

        TextField montantDu = new TextField();
        montantDu.setEditable(false);
        montantDu.setVisible(false);

        TextField montantDonnee = new TextField();
        montantDonnee.setEditable(false);
        montantDonnee.setVisible(false);

        TextField montantARendre = new TextField();
        montantARendre.setEditable(false);
        montantARendre.setVisible(false);

        TextField espece = new TextField();
        espece.setVisible(false);
        espece.setEditable(true);

        TextField txtremise = new TextField();
        txtremise.setEditable(true);

        Button bouton1 = new Button();
        bouton1.setText("1");
        bouton1.setMinWidth(30);
        bouton1.setMinHeight(30);
        bouton1.setOnAction((ActionEvent event1) -> {
            texte.appendText("1");
        });

        Button bouton2 = new Button();
        bouton2.setText("2");
        bouton2.setMinWidth(30);
        bouton2.setMinHeight(30);
        bouton2.setOnAction((ActionEvent event1) -> {
            texte.appendText("2");
        });

        Button bouton3 = new Button();
        bouton3.setText("3");
        bouton3.setMinWidth(30);
        bouton3.setMinHeight(30);
        bouton3.setOnAction((ActionEvent event1) -> {
            texte.appendText("3");
        });

        Button bouton4 = new Button();
        bouton4.setText("4");
        bouton4.setMinWidth(30);
        bouton4.setMinHeight(30);
        bouton4.setOnAction((ActionEvent event1) -> {
            texte.appendText("4");
        });

        Button bouton5 = new Button();
        bouton5.setText("5");
        bouton5.setMinWidth(30);
        bouton5.setMinHeight(30);
        bouton5.setOnAction((ActionEvent event1) -> {
            texte.appendText("5");
        });

        Button bouton6 = new Button();
        bouton6.setText("6");
        bouton6.setMinWidth(30);
        bouton6.setMinHeight(30);
        bouton6.setOnAction((ActionEvent event1) -> {
            texte.appendText("6");
        });

        Button bouton7 = new Button();
        bouton7.setText("7");
        bouton7.setMinWidth(30);
        bouton7.setMinHeight(30);
        bouton7.setOnAction((ActionEvent event1) -> {
            texte.appendText("7");
        });

        Button bouton8 = new Button();
        bouton8.setText("8");
        bouton8.setMinWidth(30);
        bouton8.setMinHeight(30);
        bouton8.setOnAction((ActionEvent event1) -> {
            texte.appendText("8");
        });

        Button bouton9 = new Button();
        bouton9.setText("9");
        bouton9.setMinWidth(30);
        bouton9.setMinHeight(30);
        bouton9.setOnAction((ActionEvent event1) -> {
            texte.appendText("9");
        });

        Button bouton10 = new Button();
        bouton10.setText("0");
        bouton10.setMinWidth(30);
        bouton10.setMinHeight(30);
        bouton10.setOnAction((ActionEvent event1) -> {
            texte.appendText("0");
        });

        Button boutonImpressionTicket = new Button();
        boutonImpressionTicket.setText("Imprimer le ticket");
        boutonImpressionTicket.setMinWidth(30);
        boutonImpressionTicket.setMinHeight(30);
        boutonImpressionTicket.setOnAction((ActionEvent event1) -> {
            ticket(total, produitObs);

            //AjoutBD passage2 = AjoutBD.ajouter(listeIdProduit, total);
        });

        Button boutonValide2 = new Button();
        boutonValide2.setText("ok");
        boutonValide2.setVisible(false);
        boutonValide2.setMinHeight(20);
        boutonValide2.setMinWidth(20);
        boutonValide2.setOnAction(event -> {
            montantARendre.setVisible(true);
            Double rendre = Double.parseDouble(espece.getText()) - total;
            rendre = round(rendre * 100.0) / 100.0;
            montantARendre.appendText("A rendre : " + rendre + "€");

            boutonImpressionTicket.setVisible(true);
        });

        Button boutonValide3 = new Button();
        boutonValide3.setText("ok");
        boutonValide3.setVisible(false);
        boutonValide3.setMinHeight(20);
        boutonValide3.setMinWidth(20);
        boutonValide3.setOnAction(event -> {
            boutonImpressionTicket.setVisible(true);
        });

        Image img = new Image("file:///home/slam/public_html/java/projet/logiciel_caisse/src/main/java/com/example/logiciel_caisse/fleche.png");
        ImageView view = new ImageView(img);
        view.setFitWidth(25);
        view.setFitHeight(25);
        view.setPreserveRatio(true);

        Button boutonEspece = new Button();
        boutonEspece.setText("espèce");
        boutonEspece.setMinWidth(20);
        boutonEspece.setMinHeight(20);
        boutonEspece.setOnAction(event -> {
            montantDu.appendText("Montant dû est de : " + total + "€");
            montantDonnee.appendText("Montant donnée : ");
            montantDonnee.setVisible(true);
            espece.setVisible(true);
            boutonValide2.setVisible(true);
            montantDu.setVisible(true);
        });

        Button boutonCB = new Button();
        boutonCB.setText("carte");
        boutonCB.setMinWidth(20);
        boutonCB.setMinHeight(20);
        boutonCB.setOnAction(event -> {
            montantDu.appendText("Montant dû est de : " + total + "€");
            montantDu.setVisible(true);
            boutonValide3.setVisible(true);
        });

        Button boutonCheque = new Button();
        boutonCheque.setText("chèque");
        boutonCheque.setMinWidth(20);
        boutonCheque.setMinHeight(20);
        boutonCheque.setOnAction(event -> {
            montantDu.appendText("Montant dû est de : " + total + "€");
            montantDonnee.appendText("Montant donnée : ");
            montantDonnee.setVisible(true);
            montantDu.setVisible(true);
            espece.setVisible(true);
            boutonValide3.setVisible(true);
        });

        Button boutonRemisePourcentage = new Button();
        boutonRemisePourcentage.setText("%");
        boutonRemisePourcentage.setOnAction(event -> {
            remise = Double.parseDouble(txtremise.getText());
            total = total - (total * remise / 100);
            affichageTotal.clear();
            affichageTotal.appendText(String.valueOf(round(total * 100.0) / 100.0));
        });

        Button boutonRemiseEuros = new Button();
        boutonRemiseEuros.setText("€");
        boutonRemiseEuros.setOnAction(event -> {
            remise = Double.parseDouble(txtremise.getText());
            total = total - remise;
            affichageTotal.clear();
            affichageTotal.appendText(String.valueOf(round(total * 100.0) / 100.0));
        });
        fenetre.show();

        Button reprendreCommande = new Button();
        reprendreCommande.setText("reprendre");
        reprendreCommande.setMinWidth(30);
        reprendreCommande.setMinHeight(30);
        reprendreCommande.setOnAction((ActionEvent event1) -> {
            produitObs.clear();

            total = totalPause;
            for (LigneProduit i : passage.getListeLignesProduit()) {
                produitObs.add(String.valueOf(i));
            }
            affichageTotal.appendText(String.valueOf(total) + "€");

            affichage2.clear();
        });

        //rajouter des tooltip
        Image img4 = new Image("file:///home/slam/public_html/java/projet/logiciel_caisse/src/main/java/com/example/logiciel_caisse/pause.png");
        ImageView view4 = new ImageView(img4);
        view4.setFitWidth(20);
        view4.setFitHeight(30);
        view4.setPreserveRatio(true);

        Button boutonpause = new Button();
        boutonpause.setGraphic(view4);
        boutonpause.setText("pause");
        boutonpause.setMinWidth(20);
        boutonpause.setMinHeight(20);
        boutonpause.setOnAction((ActionEvent event1) -> {
            totalPause = total;
            total = 0.0;
            affichage2.appendText("Une liste est en attente veuillez cliquer sur reprendre.");
            listView.getItems().clear();
            affichage.clear();
            affichageTotal.clear();
        });

        Image img2 = new Image("file:///home/slam/public_html/java/projet/logiciel_caisse/src/main/java/com/example/logiciel_caisse/delete(1).png");
        ImageView view2 = new ImageView(img2);
        view2.setFitWidth(20);
        view2.setFitHeight(30);
        view2.setPreserveRatio(true);

        Button boutondelete = new Button();
        boutondelete.setGraphic(view2);
        boutondelete.setMinWidth(10);
        boutondelete.setMinHeight(29.5);
        boutondelete.setOnAction((ActionEvent event1) -> {
            if (texte.getText().length() != 0) {
                texte.deleteText(texte.getText().length() - 1, texte.getText().length());
            }
        });

        Button boutonAnnulerPassage = new Button();
        boutonAnnulerPassage.setGraphic(view2);
        boutonAnnulerPassage.setMinWidth(10);
        boutonAnnulerPassage.setMinHeight(29.5);
        boutonAnnulerPassage.setOnAction((ActionEvent event1) -> {
            listView.getItems().clear();
            affichage.clear();
            total = 0.0;
            affichageTotal.clear();
        });

        Image img3 = new Image("file:///home/slam/public_html/java/projet/logiciel_caisse/src/main/java/com/example/logiciel_caisse/coche.png");
        ImageView view3 = new ImageView(img3);
        view3.setFitWidth(20);
        view3.setFitHeight(30);
        view3.setPreserveRatio(true);

        /*Button boutonAjoutQuantite = new Button();
        boutonAjoutQuantite.setGraphic(view2);
        boutonAjoutQuantite.setMinWidth(5);
        boutonAjoutQuantite.setMinHeight(10);
        boutonAjoutQuantite.setOnAction((ActionEvent event1) -> {

        });*/

        Button boutonvalide = new Button();
        boutonvalide.setGraphic(view3);
        boutonvalide.setMinWidth(10);
        boutonvalide.setMinHeight(29.5);
        boutonvalide.setOnAction((ActionEvent event1) -> {
            if (texte.getText().length() != 0) {
                if (Integer.parseInt(texte.getText()) > 0 && Integer.parseInt(texte.getText()) < 51) {
                    affichage.setWrapText(true);

                    Produit produit = Produit.rechercher(Integer.parseInt(texte.getText()));
                    if (produit != null) {
                        passage.ajouter(produit);
                    }
                    produitObs.add("" + produit.getNom() + "\n\t\t\t" + produit.getPrix() + "€");

                    //recup id pour insertion bd
                    try {
                        listeIdProduit.getArray(i, produit.getReference());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    i++;

                    total = produit.getPrix() + total;
                    total = round(total * 100.0) / 100.0;
                    texte.setBackground(Background.fill(Color.WHITE));
                    listView.setItems(produitObs);
                } else {
                    texte.setBackground(Background.fill(Color.RED));
                }
            }

            /*listView2.setItems(boutonAjoutQuantite);*/

            affichageTotal.clear();
            texte.clear();
            affichageTotal.appendText(String.valueOf(total) + "€");
        });
        listView.setItems(produitObs);

        fenetre.setTitle("Caisse n°1");

        GridPane panneau = new GridPane();
        GridPane panneau2 = new GridPane();
        GridPane panneau3 = new GridPane();
        GridPane panneau4 = new GridPane();
        GridPane panneau5 = new GridPane();
        GridPane panneau6 = new GridPane();
        GridPane panneau7 = new GridPane();

        panneau.add(listView, 1, 10);
        panneau.add(listView2, 2, 10);
        panneau.add(affichageTotal, 1, 20);
        panneau.add(texte, 1, 30);
        panneau.add(panneau2, 1, 40);
        panneau.add(panneau5, 3, 10);

        panneau2.add(panneau3, 1, 40);
        panneau2.add(panneau4, 2, 40);

        panneau3.add(boutonpause, 1, 90);
        panneau3.add(reprendreCommande, 1, 100);

        panneau4.add(boutondelete, 4, 100);
        panneau4.add(boutonvalide, 2, 100);
        panneau4.add(bouton1, 2, 70);
        panneau4.add(bouton2, 3, 70);
        panneau4.add(bouton3, 4, 70);
        panneau4.add(bouton4, 2, 80);
        panneau4.add(bouton5, 3, 80);
        panneau4.add(bouton6, 4, 80);
        panneau4.add(bouton7, 2, 90);
        panneau4.add(bouton8, 3, 90);
        panneau4.add(bouton9, 4, 90);
        panneau4.add(bouton10, 3, 100);
        panneau4.add(txtremise, 5, 70);
        panneau4.add(boutonRemiseEuros, 7, 70);
        panneau4.add(boutonRemisePourcentage, 6, 70);
        panneau4.add(boutonAnnulerPassage, 5, 80);

        panneau5.add(affichage2, 1, 10);
        panneau5.add(panneau6, 1, 20);
        panneau5.add(montantDu, 1, 30);
        panneau5.add(panneau7, 1, 40);
        panneau5.add(montantARendre, 1, 50);
        panneau5.add(boutonImpressionTicket, 1, 60);

        panneau6.add(boutonEspece, 1, 10);
        panneau6.add(boutonCB, 2, 10);
        panneau6.add(boutonCheque, 3, 10);

        panneau7.add(montantDonnee, 1, 10);
        panneau7.add(espece, 2, 10);
        panneau7.add(boutonValide2, 3, 10);
        panneau7.add(boutonValide3, 3, 10);

        fenetre.setScene(new Scene(panneau, 500, 450)); // création de la scène
        fenetre.setFullScreen(true);
        fenetre.show(); // affichage de la fenêtre
        texte.setOnKeyPressed(event -> boutonvalide.fire());
    }
        public void ticket (double total, ObservableList listeProduit) {
            for (int i = 0; i < listeProduit.size(); i++) {
                String item = (String) listeProduit.get(i);
                String newItem = item.replaceAll("\n", ""); // Retirer les caractères \n
                newItem = newItem.replaceAll("\t", "    "); // Retirer les caractères \n
                listeProduit.set(i, newItem); // Remplacer l'élément original par le nouvel élément
            }

            //String[]args
            try (PDDocument document = new PDDocument()) {
                // Créer une nouvelle page
                PDPage page = new PDPage();
                document.addPage(page);

                // Ouvrir un contenu pour écrire sur la page
                PDPageContentStream contentStream = new PDPageContentStream(document, page);

                contentStream.beginText();
                contentStream.setFont(PDType1Font.COURIER, 18);
                contentStream.newLineAtOffset(25, 700);
                contentStream.showText("Reims Outillage");
                contentStream.endText();

                // Ajouter le titre "Ticket de caisse" en haut de la page
                contentStream.beginText();
                contentStream.setFont(PDType1Font.COURIER, 18);
                contentStream.newLineAtOffset(50, 700);
                contentStream.showText("Ticket de caisse");
                contentStream.endText();

                // Ajouter la date et l'heure actuelle en haut à droite de la page
                contentStream.beginText();
                contentStream.setFont(PDType1Font.COURIER, 12);
                contentStream.newLineAtOffset(400, 700);
                contentStream.showText(new Date().toString());
                contentStream.endText();

                // Ajouter les détails de l'article acheté
                contentStream.beginText();
                contentStream.setFont(PDType1Font.COURIER, 12);
                contentStream.newLineAtOffset(50, 650);
                for (int i = 0; i < listeProduit.size(); i++) {
                    contentStream.showText((String) listeProduit.get(i));
                    contentStream.newLineAtOffset(0, -20);
                }
                contentStream.endText();

                // Fermer le contenu et enregistrer le document
                contentStream.close();
                document.save("ticket_de_caisse.pdf");

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

