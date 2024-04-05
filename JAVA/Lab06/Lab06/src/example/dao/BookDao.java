package example.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import example.model.Author;
import example.model.Book;

public interface BookDao {
    void setConnection() throws SQLException;
    void closeConnection() throws SQLException;
    List<Book> getBooksForLastTwoYears() throws SQLException;

}
