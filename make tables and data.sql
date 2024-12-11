CREATE TABLE Books (
	isbn VARCHAR(13) PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	author VARCHAR(50) NOT NULL,
	genre VARCHAR(50),
	published_year INT,
	quantity_available INT CHECK (quantity_available >= 0)
);

CREATE TABLE Users (
	uid SERIAL PRIMARY KEY,  
	full_name VARCHAR(50) NOT NULL,
	email_address VARCHAR(100) UNIQUE NOT NULL,
	membership_date DATE NOT NULL DEFAULT CURRENT_DATE 
);

CREATE TABLE Book_Loans (
	loan_id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	isbn VARCHAR(13) NOT NULL,
	loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
	return_date DATE,
	status VARCHAR(20) NOT NULL CHECK (status IN ('borrowed', 'returned', 'overdue')),
	FOREIGN KEY (user_id) REFERENCES Users(uid) ON DELETE CASCADE,
	FOREIGN KEY (isbn) REFERENCES Books(isbn) ON DELETE CASCADE
);

--populate db
INSERT INTO Books (isbn, title, author, genre, published_year, quantity_available)
VALUES ('9780451524935', 'Harry Potter', 'JK Rowling', 'Fiction', 1999, 5);

INSERT INTO Users (full_name, email_address, membership_date)
VALUES ('LA Holleza', 'la.holleza@example.com', '2024-12-11');

INSERT INTO Book_Loans (user_id, isbn, loan_date, status)
VALUES (1, '9780451524935', '2024-12-11', 'borrowed');

INSERT INTO Book_Loans (user_id, isbn, loan_date, status)
VALUES (1, '9780451524935', '2024-12-11', 'borrowed');


