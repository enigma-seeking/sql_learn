#进阶二：条件查询
/*
语法：
		select 
				查询列表
		from
				表名
		where
				筛选条件;
执行条件：首先是表名，看看有没有这个表，如果有这个表就定位到表了。
		其次是筛选，看看哪一行符合条件。

分类：
一。按条件表达式筛选
	条件运算符< > = <>(mysql中的不等于)

二。按逻辑表达式查询
	逻辑运算符：and or not
    
三。模糊查询
	like 
    between and
    in
    is null
 
*/
#按条件表达式查询。
#案例1：查询工资>12000的员工信息
SELECT * FROM employees WHERE salary>12000;

#案例二alter#部门编号不等于90号的员工名和部门编号
SELECT last_name ,department_id FROM employees WHERE department_id<>90;

#按逻辑表达式筛选
SELECT * FROM employees WHERE NOT(department_id<90 OR department_id>110) OR salary>15000;

#模糊查询
#案例1：查询员工名中包含字符a的员工信息
#like 一般和通配符搭配使用。%就是任意多个字符 _ 任意单个字符
SELECT * FROM employees WHERE last_name LIKE '%a%';#字符型必须用单引号，在这里通配符是用%
SELECT last_name FROM employees WHERE last_name LIKE '__n_l%';
#反义字符

#between and(包含临界值，临界值不能颠倒)


#案例1：查询员工编号在100到120之间的员工信息
SELECT * FROM employees WHERE employee_id BETWEEN 100 AND 120;

#3.in(针对多or情况  判断某字段的值是否属于in列表中的某一项)
#特点：in列表是同类型   用逗号隔开   不支持通配符
#案例：查询员工的工种编号是 IT_PROG AD_VP AD_PRES中的一个员工名和工种编号

SELECT last_name , job_id FROM
employees
WHERE
job_id = 'IT_PROG' OR job_id = 'AD_VP' OR job_id = 'AD_PRES';

SELECT last_name , job_id FROM
employees
WHERE
job_id IN('IT_PROG' , 'AD_VP' , 'AD_PRES');


#4.is null
/*
条件表达式不能判断null值
而is null 和is not null可以判断
*/
#案例1 查询没有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NULL;
	
#查询有奖金的
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NOT NULL;
