package com.example.logiciel_caisse;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class Passage {
    private ObservableList<LigneProduit> listeLignesProduit;

    public Passage() {
        this.listeLignesProduit = FXCollections.observableArrayList();
    }

    public void ajouter(Produit produit) {
        boolean trouve = false;

        for(LigneProduit lp : listeLignesProduit) {
            if (lp.contient(produit)) {
                lp.incrementer();
                trouve = true;
            }
        }

        if (! trouve) {
            listeLignesProduit.add(new LigneProduit(produit));
        }
    }

    public ObservableList<LigneProduit> getListeLignesProduit() {
        return listeLignesProduit;
    }
}