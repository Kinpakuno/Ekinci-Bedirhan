package com.example.videosurveillance;

import javafx.application.Platform;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpHeaders;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Set;
import java.util.TimerTask;


public class Tache extends TimerTask {
    private HttpClient httpClient;
    private ImageView vue;
    private ImageView vue2;
    private ImageView vue3;
    private ImageView vue4;
    public Tache(HttpClient httpClient, ImageView vue, ImageView vue2, ImageView vue3, ImageView vue4) {
        this.httpClient = httpClient;
        this.vue = vue;
        this.vue2 = vue2;
        this.vue3 = vue3;
        this.vue4 = vue4;
    }
    @Override
    public void run() {
        Platform.runLater(new Runnable() {
            public void run() {
                // création de la requête

                //camera 1
                HttpRequest requete = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/dms?nowprofileid="))
                        .build();
                InputStream inputStream = null;
                // envoie d'une requête, affichage de la réponse à l'écran
                try {
                    HttpResponse<InputStream> reponse = httpClient.send(requete, HttpResponse.BodyHandlers.ofInputStream());

                    HttpHeaders headers = reponse.headers();
                    var dictionnaire = headers.map();

                    Set<String> cles = dictionnaire.keySet();
                    for (String cle : cles) { // parcours des clés
                        //System.out.println(cle + " -> " + dictionnaire.get(cle));
                    }
                    // code de statut
                    inputStream = reponse.body();

                } catch (IOException e) {
                    System.err.println("erreur lors de la requête");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
                Image image = new Image(inputStream);
                vue.setImage(image);

                //camera 2
                HttpRequest requete2 = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/dms?nowprofileid="))
                        .build();
                InputStream inputStream2 = null;
                // envoie d'une requête, affichage de la réponse à l'écran
                try {
                    HttpResponse<InputStream> reponse = httpClient.send(requete2, HttpResponse.BodyHandlers.ofInputStream());

                    HttpHeaders headers = reponse.headers();
                    var dictionnaire = headers.map();

                    Set<String> cles = dictionnaire.keySet();
                    for (String cle : cles) { // parcours des clés
                        //System.out.println(cle + " -> " + dictionnaire.get(cle));
                    }
                    // code de statut
                    inputStream2 = reponse.body();

                } catch (IOException e) {
                    System.err.println("erreur lors de la requête");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
                Image image2 = new Image(inputStream2);
                vue2.setImage(image2);

                //camera 3
                HttpRequest requete3 = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/dms?nowprofileid="))
                        .build();
                InputStream inputStream3 = null;
                // envoie d'une requête, affichage de la réponse à l'écran
                try {
                    HttpResponse<InputStream> reponse = httpClient.send(requete3, HttpResponse.BodyHandlers.ofInputStream());

                    HttpHeaders headers = reponse.headers();
                    var dictionnaire = headers.map();

                    Set<String> cles = dictionnaire.keySet();
                    for (String cle : cles) { // parcours des clés
                        //System.out.println(cle + " -> " + dictionnaire.get(cle));
                    }
                    // code de statut
                    inputStream3 = reponse.body();

                } catch (IOException e) {
                    System.err.println("erreur lors de la requête");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
                Image image3 = new Image(inputStream3);
                vue3.setImage(image3);

                //camera 4
                HttpRequest requete4 = HttpRequest.newBuilder()
                        .GET()
                        .uri(URI.create("http://10.197.0.2/dms?nowprofileid="))
                        .build();
                InputStream inputStream4 = null;
                // envoie d'une requête, affichage de la réponse à l'écran
                try {
                    HttpResponse<InputStream> reponse = httpClient.send(requete4, HttpResponse.BodyHandlers.ofInputStream());

                    HttpHeaders headers = reponse.headers();
                    var dictionnaire = headers.map();

                    Set<String> cles = dictionnaire.keySet();
                    for (String cle : cles) { // parcours des clés
                        //System.out.println(cle + " -> " + dictionnaire.get(cle));
                    }
                    // code de statut
                    inputStream4 = reponse.body();

                } catch (IOException e) {
                    System.err.println("erreur lors de la requête");
                } catch (InterruptedException e) {
                    System.err.println("erreur lors de la requête");
                }
                Image image4 = new Image(inputStream4);
                vue4.setImage(image4);
            }
        });
    }
}