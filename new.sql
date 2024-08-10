create table Publisher(
    ID integer primary key not null,
    Name varchar(10) not null,
    address varchar(20) not null,
    phone varchar(10),
    established datetime
);


insert into Publisher values
   
(
    null,
    'Asmita Publications',
    'Kathmandu',
    '7987349832',
    '2002/12/12'
),

(
    null,
    'Nima Publications',
    'Kathmandu',
    '102798734',
    '2009/01/15'
),
(
    null,
    'Samiksha Publications',
    'Kathmandu',
    '9841234345',
    '2005/01/15'
),
(
    null,
    'ABC Publishers',
    'Bhaktapur',
    '9851234345',
    '2010/01/15'
);
SELECT * from Publisher;
---------------------------------------------------------
CREATE TABLE Author(
ID INTEGER   PRIMARY KEY  AUTOINCREMENT      NOT NULL,
NAME       TEXT             NOT NULL,
ADDRESS    TEXT       NOT NULL,
Email      TEXT,
Education  TEXT
);

insert into Author
VALUES
(
    null,
    'Ramesh Basnet',
    'Kathmandu',
    'ramesh@gmail.com',
    'Masters in computer science'
),

(
    null,
    'Parijat',
    'Kathmandu',
    'parijat@gmail.com',
    'Masters in Philoshopy'
),
(
    null,
    'Suman Pokharel',
    'Kathmandu',
    'suman.pokheral@gmail.com',
    'Masters in Arts'
),
(
    null,
    'Laxmi Prasad Devkota',
    'Kathmandu',
    'laxmi.dev@gmail.com',
    'PHD. Literature'
),
(
    null,
    'Banira Giri',
    'Kaski',
    'banira.giri@gmail.com',
    'Masters in Education'
);

SELECT * from Author;
----------------------------------------------------
CREATE TABLE Book(
ID INTEGER   PRIMARY KEY  AUTOINCREMENT      NOT NULL,
Title       TEXT             NOT NULL,
Price       REAL             NOT NULL,
ISBN     VARCHAR(20)         NOT NULL,
Genre  TEXT,
Published Date DATETIME,
AuthorID   Int,
PublisherID  INT,
FOREIGN KEY(AuthorID) REFERENCES Author(Id),
FOREIGN KEY(PublisherID) REFERENCES Publisher(Id)
);


INSERT INTO Book
VALUES
(
    null,
    'Design and Analysis of algorithms',
    '850.50',
    'ABC5687HGDTE34',
    'CS',
    '2020/02/23',
    1,
    1
),
(
    null,
    'मुनामदन',
    '650.50',
    'XZQ5687HGDTE34',
    'Drama',
    '1960/02/23',
    4,
    1
),
(
    null,
    'जीवनको छेउबाट',
    '450.50',
    'EKT5687HGDTE34',
    'Drama',
    '1960/02/23',
    3,
    3
),
(
    null,
    'शिरीषको फूल',
    '1050.25',
    'RGZ5687HGDTE34',
    'Drama',
    '1900/02/23',
    2,
    4
),
(
    null,
    'कारागार',
    '430.25',
    'IOZ5687HGDTE34',
    'Fantasy',
    '2000/02/23',
    2,
    4
),
(
    null,
    'जीवनको छेउबाट',
    '1050.25',
    'RGZ5687HGDTE34',
    'Mystory',
    '1970/02/23',
    3,
    3
),
(null, 'The Great Gatsby', 10.99, '978-0743273565', 'Fiction', '1925-04-10', 1, 1),
(null, 'To Kill a Mockingbird', 7.99, '978-0061120084', 'Fiction', '1960-07-11', 2, 2),
(null, '1984', 6.99, '978-0451524935', 'Dystopian', '1949-06-08', 3, 3),
(null, 'The Catcher in the Rye', 8.99, '978-0316769488', 'Fiction', '1951-07-16', 4, 4),
(null, 'Pride and Prejudice', 9.99, '978-1503290563', 'Romance', '1813-01-28', 5, 5),
(null, 'Moby-Dick', 11.99, '978-1503280786', 'Adventure', '1851-11-14', 6, 6),
(null, 'War and Peace', 14.99, '978-0199232765', 'Historical', '1869-01-01', 7, 7),
(null, 'The Odyssey', 12.99, '978-0140268867', 'Epic', '800-01-01', 8, 8),
(null, 'The Divine Comedy', 13.99, '978-0140448955', 'Epic', '1320-01-01', 9, 9),
(null, 'The Hobbit', 10.49, '978-0547928227', 'Fantasy', '1937-09-21', 10, 10),
(null, 'Brave New World', 8.49, '978-0060850524', 'Dystopian', '1932-08-30', 11, 11),
(null, 'The Lord of the Rings', 25.99, '978-0544003415', 'Fantasy', '1954-07-29', 10, 12),
(null, 'Jane Eyre', 7.49, '978-1503278196', 'Romance', '1847-10-16', 12, 5),
(null, 'Crime and Punishment', 9.99, '978-0486415871', 'Psychological', '1866-01-01', 13, 13);

select * from book;

--3.1 Get all books which are published in last 30 years --
SELECT *
FROM book
WHERE published >= DATE('now' ,'-30 YEAR');

-- Get total price of books written by parijat
select sum(Price) AS NetPrice
from Book
join Author on Book.AuthorID = Author.ID
where Author.Name = 'Parijat';

--Get all publishers in descending order with number of books published so far
SELECT Publisher.Name, COUNT(Book.ID) AS NumberOfBooks
FROM Publisher
LEFT JOIN Book ON Publisher.ID = Book.PublisherID
GROUP BY Publisher.Name
ORDER BY NumberOfBooks DESC;

-- Get all authors with comma seperated list of books they have written--
SELECT AuthorID, GROUP_CONCAT(book.Title ,', ') AS books_written
FROM book
GROUP BY AuthorID


