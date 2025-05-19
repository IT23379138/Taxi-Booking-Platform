package org.example.util;

import org.example.model.Driver;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DriverFileUtil {
    private static final String FILE_PATH = "E:\\OOP project\\DriverManagement\\Taxi-Booking-Platform\\data\\drivers.txt";

    public static void initializeDefaultDrivers() {
        File file = new File(FILE_PATH);
        if (!file.exists() || file.length() == 0) {
            List<Driver> defaultDrivers = new ArrayList<>();
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
                for (Driver driver : defaultDrivers) {
                    writer.write(driver.toString());
                    writer.newLine();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void addDriver(Driver driver) {
        driver.setRating(0.0);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(driver.toString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Driver> getAllDrivers() {
        initializeDefaultDrivers();
        List<Driver> drivers = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) {
            System.out.println("File does not exist: " + FILE_PATH);
            return drivers;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                try {
                    Driver driver = Driver.fromString(line);
                    drivers.add(driver);
                } catch (Exception e) {
                    System.out.println("Failed to parse line: " + line + ", Error: " + e.getMessage());
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
            e.printStackTrace();
        }
        return drivers;
    }

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