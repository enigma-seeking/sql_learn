#进阶一：基础查询
/*
语法：
select 查询列表 from 表名

类似于System.out.println()
特点：
1.查询列表可以是：表中的字段、常量、表达式、函数
2.查询的结果是一个虚拟的表格。
*/
use myemployees;  #查询前先指定库

#1.查询表中的单个字段。
select last_name from employees;
#2.查询表中的多个字段
select last_name,salary,email from employees;
#3.查询表中所有字段
select * from employees;

#select `name` from stuinfo  
#上面这个命令，如果不在name那里增加着重号，读代码的人和机器不清楚这个name是关键字还是字段名，
#加了着重号就代表是字段名。

#4.查询常量值
select 100;
select 'john';

#5.查询表达式
select 100%9;

#6.查询函数
select VERSION();

#7.起别名  便于理解
#使用as
select 100%98 as 结果;
select last_name as 姓,first_name as 名 from employees;
#使用空格
select last_name 姓,first_name 名 from employees;
#查询salary,显示结果为out put 会发现报错，因为别名带有特殊符号（空格和井号），推荐使用双引号

#去重 distinct
# 案例：查询员工表中涉及到的所有部门编号
select department_id from employees;
select distinct department_id from employees;

#加号的作用
#案例:查询员工名和姓连接成一个字段，并显示为姓名
select last_name+first_name as 姓名 from employees;#没达到理想效果，都是0
#加号在sql中只有运算符的作用  转换成数值运算，转换失败则结果为零
#只要一方为null，则结果肯定为null
#想拼接要用函数 CONCAT
select concat('a','b','c') as 'name';
select concat(last_name,first_name) as 姓名 from employees;