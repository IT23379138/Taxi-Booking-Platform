package org.pg113.citycabsfeedbacksystem;

import java.io.*;
import java.util.*;
import java.util.logging.Logger;

public class UserAndDriver {
    private static final String BASE_PATH = "C:\\Users\\TUF\\OneDrive\\Desktop\\Cindy\\Taxi-Booking-Platform\\Taxi-Booking-Platform\\data";
    private static final String USERS_FILE = BASE_PATH + "\\users.txt";
    private static final String DRIVERS_FILE = BASE_PATH + "\\drivers.txt";
    private static final Logger LOGGER = Logger.getLogger(UserAndDriver.class.getName());
    private static UserAndDriver instance;

    private UserAndDriver() {
        initializeDefaultFiles();
    }

    public static synchronized UserAndDriver getInstance() {
        if (instance == null) {
            instance = new UserAndDriver();
        }
        return instance;
    }

    private void initializeDefaultFiles() {
        String usersPath = getFilePath(USERS_FILE);
        String driversPath = getFilePath(DRIVERS_FILE);
        
        File usersFile = new File(usersPath);
        File driversFile = new File(driversPath);

        if (!usersFile.exists()) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(usersFile))) {
                writer.write("admin,admin123,admin@example.com,admin\n");
                LOGGER.info("Created default users.txt with admin account");
            } catch (IOException e) {
                LOGGER.severe("Failed to create default users.txt: " + e.getMessage());
            }
        }

        if (!driversFile.exists()) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(driversFile))) {
                writer.write("D001,John Doe\n");
                writer.write("D002,Jane Smith\n");
                LOGGER.info("Created default drivers.txt with sample data");
            } catch (IOException e) {
                LOGGER.severe("Failed to create default drivers.txt: " + e.getMessage());
            }
        }
    }

    private String getFilePath(String filePath) {
        return filePath;
    }

    public boolean validateUser(String username, String password) {
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(USERS_FILE)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 2 && parts[0].equals(username) && parts[1].equals(password)) {
                    return true;
                }
            }
        } catch (IOException e) {
            LOGGER.severe("Error validating user: " + e.getMessage());
        }
        return false;
    }

    public boolean userExists(String username) {
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(USERS_FILE)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 1 && parts[0].equals(username)) {
                    return true;
                }
            }
        } catch (IOException e) {
            LOGGER.severe("Error checking user existence: " + e.getMessage());
        }
        return false;
    }

    public void addUser(String username, String password, String email, String role) {
        String filePath = getFilePath(USERS_FILE);
        LOGGER.info("Attempting to write to file: " + filePath);
        
        try {
            File file = new File(filePath);
            if (!file.exists()) {
                boolean created = file.createNewFile();
                if (!created) {
                    LOGGER.severe("Failed to create users.txt file");
                    return;
                }
                LOGGER.info("Created new users.txt file");
            }
            
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
                String userData = username + "," + password + "," + email + "," + role + "\n";
                writer.write(userData);
                writer.flush();
                LOGGER.info("Successfully added user: " + username);
            }
        } catch (IOException e) {
            LOGGER.severe("Error adding user: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public String getUserEmail(String username) {
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(USERS_FILE)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 3 && parts[0].equals(username)) {
                    return parts[2];
                }
            }
        } catch (IOException e) {
            LOGGER.severe("Error getting user email: " + e.getMessage());
        }
        return null;
    }

    public String getUserRole(String username) {
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(USERS_FILE)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 4 && parts[0].equals(username)) {
                    return parts[3];
                }
            }
        } catch (IOException e) {
            LOGGER.severe("Error getting user role: " + e.getMessage());
        }
        return null;
    }

    public Map<String, String> getAllDrivers() {
        Map<String, String> drivers = new LinkedHashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(DRIVERS_FILE)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 2) {
                    drivers.put(parts[0], parts[1]);
                }
            }
        } catch (IOException e) {
            LOGGER.severe("Error retrieving drivers: " + e.getMessage());
        }
        return drivers;
    }

    public void addDriver(String driverId, String driverName) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(getFilePath(DRIVERS_FILE), true))) {
            writer.write(driverId + "," + driverName + "\n");
            LOGGER.info("Added driver: " + driverName);
        } catch (IOException e) {
            LOGGER.severe("Error adding driver: " + e.getMessage());
        }
    }
} 