package org.example.util;

import org.example.model.Driver;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DriverFileUtil {
    private static final String FILE_PATH = "E:\\OOP project\\DriverManagement\\Taxi-Booking-Platform\\data\\drivers.txt";

    // Initialize default drivers only if file is missing or empty
    public static void initializeDefaultDrivers() {
        File file = new File(FILE_PATH);
        if (!file.exists() || file.length() == 0) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
                // Add default drivers here if needed
                List<Driver> defaultDrivers = new ArrayList<>();
                // e.g., defaultDrivers.add(new Driver("D1", "Alice", "Taxi", "1234567890", 0.0));
                for (Driver driver : defaultDrivers) {
                    writer.write(driver.toString());
                    writer.newLine();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Add a new driver
    public static void addDriver(Driver driver) {
        driver.setRating(0.0); // Set default rating
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(driver.toString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Read all drivers from the file
    public static List<Driver> getAllDrivers() {
        initializeDefaultDrivers();
        List<Driver> drivers = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                try {
                    drivers.add(Driver.fromString(line));
                } catch (Exception e) {
                    System.out.println("Invalid line: " + line);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return drivers;
    }

    // Update an existing driver
    public static void updateDriver(Driver updatedDriver) {
        List<Driver> drivers = getAllDrivers();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Driver driver : drivers) {
                if (driver.getId().equals(updatedDriver.getId())) {
                    writer.write(updatedDriver.toString());
                } else {
                    writer.write(driver.toString());
                }
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Delete a driver by ID
    public static void deleteDriver(String id) {
        List<Driver> drivers = getAllDrivers();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Driver driver : drivers) {
                if (!driver.getId().equals(id)) {
                    writer.write(driver.toString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Sort drivers by rating using bubble sort (descending)
    public static List<Driver> getAllDriversSortedByRating() {
        List<Driver> drivers = getAllDrivers();
        for (int i = 0; i < drivers.size() - 1; i++) {
            for (int j = 0; j < drivers.size() - i - 1; j++) {
                if (drivers.get(j).getRating() < drivers.get(j + 1).getRating()) {
                    Driver temp = drivers.get(j);
                    drivers.set(j, drivers.get(j + 1));
                    drivers.set(j + 1, temp);
                }
            }
        }
        return drivers;
    }
}
