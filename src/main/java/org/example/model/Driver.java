package org.example.model;

public class Driver extends Person {
    private String licenseNumber;
    private double rating;

    public Driver(String id, String name, String email, String phone, String licenseNumber, double rating) {
        super(id, name, email, phone);
        this.licenseNumber = licenseNumber;
        this.rating = rating;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }


    @Override
    public String toString() {
        return id + "," + name + "," + email + "," + phone + "," + licenseNumber + "," + rating;
    }

    public static Driver fromString(String line) {
        String[] parts = line.split(",");
        return new Driver(parts[0], parts[1], parts[2], parts[3], parts[4], Double.parseDouble(parts[5]));
    }
}
