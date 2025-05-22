package org.pg113.citycabsfeedbacksystem;

import java.time.LocalDateTime;

public class Feedback {
    // Required fields
    private final int id;
    private final String passengerName;
    private final String passengerEmail;
    private final String message;
    private final int serviceRating; // 1-5
    private final String driverId;
    private final int driverRating; // 1-5
    private final String category;

    // Admin fields
    private String adminResponse;
    private String status; // "Pending", "Resolved", etc.
    private final LocalDateTime createdAt;

    // Builder pattern for complex construction
    public static class Builder {
        // Required parameters
        private final int id;
        private final String passengerName;
        private final String passengerEmail;
        private final String message;
        private final int serviceRating;
        private final String driverId;
        private final int driverRating;
        private final String category;

        // Optional parameters
        private String adminResponse = "No Response";
        private String status = "Pending";
        private LocalDateTime createdAt = LocalDateTime.now();

        public Builder(int id, String passengerName, String passengerEmail,
                       String message, int serviceRating,
                       String driverId, int driverRating,
                       String category) {
            this.id = id;
            this.passengerName = passengerName;
            this.passengerEmail = passengerEmail;
            this.message = message;
            this.serviceRating = serviceRating;
            this.driverId = driverId;
            this.driverRating = driverRating;
            this.category = category;
        }

        public Builder adminResponse(String val) {
            adminResponse = val;
            return this;
        }

        public Builder status(String val) {
            status = val;
            return this;
        }

        public Builder createdAt(LocalDateTime val) {
            createdAt = val;
            return this;
        }

        public Feedback build() {
            return new Feedback(this);
        }
    }

    private Feedback(Builder builder) {
        id = builder.id;
        passengerName = builder.passengerName;
        passengerEmail = builder.passengerEmail;
        message = builder.message;
        serviceRating = builder.serviceRating;
        driverId = builder.driverId;
        driverRating = builder.driverRating;
        category = builder.category;
        adminResponse = builder.adminResponse;
        status = builder.status;
        createdAt = builder.createdAt;
    }

    // Getters
    public int getId() { return id; }

    // Setters for mutable fields
    public void setAdminResponse(String response) {
        this.adminResponse = response;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Utility methods
    public String toCSV() {
        return String.join(",",
                String.valueOf(id),
                passengerName,
                passengerEmail,
                message,
                String.valueOf(serviceRating),
                driverId,
                String.valueOf(driverRating),
                category,
                adminResponse,
                status,
                createdAt.toString()
        );
    }

    public static Feedback fromCSV(String csvLine) {
        String[] parts = csvLine.split(",", -1); // -1 keeps empty values
        return new Builder(
                Integer.parseInt(parts[0]),
                parts[1],
                parts[2],
                parts[3],
                Integer.parseInt(parts[4]),
                parts[5],
                Integer.parseInt(parts[6]),
                parts[7]
        )
                .adminResponse(parts.length > 8 ? parts[8] : "No Response")
                .status(parts.length > 9 ? parts[9] : "Pending")
                .createdAt(parts.length > 10 ? LocalDateTime.parse(parts[10]) : LocalDateTime.now())
                .build();
    }
}