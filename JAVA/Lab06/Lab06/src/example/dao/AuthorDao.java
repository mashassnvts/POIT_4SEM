package example.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import example.model.Author;

// Interface for AuthorDAO
public interface AuthorDao {
    void setConnection() throws SQLException;
    void closeConnection() throws SQLException;
    List<Author> getAllAuthors() throws SQLException;
}
