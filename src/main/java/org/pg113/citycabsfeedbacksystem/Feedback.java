package org.pg113.citycabsfeedbacksystem;

public class Feedback {
    private int id;
    private String name;
    private String email;
    private String message;
    private int rating;
    private String driverId;
    private int driverRating;
    private String category;
    private String response;
    private String status;

    public Feedback(int id, String name, String email, String message, int rating, 
                   String driverId, int driverRating, String category, String response, String status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.message = message;
        this.rating = rating;
        this.driverId = driverId;
        this.driverRating = driverRating;
        this.category = category;
        this.response = response;
        this.status = status;
    }

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getMessage() { return message; }
    public int getRating() { return rating; }
    public String getDriverId() { return driverId; }
    public int getDriverRating() { return driverRating; }
    public String getCategory() { return category; }
    public String getResponse() { return response; }
    public String getStatus() { return status; }

    // Setters
    public void setResponse(String response) { this.response = response; }
    public void setStatus(String status) { this.status = status; }

    // Convert to CSV string
    public String toCSV() {
        return String.join(",", 
            String.valueOf(id),
            name,
            email,
            message,
            String.valueOf(rating),
            driverId,
            String.valueOf(driverRating),
            category,
            response,
            status
        );
    }

    // Create from CSV string
    public static Feedback fromCSV(String csvLine) {
        String[] parts = csvLine.split(",", 10);
        return new Feedback(
            Integer.parseInt(parts[0]),
            parts[1],
            parts[2],
            parts[3],
            Integer.parseInt(parts[4]),
            parts[5],
            Integer.parseInt(parts[6]),
            parts[7],
            parts[8],
            parts[9]
        );
    }
} 