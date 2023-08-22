/* Combine Two Tables */

SELECT  A.firstName,
        A.lastName,
        B.city,
        B.state
FROM    Person A LEFT OUTER JOIN Address B ON A.personId = B.personId 