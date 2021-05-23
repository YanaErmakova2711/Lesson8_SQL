--task1  (lesson8)
-- oracle: https://leetcode.com/problems/department-top-three-salaries/

select Department, Employee, Salary from 
(
select Employee.Name as Employee, Salary,Department.Name as Department,
DENSE_RANK() over(partition by DepartmentId ORDER BY Salary desc) as rn
from Employee
left join 
Department on Employee.DepartmentId=Department.id
)
as res 
where rn<4


--task2  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/17
SELECT FamilyMembers.member_name, FamilyMembers.status, SUM(Payments.amount*Payments.unit_price) as costs
FROM FamilyMembers 
JOIN Payments  ON Payments.family_member = FamilyMembers.member_id
WHERE YEAR(Payments.date) = 2005
GROUP BY FamilyMembers.member_id, FamilyMembers.member_name, FamilyMembers.status


--task3  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/13
SELECT name  FROM Passenger GROUP BY name HAVING (COUNT(name)>1)

--task4  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38
SELECT COUNT(first_name) AS count FROM Student where first_name='Anna'

--task5  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/35

SELECT COUNT(classroom) as count FROM Schedule 
where day (date)=02

--task6  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38
SELECT COUNT(first_name) AS count FROM Student where first_name='Anna'

--task7  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/32
SELECT ROUND(avg(EXTRACT (YEAR FROM CURRENT_DATE)-year(birthday)),0) as age from FamilyMembers

--task8  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/27
SELECT  good_type_name, SUM(Payments.amount*Payments.unit_price) as costs FROM GoodTypes
JOIN Goods
ON GoodTypes.good_type_id = Goods.type
LEFT JOIN Payments ON
Goods.good_id = Payments.good
AND YEAR(Payments.date) = 2005
WHERE Payments.good IS NOT NULL
GROUP BY good_type_name

--task9  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/37
SELECT MIN(EXTRACT(YEAR FROM CURRENT_DATE)-year(birthday)) as year from Student
                 
--task10  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/44
SELECT MAX(EXTRACT(YEAR FROM CURRENT_DATE)-year(birthday)) as max_year
FROM Student
LEFT JOIN Student_in_class  on Student.id=Student_in_class.student
LEFT JOIN   Class  on  Class.id =Student_in_class.class
WHERE Class.name LIKE '10%' 
                                                
--task11 (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/20
SELECT status, member_name,(Payments.amount*Payments.unit_price) as costs  
FROM FamilyMembers 
LEFT JOIN Payments
on FamilyMembers.member_id=Payments.family_member
LEFT JOIN GoodTypes
ON  Payments.good=GoodTypes.good_type_id
LEFT JOIN Goods
ON Goods.type=GoodTypes.good_type_id
WHERE GoodTypes.good_type_name='entertainment'
                                                
--task12  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/55
DELETE  Company
FROM Company
WHERE Company.id in 
(
SELECT  Trip.company FROM Trip
GROUP BY company
HAVING  count(Trip.company)= 
(
SELECT MIN(CNT) FROM 
(SELECT count(*) AS CNT FROM Trip
GROUP BY Company) TT)
)

                                   
                                                
--task13  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/45
SELECT classroom FROM (SELECT classroom, count(classroom)  as cls 
from Schedule
group by classroom) as res
where  cls=5                                                
                                                
                                                
--task14  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/43
SELECT Teacher.last_name FROM Teacher
left JOIN Schedule on Teacher.id=Schedule.teacher
left JOIN Subject on Subject.id=Schedule.subject
WHERE Subject.name='Physical Culture'
ORDER BY Teacher.last_name

--task15  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/63
SELECT last_name,first_name, middle_name FROM Student
ORDER BY first_name