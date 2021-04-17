use myemployees;
#1. 下面的语句是否可以执行成功
select last_name , job_id , salary as sal from employees; 
#这里起别名只是针对salary起别名
#2. 下面的语句是否可以执行成功
select  *  from employees;
#3. 找出下面语句中的错误
select employee_id , last_name, salary * 12 as "ANNUAL SALARY" from employees;
#4. 显示表 departments 的结构，并查询其中的全部数据
desc departments;
select * from departments;
#5. 显示出表 employees 中的全部 job_id（不能重复）
select distinct job_id from employees;
#6. 显示出表 employees 的全部列，各个列之间用逗号连接，列头显示成OUT_PUT
select
concat(employee_id,',',last_name,',',commission_pct) as out_put 
from employees;
#上面语句运行结果为null，就是因为拼接中有一项为null
#，可以使用select * from employees来看，知道哪个为none后
#，就使用ifnull函数
select ifnull(commission_pct, 0) as 奖金率 from employees;
#ifnull传入两个参数 一个是有可能为null的变量。
#另一个是想把null变为什么。
select
concat(employee_id,',',last_name,',',ifnull(commission_pct,0)) as out_put 
from employees;