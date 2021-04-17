SELECT 
	last_name,
	salary
FROM
	employees
WHERE
	salary>12000;
	
#2
SELECT 
	last_name,
	department_id,
	salary*12*(1+IFNULL(commission_pct,0)) AS 年薪  #注意这里commission_pct可能为null，所以要用ifnull
FROM
	employees
WHERE
	employee_id=176;
	
#3
SELECT 
	last_name,
	salary
FROM
	employees
WHERE
	salary NOT BETWEEN 5000 AND 12000;

#4
SELECT 
	last_name,
	department_id
FROM
	employees
WHERE
	department_id IN (20, 50);
	
#5
SELECT 
	last_name,
	job_id
FROM
	employees
WHERE
	manager_id IS NULL;
	
#6
SELECT 
	last_name,
	salary,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NOT NULL;
	
#7
SELECT 
	CONCAT(last_name," ",first_name)
FROM
	employees
WHERE
	last_name LIKE '__a%';
	
#8
SELECT
	CONCAT(last_name," ",first_name)
FROM
	employees
WHERE
	last_name LIKE '%a%e%';
	
#9
SELECT
	*
FROM
	employees
WHERE
	first_name LIKE '%e';
	
#10
SELECT 
	last_name,
	job_id
FROM
	employees
WHERE
	department_id BETWEEN 80 AND 100;
	
#11
SELECT 
	last_name,
	job_id
FROM
	employees
WHERE
	manager_id IN(101,100,110);