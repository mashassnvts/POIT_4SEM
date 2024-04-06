// Main class for demonstration
import java.sql.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import example.dao.BookDao;
import example.dao.AuthorDAOImpl;
import example.dao.AuthorDao;
import example.model.Author;
import example.model.Book;
import example.dao.BookDAOImpl;


public class Main {
    public static void main(String[] args) {
        AuthorDao authorDAO = new AuthorDAOImpl();
        BookDao bookDAO = new BookDAOImpl();
        Connection connection = null;

        try {
            // установка соединения
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Ssnvts2004)");
            // начало транзакции
            connection.setAutoCommit(false);
            //установка соединения
            authorDAO.setConnection();
            bookDAO.setConnection();

            // Example: Get all authors
            List<Author> authors = authorDAO.getAllAuthors();
            for (Author author : authors) {
                System.out.println(author.getFullName() + " (" + author.getCountry() + ")");
            }

            // Example: Get books published in the last two years
            List<Book> recentBooks = bookDAO.getBooksForLastTwoYears();
            for (Book book : recentBooks) {
                System.out.println(book.getTitle() + " (" + book.getYearPublished() + ")");
            }
            List<Book> allBooks = ((BookDAOImpl) bookDAO).getAllBooks();
            for (Book book : allBooks) {
                System.out.println(book.getTitle() + " (" + book.getYearPublished() + ")");
            }
            // подтверждение транзакции
            connection.commit();
        } catch (SQLException e) {
            // откат в случае ошибки
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            // закрытие соединения
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}