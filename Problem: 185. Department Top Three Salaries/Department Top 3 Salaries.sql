/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int unsigned NOT NULL COMMENT 'PK1: Department Id.',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Department name.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The table stores department details. Each row of the table indicates the ID of a department and its name.';

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int unsigned NOT NULL COMMENT 'PK1: Employee id.',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Employee name.',
  `salary` int DEFAULT NULL COMMENT 'Employee salary.',
  `departmentId` int unsigned DEFAULT NULL COMMENT 'Employee department id.',
  PRIMARY KEY (`id`),
  KEY `employee_department_FK` (`departmentId`),
  CONSTRAINT `employee_department_FK` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The table stores employee details. Each row of the table indicates the ID, name, and salary of an employee. The table also contains the ID of their department.';

DROP VIEW IF EXISTS `vw_department_top_three_salaries`;
with `cte_rank_earners` as (select `dept`.`name` AS `Department`,`emp`.`name` AS `Employee`,`emp`.`salary` AS `Salary`,dense_rank() OVER (PARTITION BY `emp`.`departmentId` ORDER BY `emp`.`salary` desc )  AS `SalaryRank` from (`leetcode`.`employee` `emp` join `leetcode`.`department` `dept` on((`emp`.`departmentId` = `dept`.`id`)))) select `cte_rank_earners`.`Department` AS `Department`,`cte_rank_earners`.`Employee` AS `Employee`,`cte_rank_earners`.`Salary` AS `Salary` from `cte_rank_earners` where (`cte_rank_earners`.`SalaryRank` <= 3);

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'IT'),
(2, 'Sales');
INSERT INTO `employee` (`id`, `name`, `salary`, `departmentId`) VALUES
(1, 'Joe', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will', 70000, 1);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;