package com.keyin.service;

import com.keyin.client.DatabaseConnection;
import com.keyin.model.HealthData;
import com.keyin.model.HealthDataDao;
import java.sql.Date;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class RecommendationSystem {

    public static final int MIN_HEART_RATE = 60;
    public static final int MAX_HEART_RATE = 100;
    public static final int MIN_STEPS = 5000;
    public static final int MAX_STEPS = 10000;

    public List<String> getHealthRecommendations(Connection conn, int healthDataId) throws SQLException {
        List<String> recommendations = new ArrayList<>();

        // getting the helth data for the id
        HealthDataDao healthDataDao = new HealthDataDao();
        HealthData healthData = healthDataDao.getHealthDataByUserId(conn, healthDataId);

        // seeing if helth data was fopund
        if (healthData == null) {
            return recommendations; //returning empty list if nothing is found
        }

        // making printouts if health data is lacking
        int stepsReco = healthData.getSteps();
        if (stepsReco < MIN_STEPS) {
            recommendations.add("Your step count is lower than the recommended range. " +
                    "Consider increasing your physical activity to improve your health.");
        } else if (stepsReco > MAX_STEPS) {
            recommendations.add("Your step count is higher than the recommended range. " +
                    "Consider taking breaks throughout the day to avoid overexertion.");
        } else {
            recommendations.add("Your step count is within the recommended range.");
        }
        if (healthData.getHeartRate() < MIN_HEART_RATE) {
            recommendations.add("Your heart rate is lower than the recommended range. Consider increasing your physical activity to improve your cardiovascular health.");
        } else if (healthData.getHeartRate() > MAX_HEART_RATE) {
            recommendations.add("Your heart rate is higher than the recommended range. Consider a visit to your doctor if your heart rate is consistently above 100 beats per minute.");
        } else {
            recommendations.add("Your heart rate is within the recommended range.");
        }

        return recommendations;
    }
    public void addRecommendations(Connection conn, int userId, String recommendation, Date date) {
        try {

            // seeing if the user id already exist
            PreparedStatement checkStmt = conn.prepareStatement("SELECT user_id FROM recommendations WHERE user_id = ?");
            checkStmt.setInt(1, userId);
            ResultSet rs = checkStmt.executeQuery();

            if (!rs.next()) {
                // createing a statemnet object
                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO recommendations (user_id, recommendation_text, date) VALUES (?, ?, ?)");

                // setting the values for the statement
                pstmt.setInt(1, userId);
                pstmt.setString(2, recommendation);
                pstmt.setDate(3, date);

                // eexecuting the statement
                int rows = pstmt.executeUpdate();

                if (rows > 0) {
                    System.out.println("Recommendation added successfully.");
                } else {
                    System.out.println("Failed to add recommendation.");
                }
                pstmt.close();
            }
            checkStmt.close();

        } catch (SQLException e) {
            System.out.println("Error executing SQL statement: " + e.getMessage());
        }
    }
}