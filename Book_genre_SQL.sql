create database book_database;
use book_database;
-- Easy-Level (5 questions)
-- List all books with a rating greater than 4.0
SELECT 
    title, Author
FROM
    books_df
WHERE
    Rating > 4.0;
-- Retrieve distinct Main Genres from the Genre table.
SELECT DISTINCT
    title as main_genere
FROM
    genre_df;
-- Find all books that cost less than ₹200 and are of type "Paperback."
SELECT 
    *
FROM
    books_df
WHERE
    CAST(REPLACE(REPLACE(Price, 'â‚¹', ''), ',', '') AS DECIMAL(10, 2)) < 200 AND Type LIKE 'Paperback';
-- Count the number of books in each Sub Genre.
 SELECT 
    Sub_Genre,
    COUNT(Main_Genre) AS Number_of_Books
FROM
    books_df
GROUP BY
    Sub_Genre;
-- Display the URLs of all books in the "Children's Books" main genre.
SELECT 
    title, Main_Genre, URLs
FROM
    sub_genre_df
WHERE
    Main_Genre = 'Children\'s Books';
-- Moderate-Level (3 questions)
-- List the top 5 highest-rated books along with their genres.
SELECT 
    Title, Main_Genre, Sub_Genre, Rating
FROM
    books_df
ORDER BY Rating DESC
LIMIT 5;
-- Find the average price of books within each sub-genre.
SELECT 
    Sub_Genre,
    AVG(CAST(REPLACE(REPLACE(Price, 'â‚¹', ''),
            ',',
            '')
        AS DECIMAL (10 , 2 ))) AS Average_Price
FROM
    Books_df
GROUP BY Sub_Genre
ORDER BY Average_Price DESC
-- Display all books along with the total number of sub-genres in their respective main genres.
SELECT 
    b.Title AS Book_Title,
    b.Author,
    b.Main_Genre,
    b.Sub_Genre,
    COUNT(s.Title) AS Total_Sub_Genres
FROM 
    Books_df b
JOIN 
    Sub_Genre_df s
ON 
    b.Main_Genre = s.Main_Genre
GROUP BY 
    b.Title, b.Author, b.Main_Genre, b.Sub_Genre
ORDER BY 
    b.Main_Genre, b.Title;
-- Advanced-Level (3 questions)
-- Identify the sub-genre with the highest average book rating.
SELECT 
    Sub_Genre, AVG(Rating) AS avg_rating
FROM
    books_df
GROUP BY Sub_Genre
ORDER BY avg_rating DESC
LIMIT 1;
-- Determine the most popular main genre based on the total number of people who rated books within it.
SELECT 
    Main_Genre, SUM(No_of_People_rated) AS total_people_rated
FROM
    books_df
GROUP BY Main_Genre
ORDER BY total_people_rated DESC;
-- Calculate the total revenue potential for each sub-genre assuming all books sell at their listed price.
SELECT 
    Sub_Genre,
    sum(CAST(REPLACE(REPLACE(Price, 'â‚¹', ''),
            ',',
            '')
        AS DECIMAL (10 , 2 ))) AS total_revenue
	from books_df
    group by Sub_Genre
    order by total_revenue desc limit 1;


















    

    