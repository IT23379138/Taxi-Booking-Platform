package org.pg113.citycabsfeedbacksystem;
//IT24100212
import javax.servlet.ServletContext;
import java.io.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Logger;

public class FeedbackService {
    private static final String BASE_PATH = "D:\\qq\\git\\Taxi-Booking-Platform\\data";
    private static final String FEEDBACKS_FILE = BASE_PATH + "\\feedbacks.txt";
    private final AtomicInteger feedbackIdCounter = new AtomicInteger(1);
    private static final Logger LOGGER = Logger.getLogger(FeedbackService.class.getName());
    private UserAndDriver userAndDriver;

    public FeedbackService() {
        initializeFeedbackIdCounter();
        initializeDefaultFiles();
        userAndDriver = UserAndDriver.getInstance();
    }

    private void initializeFeedbackIdCounter() {
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(FEEDBACKS_FILE)))) {
            String line;
            int maxId = 0;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 10);
                if (parts.length > 0) {
                    try {
                        int id = Integer.parseInt(parts[0]);
                        maxId = Math.max(maxId, id);
                    } catch (NumberFormatException e) {
                        LOGGER.warning("Invalid feedback ID format: " + parts[0]);
                    }
                }
            }
            feedbackIdCounter.set(maxId + 1);
        } catch (IOException e) {
            LOGGER.severe("Failed to initialize feedback ID counter: " + e.getMessage());
        }
    }

    private void initializeDefaultFiles() {
        String feedbacksPath = getFilePath(FEEDBACKS_FILE);
        File feedbacksFile = new File(feedbacksPath);
        if (!feedbacksFile.exists()) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(feedbacksFile))) {
                writer.write("1,user1,user1@example.com,Great service,5,D001,4,Service,No Response,Pending\n");
                LOGGER.info("Created default feedbacks.txt with sample data");
            } catch (IOException e) {
                LOGGER.severe("Failed to create default feedbacks.txt: " + e.getMessage());
            }
        }
    }

    private String getFilePath(String filePath) {
        return filePath;
    }

    public boolean validateUser(String username, String password) {
        return userAndDriver.validateUser(username, password);
    }

    public boolean userExists(String username) {
        return userAndDriver.userExists(username);
    }

    public void addUser(String username, String password, String email, String role) {
        userAndDriver.addUser(username, password, email, role);
    }

    public String getUserEmail(String username) {
        return userAndDriver.getUserEmail(username);
    }

    public String getUserRole(String username) {
        return userAndDriver.getUserRole(username);
    }

    public void addFeedback(String name, String email, String message, int rating, String driverId, int driverRating, String category) {
        try {
            // Create the data directory if it doesn't exist
            File dataDir = new File(BASE_PATH);
            if (!dataDir.exists()) {
                dataDir.mkdirs();
            }

            // Create the feedbacks file if it doesn't exist
            File feedbacksFile = new File(getFilePath(FEEDBACKS_FILE));
            if (!feedbacksFile.exists()) {
                feedbacksFile.createNewFile();
            }

            // Read existing feedbacks to get the next ID
            List<String[]> existingFeedbacks = getAllFeedbacks();
            int nextId = 1;
            if (!existingFeedbacks.isEmpty()) {
                nextId = existingFeedbacks.stream()
                    .mapToInt(feedback -> Integer.parseInt(feedback[0]))
                    .max()
                    .orElse(0) + 1;
            }

            // Append the new feedback
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(getFilePath(FEEDBACKS_FILE), true))) {
                String feedback = nextId + "," + name + "," + email + "," + message + "," +
                        rating + "," + driverId + "," + driverRating + "," + category + ",No Response,Pending";
                writer.write(feedback + "\n");
                LOGGER.info("Added feedback ID: " + nextId);
            }
        } catch (IOException e) {
            LOGGER.severe("Error adding feedback: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<String[]> getAllFeedbacks() {
        List<String[]> feedbacks = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(FEEDBACKS_FILE)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                feedbacks.add(line.split(",", 10));
            }
        } catch (IOException e) {
            LOGGER.severe("Error retrieving feedbacks: " + e.getMessage());
        }
        return feedbacks;
    }

    public Map<String, String> getAllDrivers() {
        return userAndDriver.getAllDrivers();
    }

    public void addDriver(String driverId, String driverName) {
        userAndDriver.addDriver(driverId, driverName);
    }

    public void updateFeedbackResponse(String id, String feedbackResponse, String status) {
        List<String[]> feedbacks = getAllFeedbacks();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(getFilePath(FEEDBACKS_FILE)))) {
            for (String[] feedback : feedbacks) {
                if (feedback[0].equals(id)) {
                    feedback[8] = feedbackResponse.isEmpty() ? "No Response" : feedbackResponse;
                    feedback[9] = status;
                }
                writer.write(String.join(",", feedback) + "\n");
            }
            LOGGER.info("Updated feedback response for ID: " + id);
        } catch (IOException e) {
            LOGGER.severe("Error updating feedback response: " + e.getMessage());
        }
    }

    public void updateFeedback(String id, String message, int rating) {
        List<String[]> feedbacks = getAllFeedbacks();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(getFilePath(FEEDBACKS_FILE)))) {
            for (String[] feedback : feedbacks) {
                if (feedback[0].equals(id)) {
                    feedback[3] = message;
                    feedback[4] = String.valueOf(rating);
                }
                writer.write(String.join(",", feedback) + "\n");
            }
            LOGGER.info("Updated feedback for ID: " + id);
        } catch (IOException e) {
            LOGGER.severe("Error updating feedback: " + e.getMessage());
        }
    }

    public void deleteFeedback(String id) {
        List<String[]> feedbacks = getAllFeedbacks();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(getFilePath(FEEDBACKS_FILE)))) {
            int newId = 1;
            for (String[] feedback : feedbacks) {
                if (!feedback[0].equals(id)) {
                    feedback[0] = String.valueOf(newId++);
                    writer.write(String.join(",", feedback) + "\n");
                }
            }
            feedbackIdCounter.set(newId);
            LOGGER.info("Deleted feedback ID: " + id);
        } catch (IOException e) {
            LOGGER.severe("Error deleting feedback: " + e.getMessage());
        }
    }

    public Map<String, Double> calculateDriverRatings() {
        Map<String, List<Integer>> driverRatings = new HashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(FEEDBACKS_FILE)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 10);
                if (parts.length >= 7) {
                    String driverId = parts[5];
                    int rating = Integer.parseInt(parts[6]);
                    driverRatings.computeIfAbsent(driverId, k -> new ArrayList<>()).add(rating);
                }
            }
        } catch (IOException e) {
            LOGGER.severe("Error calculating driver ratings: " + e.getMessage());
        }

        Map<String, Double> averages = new TreeMap<>();
        Map<String, String> drivers = getAllDrivers();
        for (Map.Entry<String, List<Integer>> entry : driverRatings.entrySet()) {
            String driverId = entry.getKey();
            List<Integer> ratings = entry.getValue();
            double avg = ratings.stream().mapToInt(Integer::intValue).average().orElse(0.0);
            averages.put(driverId + ":" + drivers.getOrDefault(driverId, "Unknown"), Math.round(avg * 100.0) / 100.0);
        }
        return averages;
    }

    public double calculateAverageRating() {
        List<String[]> feedbacks = getAllFeedbacks();
        if (feedbacks.isEmpty()) {
            return 0.0;
        }
        double sum = feedbacks.stream()
                .mapToDouble(feedback -> Double.parseDouble(feedback[4]))
                .sum();
        return Math.round((sum / feedbacks.size()) * 100.0) / 100.0;
    }

    public Map<String, Long> getCategoryDistribution() {
        return getAllFeedbacks().stream()
                .collect(java.util.stream.Collectors.groupingBy(f -> f[7], java.util.stream.Collectors.counting()));
    }

    public static class FeedbackServletContextHolder {
        private static ServletContext servletContext;

        public static void setServletContext(ServletContext context) {
            servletContext = context;
        }

        public static ServletContext getServletContext() {
            return servletContext;
        }
    }
}