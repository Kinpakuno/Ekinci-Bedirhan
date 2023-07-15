package com.example.logiciel_caisse;

import java.awt.event.*;
import javax.swing.*;

public class BoutonEntree extends JFrame {

    public void BoutonEntree() {
        this.setSize(800, 600);
        this.setDefaultCloseOperation(EXIT_ON_CLOSE);

        this.addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent evt) {
                System.out.println(evt.getKeyChar()); // affiche la touche appuyée
                switch (evt.getKeyCode()) {
                    case KeyEvent.VK_ENTER:
                        System.out.println("Vous avez appuyé sur 'entrée'");
                        break;
                }
            }
        });
        this.setVisible(true);
    }
}