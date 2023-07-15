module com.example.videosurveillance {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.net.http;


    opens com.example.videosurveillance to javafx.fxml;
    exports com.example.videosurveillance;
}