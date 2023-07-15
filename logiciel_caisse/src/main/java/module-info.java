module com.example.logiciel_caisse {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires java.desktop;
    requires org.apache.pdfbox;


    opens com.example.logiciel_caisse to javafx.fxml;
    exports com.example.logiciel_caisse;
}