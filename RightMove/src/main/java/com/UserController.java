package com;
import model.User;

import java.util.ArrayList;
import java.util.List;

public class UserController {
    private static List<User> users = new ArrayList<>();

    public static boolean signUp(User user) {
        // Check if the user already exists
        for (User existingUser : users) {
            if (existingUser.getUsername().equals(user.getUsername())) {
                return false; // User already exists
            }
        }

        
        users.add(user);
        return true; // Signup successful
    }

    public static boolean login(User user) {
        for (User existingUser : users) {
            if (existingUser.getUsername().equals(user.getUsername()) &&
                existingUser.getPassword().equals(user.getPassword())) {
                return true; // Login successful
            }
        }
        return false; // Login failed
    }
}
