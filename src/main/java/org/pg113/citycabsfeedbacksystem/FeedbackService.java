package org.pg113.citycabsfeedbacksystem;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Logger;

public class FeedbackService {
    private static final String USERS_FILE = "/WEB-INF/data/users.txt";
    private static final String DRIVERS_FILE = "/WEB-INF/data/drivers.txt";
    private static final String FEEDBACKS_FILE = "/WEB-INF/data/feedbacks.txt";
    private final AtomicInteger feedbackIdCounter = new AtomicInteger(1);
    private static final Logger LOGGER = Logger.getLogger(FeedbackService.class.getName());

    public FeedbackService() {
        initializeFeedbackIdCounter();
        initializeDefaultFiles();
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
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(feedbacksPath))) {
                writer.write("1,user1,user1@example.com,Great service,5,D001,4,Service,No Response,Pending\n");
                LOGGER.info("Created default feedbacks.txt with sample data");
            } catch (IOException e) {
                LOGGER.severe("Failed to create default feedbacks.txt: " + e.getMessage());
            }
        }
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
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(getFilePath(USERS_FILE), true))) {
            writer.write(username + "," + password + "," + email + "," + role + "\n");
            LOGGER.info("Added user: " + username);
        } catch (IOException e) {
            LOGGER.severe("Error adding user: " + e.getMessage());
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

    public void addFeedback(String name, String email, String message, int rating, String driverId, int driverRating, String category) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(getFilePath(FEEDBACKS_FILE), true))) {
            int id = feedbackIdCounter.getAndIncrement();
            String feedback = id + "," + name + "," + email + "," + message + "," +
                    rating + "," + driverId + "," + driverRating + "," + category + ",No Response,Pending";
            writer.write(feedback + "\n");
            LOGGER.info("Added feedback ID: " + id);
        } catch (IOException e) {
            LOGGER.severe("Error adding feedback: " + e.getMessage());
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

        return averages.entrySet().stream()
                .sorted(Map.Entry.<String, Double>comparingByValue().reversed())
                .collect(LinkedHashMap::new, (m, e) -> m.put(e.getKey(), e.getValue()), LinkedHashMap::putAll);
    }

    public Map<String, Integer> getCategoryDistribution() {
        Map<String, Integer> distribution = new HashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(FEEDBACKS_FILE)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 10);
                if (parts.length >= 8) {
                    String category = parts[7];
                    distribution.put(category, distribution.getOrDefault(category, 0) + 1);
                }
            }
        } catch (IOException e) {
            LOGGER.severe("Error calculating category distribution: " + e.getMessage());
        }
        return distribution;
    }

    public double calculateAverageRating() {
        List<Integer> ratings = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(getFilePath(FEEDBACKS_FILE)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 10);
                if (parts.length >= 5) {
                    ratings.add(Integer.parseInt(parts[4]));
                }
            }
        } catch (IOException e) {
            LOGGER.severe("Error calculating average rating: " + e.getMessage());
        }
        return ratings.stream().mapToInt(Integer::intValue).average().orElse(0.0);
    }

    private String getFilePath(String fileName) {
        ServletContext context = FeedbackServletContextHolder.getServletContext();
        if (context == null) {
            LOGGER.severe("ServletContext is null");
            return "";
        }
        String path = context.getRealPath(fileName);
        File file = new File(path);
        File parentDir = file.getParentFile();
        if (!parentDir.exists()) {
            boolean created = parentDir.mkdirs();
            if (!created) {
                LOGGER.severe("Failed to create directory: " + parentDir.getPath());
            } else {
                LOGGER.info("Created directory: " + parentDir.getPath());
            }
        }
        return path;
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