package com.example.videosurveillance;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.geometry.HPos;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.image.ImageView;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Timer;


public class Main extends Application {
    @Override
    public void start(Stage fenetre) throws IOException {
        //camera 1
        var httpClient = HttpClient.newBuilder()
                .authenticator(new Authenticator() {

                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(
                                "admin",
                                "".toCharArray());
                    }
                }).build();

        fenetre.setTitle("Projet vidéosurveillance "); // titre de la fenêtre
        Button bouton = new Button();
        bouton.setText("→");
        bouton.setOnAction((ActionEvent event) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=right&panstep=1&tiltstep=1"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button bouton2 = new Button();
        bouton2.setText("←");
        bouton2.setOnAction((ActionEvent event2) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=left&panstep=1&tiltstep=1"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button bouton3 = new Button();
        bouton3.setText("↑");
        bouton3.setOnAction((ActionEvent event3) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=up&panstep=1&tiltstep=1"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button bouton4 = new Button();
        bouton4.setText("↓");
        bouton4.setOnAction((ActionEvent event3) -> {
                    try {
                        HttpRequest requete = HttpRequest.newBuilder()
                                .GET()
                                .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=down&panstep=1&tiltstep=1"))
                                .build();

                        HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

                    } catch (IOException e) {
                        //throw new RuntimeException(e);
                        System.err.println("erreur");
                    } catch (InterruptedException e) {
                        System.err.println("erreur lors de la requête");
                    }
                });

        Button boutonPanoramique = new Button();
        boutonPanoramique.setText("↔");
        boutonPanoramique.setOnAction((ActionEvent event4) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvapn.cgi?action=go&speed=1"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button boutonStop = new Button();
        boutonStop.setText("x");
        boutonStop.setOnAction((ActionEvent event5) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvapn.cgi?action=stop"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button boutonEnregistrement = new Button();
        boutonEnregistrement.setText("Capture");
        boutonEnregistrement.setOnAction((ActionEvent event5) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/dms?nowprofileid="))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());
            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

            //camera 2
            Button bouton5 = new Button();
            bouton5.setText("→");
            bouton5.setOnAction((ActionEvent event) -> {
                try {
                    HttpRequest requete = HttpRequest.newBuilder()
                            .GET()
                            .uri(URI.create("http://10.197.0.3/cgi-bin/longcctvmove.cgi?action=move&direction=right&panstep=1&tiltstep=1"))
                            .build();

                    HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

                } catch (IOException e) {
                    //throw new RuntimeException(e);
                    System.err.println("erreur");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
            });

            Button bouton6 = new Button();
                    bouton6.setText("←");
                    bouton6.setOnAction((ActionEvent event2) -> {
                try {
                    HttpRequest requete = HttpRequest.newBuilder()
                            .GET()
                            .uri(URI.create("http://10.197.0.3/cgi-bin/longcctvmove.cgi?action=move&direction=left&panstep=1&tiltstep=1"))
                            .build();

                    HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

                } catch (IOException e) {
                    //throw new RuntimeException(e);
                    System.err.println("erreur");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
            });

            Button bouton7 = new Button();
                    bouton7.setText("↑");
                    bouton7.setOnAction((ActionEvent event3) -> {
                try {
                    HttpRequest requete = HttpRequest.newBuilder()
                            .GET()
                            .uri(URI.create("http://10.197.0.3/cgi-bin/longcctvmove.cgi?action=move&direction=up&panstep=1&tiltstep=1"))
                            .build();

                    HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

                } catch (IOException e) {
                    //throw new RuntimeException(e);
                    System.err.println("erreur");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
            });

            Button bouton8 = new Button();
                    bouton8.setText("↓");
                    bouton8.setOnAction((ActionEvent event3) -> {
                try {
                    HttpRequest requete = HttpRequest.newBuilder()
                            .GET()
                            .uri(URI.create("http://10.197.0.3/cgi-bin/longcctvmove.cgi?action=move&direction=down&panstep=1&tiltstep=1"))
                            .build();

                    HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

                } catch (IOException e) {
                    //throw new RuntimeException(e);
                    System.err.println("erreur");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
            });

        Button boutonPanoramique2 = new Button();
        boutonPanoramique2.setText("↔");
        boutonPanoramique2.setOnAction((ActionEvent event4) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.3/cgi-bin/longcctvapn.cgi?action=go&speed=1"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button boutonStop2 = new Button();
        boutonStop2.setText("x");
        boutonStop2.setOnAction((ActionEvent event5) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.3/cgi-bin/longcctvapn.cgi?action=stop"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        //camera 3
        Button bouton9 = new Button();
        bouton9.setText("→");
        bouton9.setOnAction((ActionEvent event) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=right&panstep=1&tiltstep=1"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button bouton10 = new Button();
        bouton10.setText("←");
        bouton10.setOnAction((ActionEvent event2) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=left&panstep=1&tiltstep=1"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button bouton11 = new Button();
        bouton11.setText("↑");
        bouton11.setOnAction((ActionEvent event3) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=up&panstep=1&tiltstep=1"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button bouton12 = new Button();
        bouton12.setText("↓");
        bouton12.setOnAction((ActionEvent event3) -> {
                    try {
                        HttpRequest requete = HttpRequest.newBuilder()
                                .GET()
                                .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=down&panstep=1&tiltstep=1"))
                                .build();

                        HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

                    } catch (IOException e) {
                        //throw new RuntimeException(e);
                        System.err.println("erreur");
                    } catch (InterruptedException e) {
                        System.err.println("erreur lors de la requête");
                    }
                });

        Button boutonPanoramique3 = new Button();
        boutonPanoramique3.setText("↔");
        boutonPanoramique3.setOnAction((ActionEvent event4) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvapn.cgi?action=go&speed=1"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button boutonStop3 = new Button();
        boutonStop3.setText("x");
        boutonStop3.setOnAction((ActionEvent event5) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvapn.cgi?action=stop"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

            //camera 4
            Button bouton13 = new Button();
            bouton13.setText("→");
            bouton13.setOnAction((ActionEvent event) -> {
                try {
                    HttpRequest requete = HttpRequest.newBuilder()
                            .GET()
                            .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=right&panstep=1&tiltstep=1"))
                            .build();

                    HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

                } catch (IOException e) {
                    //throw new RuntimeException(e);
                    System.err.println("erreur");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
            });

            Button bouton14 = new Button();
            bouton14.setText("←");
            bouton14.setOnAction((ActionEvent event2) -> {
                try {
                    HttpRequest requete = HttpRequest.newBuilder()
                            .GET()
                            .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=left&panstep=1&tiltstep=1"))
                            .build();

                    HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

                } catch (IOException e) {
                    //throw new RuntimeException(e);
                    System.err.println("erreur");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
            });

            Button bouton15 = new Button();
            bouton15.setText("↑");
            bouton15.setOnAction((ActionEvent event3) -> {
                try {
                    HttpRequest requete = HttpRequest.newBuilder()
                            .GET()
                            .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=up&panstep=1&tiltstep=1"))
                            .build();

                    HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

                } catch (IOException e) {
                    //throw new RuntimeException(e);
                    System.err.println("erreur");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
            });

            Button bouton16 = new Button();
            bouton16.setText("↓");
            bouton16.setOnAction((ActionEvent event3) -> {
                try {
                    HttpRequest requete = HttpRequest.newBuilder()
                            .GET()
                            .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvmove.cgi?action=move&direction=down&panstep=1&tiltstep=1"))
                            .build();

                    HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

                } catch (IOException e) {
                    //throw new RuntimeException(e);
                    System.err.println("erreur");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
            });

        Button boutonPanoramique4 = new Button();
        boutonPanoramique4.setText("↔");
        boutonPanoramique4.setOnAction((ActionEvent event4) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvapn.cgi?action=go&speed=1"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        Button boutonStop4 = new Button();
        boutonStop4.setText("x");
        boutonStop4.setOnAction((ActionEvent event5) -> {
            try {
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/cgi-bin/longcctvapn.cgi?action=stop"))
                        .build();

                HttpResponse<String> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofString());

            } catch (IOException e) {
                //throw new RuntimeException(e);
                System.err.println("erreur");
            } catch (InterruptedException e) {
                System.err.println("erreur lors de la requête");
            }
        });

        ImageView vue = new ImageView();
        ImageView vue2 = new ImageView();
        ImageView vue3 = new ImageView();
        ImageView vue4 = new ImageView();

        Timer timer = new java.util.Timer();
        Tache tache = new Tache(httpClient, vue, vue2, vue3, vue4); //la tâche qui va être exécutée à intervalle régulier
        timer.schedule(tache, 0, 200);

        GridPane panneau = new GridPane();
        panneau.setGridLinesVisible(false); //utile pour le débogage : passer à true pour voir la grille
        panneau.setPadding(new Insets(20));
        panneau.setHgap(15); //écart horizontal
        panneau.setVgap(10); //écart vertical
        //Camera 1
        panneau.add(vue, 1, 2);
        panneau.add(bouton,1, 5);
        panneau.add(bouton2, 1, 5); // colonne 2, ligne 0
        panneau.add(bouton3, 1, 3);
        panneau.add(bouton4, 1, 7); // colonne 2, ligne 0
        panneau.setHalignment(bouton3, HPos.CENTER);
        panneau.setHalignment(bouton4, HPos.CENTER);
        panneau.setHalignment(bouton, HPos.RIGHT);
        panneau.setHalignment(bouton2, HPos.LEFT);
        panneau.add(boutonPanoramique, 1, 9);
        panneau.setHalignment(boutonPanoramique, HPos.LEFT);
        panneau.add(boutonStop, 1, 9);
        panneau.setHalignment(boutonStop, HPos.RIGHT);
        panneau.add(boutonEnregistrement, 1, 9);
        panneau.setHalignment(boutonEnregistrement, HPos.CENTER);

        //camera 2
        panneau.add(vue2, 9, 2);
        panneau.add(bouton5, 9, 5); // colonne 2, ligne 0
        panneau.add(bouton6, 9, 5); // colonne 2, ligne 0
        panneau.add(bouton7, 9, 3); // colonne 2, ligne 0
        panneau.add(bouton8, 9, 7); // colonne 2, ligne 0
        panneau.setHalignment(bouton7, HPos.CENTER);
        panneau.setHalignment(bouton8, HPos.CENTER);
        panneau.setHalignment(bouton5, HPos.RIGHT);
        panneau.setHalignment(bouton6, HPos.LEFT);
        panneau.add(boutonPanoramique2, 9, 9);
        panneau.setHalignment(boutonPanoramique2, HPos.LEFT);
        panneau.add(boutonStop2, 9, 9);
        panneau.setHalignment(boutonStop2, HPos.RIGHT);

        //camera 3
        panneau.add(vue3, 1, 11);
        panneau.add(bouton9, 1, 14); // colonne 2, ligne 0
        panneau.add(bouton10, 1, 14); // colonne 2, ligne 0
        panneau.add(bouton11, 1, 12); // colonne 2, ligne 0
        panneau.add(bouton12, 1, 16); // colonne 2, ligne 0
        panneau.setHalignment(bouton11, HPos.CENTER);
        panneau.setHalignment(bouton12, HPos.CENTER);
        panneau.setHalignment(bouton9, HPos.RIGHT);
        panneau.setHalignment(bouton10, HPos.LEFT);
        panneau.add(boutonPanoramique3, 1, 18);
        panneau.setHalignment(boutonPanoramique3, HPos.LEFT);
        panneau.add(boutonStop3, 1, 18);
        panneau.setHalignment(boutonStop3, HPos.RIGHT);

        //camera 4
        panneau.add(vue4, 9, 11);
        panneau.add(bouton13, 9, 14); // colonne 2, ligne 0
        panneau.add(bouton14, 9, 14); // colonne 2, ligne 0
        panneau.add(bouton15, 9, 12); // colonne 2, ligne 0
        panneau.add(bouton16, 9, 16); // colonne 2, ligne 0
        panneau.setHalignment(bouton15, HPos.CENTER);
        panneau.setHalignment(bouton16, HPos.CENTER);
        panneau.setHalignment(bouton13, HPos.RIGHT);
        panneau.setHalignment(bouton14, HPos.LEFT);
        panneau.add(boutonPanoramique4, 9, 18);
        panneau.setHalignment(boutonPanoramique4, HPos.LEFT);
        panneau.add(boutonStop4, 9, 18);
        panneau.setHalignment(boutonStop4, HPos.RIGHT);

        fenetre.setScene(new Scene(panneau, 2000, 2000)); // création de la scène
        fenetre.show(); // affichage de la fenêtre
    }

    public static void main(String[] args) {
        launch();
    }
}

//enregistrement(fichier zip à la journée)