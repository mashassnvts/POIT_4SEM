
USE Library;

CREATE TABLE Authors (
                         author_id INT AUTO_INCREMENT PRIMARY KEY,
                         full_name VARCHAR(100),
                         country VARCHAR(50)
);

CREATE TABLE Books (
                       book_id INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(100),
                       authors VARCHAR(255),
                       year_published INT,
                       publisher VARCHAR(100)
);


INSERT INTO Authors (full_name, country) VALUES ('Stephen King', 'USA');
INSERT INTO Authors (full_name, country) VALUES ('J.K. Rowling', 'UK');
INSERT INTO Authors (full_name, country) VALUES ('Haruki Murakami', 'Japan');

INSERT INTO Books (title, authors, year_published, publisher) VALUES ('The Shining', 'Stephen King', 1977, 'Doubleday');
INSERT INTO Books (title, authors, year_published, publisher) VALUES ('Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 1997, 'Bloomsbury');
INSERT INTO Books (title, authors, year_published, publisher) VALUES ('Norwegian Wood', 'Haruki Murakami', 1987, 'Kodansha');

DROP TABLE Authors;
DROP TABLE Books

