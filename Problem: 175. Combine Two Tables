# Problem: 175. Combine Two Tables

## Description

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
+-------------+---------+
personId is the primary key (column with unique values) for this table.
This table contains information about the ID of some persons and their first and last names.
 

Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+
addressId is the primary key (column with unique values) for this table.
Each row of this table contains information about the city and state of one person with ID = PersonId.

Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.

## Intuition  
The task requires combining two tables using a shared identifier. Each person may or may not have a corresponding address. The solution must return all people, including individuals without address records.

## Approach  

1. **Alias the `Person` table as `p` and the `Address` table as `a`.**  
   ✅ Clarifies which table each column originates from and simplifies the join and select logic.

2. **Use a `LEFT JOIN` from `Person` to `Address` on `p.personId = a.personId`.**  
   ✅ Ensures every row from the `Person` table appears in the result. When no matching address exists, the address fields remain null. The logic satisfies the requirement to include people regardless of address availability.

3. **Select `p.firstName`, `p.lastName`, `a.city`, and `a.state`.**  
   ✅ Matches the expected output format by combining personal and address details. The address fields default to `NULL` when no match exists, which aligns with the requirements of the problem.

## Complexity  
- **Time complexity**: `O(n)` — one pass through the joined result set.  
- **Space complexity**: `O(1)` — output memory depends only on the result set; no additional structures required.

## Code  
```sql
Select
  p.firstName,
  p.lastName,
  a.city,
  a.state
From
  Person p
    Left Join Address a On
      p.personId = a.personId;
```
