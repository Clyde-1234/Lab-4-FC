--get book loaned by user
SELECT U.full_name, U.email_address, B.title, BL.status
FROM Book_Loans BL
JOIN Books B ON BL.isbn = B.isbn
JOIN Users U ON BL.user_id = 1
WHERE BL.user_id = 1;

--list all overdue
SELECT BL.loan_id, U.full_name, B.title, BL.loan_date, BL.return_date
FROM Book_Loans BL
JOIN Users U ON BL.user_id = U.uid
JOIN Books B ON BL.isbn = B.isbn
WHERE BL.status = 'overdue';

--fast retrieval of overdue loans
SELECT *
FROM Book_Loans
WHERE status = 'overdue';
