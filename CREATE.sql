CREATE TABLE Publishers (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    ISBN VARCHAR(13),
    publication_year INT,
    genre VARCHAR(255),
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

CREATE TABLE Copies (
    copy_id SERIAL PRIMARY KEY,
    book_id INT,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE Readers (
    reader_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20)
);

CREATE TABLE Loans (
    loan_id SERIAL PRIMARY KEY,
    copy_id INT,
    reader_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (copy_id) REFERENCES Copies(copy_id),
    FOREIGN KEY (reader_id) REFERENCES Readers(reader_id)
);

CREATE TABLE Reviews (
    review_id SERIAL PRIMARY KEY,
    book_id INT,
    reader_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (reader_id) REFERENCES Readers(reader_id)
);

CREATE TABLE Reservations (
    reservation_id SERIAL PRIMARY KEY,
    copy_id INT,
    reader_id INT,
    reservation_date DATE NOT NULL,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (copy_id) REFERENCES Copies(copy_id),
    FOREIGN KEY (reader_id) REFERENCES Readers(reader_id)
);

CREATE TABLE LoanHistories (
    loan_history_id SERIAL PRIMARY KEY,
    copy_id INT,
    reader_id INT,
    loan_date DATE NOT NULL,
    return_date DATE NOT NULL,
    actual_return_date DATE NOT NULL,
    overdue_fee INT,
    FOREIGN KEY (copy_id) REFERENCES Copies(copy_id),
    FOREIGN KEY (reader_id) REFERENCES Readers(reader_id)
);

CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    description TEXT
);


