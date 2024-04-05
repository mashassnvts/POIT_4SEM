package example.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// Model class for Author
public class Author {
    private int id;
    private String fullName;
    private String country;

    // Constructor, getters, and setters

    public Author() {
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}