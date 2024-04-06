package example.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import example.model.Author;

import static java.sql.DriverManager.getConnection;

public class AuthorDAOImpl implements AuthorDao {
    private Connection connection;

    @Override
    public void setConnection() throws SQLException {
        //параметры для подключения к бд
        String url = "jdbc:mysql://localhost:3306/library";
        String username = "root";
        String password = "Ssnvts2004)";
        //получаю соединение
        connection = getConnection(url, username, password);
    }

    @Override
    public void closeConnection() throws SQLException {
        //проверка, существует ли соединение и не закрыто ли оно уже
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

    @Override
    public List<Author> getAllAuthors() throws SQLException {
        List<Author> authors = new ArrayList<>();
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM Authors")) {
            while (resultSet.next()) {
                Author author = new Author();
                author.setId(resultSet.getInt("author_id"));
                author.setFullName(resultSet.getString("full_name"));
                author.setCountry(resultSet.getString("country"));
                authors.add(author);
            }
        }
        return authors;
    }
}

