package example.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import example.model.Book;
import example.model.Author;
// Implementation of BookDAO
public class BookDAOImpl implements BookDao {
    private Connection connection;

    @Override
    public void setConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/library";
        String username = "root";
        String password = "Ssnvts2004)";
        connection = DriverManager.getConnection(url, username, password);
    }

    @Override
    public void closeConnection() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

    @Override
    public List<Book> getBooksForLastTwoYears() throws SQLException {
        List<Book> books = new ArrayList<>();
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM Books WHERE year_published >= YEAR(CURDATE()) - 1")) {
            while (resultSet.next()) {
                Book book = new Book();
                book.setId(resultSet.getInt("book_id"));
                book.setTitle(resultSet.getString("title"));
                book.setAuthors(resultSet.getString("authors"));
                book.setYearPublished(resultSet.getInt("year_published"));
                book.setPublisher(resultSet.getString("publisher"));
                books.add(book);
            }
        }
        return books;
    }
    public List<Book> getAllBooks() throws SQLException {
        List<Book> books = new ArrayList<>();
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM Books")) {
            while (resultSet.next()) {
                Book book = new Book();
                book.setId(resultSet.getInt("book_id"));
                book.setTitle(resultSet.getString("title"));
                book.setAuthors(resultSet.getString("authors"));
                book.setYearPublished(resultSet.getInt("year_published"));
                book.setPublisher(resultSet.getString("publisher"));
                books.add(book);
            }
        }
        return books;
    }


}
