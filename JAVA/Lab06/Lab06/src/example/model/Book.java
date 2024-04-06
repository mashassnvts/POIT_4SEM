package example.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// Model class for Author

public class Book {
    private int id;
    private String title;
    private String authors; // Assuming comma-separated author names
    private int yearPublished;
    private String publisher;

    // Constructor, getters, and setters

    // Constructor
    public Book() {
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthors() {
        return authors;
    }

    public void setAuthors(String authors) {
        this.authors = authors;
    }

    public int getYearPublished() {
        return yearPublished;
    }

    public void setYearPublished(int yearPublished) {
        this.yearPublished = yearPublished;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
}