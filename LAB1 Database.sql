CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50)
);
CREATE TABLE Courses ( 
CourseID INT PRIMARY KEY, 
CourseName VARCHAR (50), 
Credits INT
);
 INSERT INTO Students (StudentID, Name, Age, Department)
VALUES (1, 'Ali', 20, 'Computer Science');

INSERT INTO Students (StudentID, Name, Age, Department)
VALUES (2, 'Sara', 21, 'Business Administration');

INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (101, 'Database Systems', 3);

INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (102, 'Marketing', 2);
UPDATE Students 
SET Age = 22 
WHERE StudentID = 1;
DELETE FROM Students 
WHERE StudentID = 2; 
SELECT * FROM Students; 
SELECT Name, Department FROM Students WHERE Age > 20;
CREATE USER user1 WITH PASSWORD '1234';
GRANT ALL PRIVILEGES ON Students TO user1; 
GRANT SELECT, INSERT ON Students TO user1;
REVOKE SELECT ON Students FROM user1; 
ALTER TABLE Students 
ADD COLUMN IF NOT EXISTS Email VARCHAR(100);
DROP TABLE Courses;
