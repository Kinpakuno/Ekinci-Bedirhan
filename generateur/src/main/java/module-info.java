module com.example.generateurgraphique {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.generateurgraphique to javafx.fxml;
    exports com.example.generateurgraphique;
}