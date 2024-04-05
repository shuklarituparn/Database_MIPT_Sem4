-- creation of the user
create user post2 with password 'password';

--1. Create the schema topic_6:

CREATE schema if not EXISTS topic_6;
grant all on schema topic_6 to post2;

--Create a table:

DROP TABLE IF EXISTS topic_6.test_table;
CREATE TABLE topic_6.test_table (
    my_id         SERIAL,
    my_text_field TEXT
);

-- Provide grants
grant all on topic_6.test_table to post2;
grant usage, select on all sequences in schema topic_6 to post2;

--2. Open a new transaction explicitly. Start insert operation


INSERT INTO topic_6.test_table (my_text_field) VALUES ('test_value1');

--Without completing the transaction, check that the data has been inserted into the table. Pay attention to the value in the my_id field.


--3. In a new console, write a request to obtain all rows of the table created in step 2. Explain why this happened.
--Commit changes in console 1.


--4.In both consoles, open new transactions.



--Write an update to the only row of the table in the first console. Check that the first transaction sees the changes.

--In the second console, run the update operation on the same line. Think about what happened and why?

--Save changes in the first console. What happened to the second console?

--Save changes in the second console.



--6. Repeat the previous exercise using the repeatable read level.
-- What happened when you tried to commit changes with the first open transaction? Roll back both transactions.


--7. To get the default value of the transaction isolation level in your postgres, use the command:



SHOW default_transaction_isolation;

--Explain the difference in transaction behavior in Problems 6 and 7 using your new knowledge.


--8.Repeat task 5 using the data insertion operator rather than the update operator, similar to step 3.
-- Look at the value in the my_id field after insertion by the second transaction.


--9. In both consoles, open new serializable level transactions

--The first transaction reads the data from the table.

--In the second transaction, insert new data into the table. And apply the changes immediately.

--Read the data as the first transaction again. What happened?

--Try adding data to the table using the first transaction. What happened? Roll back the changes.


--10. Open a new transaction in any console, the isolation level does not matter.


--Add some rows to the table.

--Create a breakpoint (savepoint) and look at the values in the table.

--Add some rows to the table again, create a breakpoint and look at the rows in the table.

--Add another row to the table and look at the table.

--Roll back to the second breakpoint and look at the data.

--Roll back to the first breakpoint and look at the data.

--Roll back the entire transaction.
