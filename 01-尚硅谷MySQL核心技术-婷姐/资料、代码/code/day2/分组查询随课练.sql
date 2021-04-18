select AVG(salary) ,department_id from employees group by department_id;
##表里有一项是null，那么这个就不能区分了
select AVG(salary) from employees;
##每个工种最高工资
select MAX(salary),job_id from employees group by job_id;
##查询每个位置上部门数
select count(*), location_id from departments group by location_id;

##添加筛选条件
    ##查询邮箱中包含a字符的，每个部门的平均工资
select AVG(salary) ,department_id from employees where email like '%a%' group by department_id;

    ##查询每个领导手下有奖金员工的最高工资
select MAX(salary), manager_id from employees where commission_pct is not null group by manager_id;


##分组后的筛选
    ##哪个部门员工个数大于2
select count(*) ,department_id from employees group by department_id having count(*)>2;
##不能如下去做，因为where跟在employees后，是对他进行操作，这种操作是无效的所以会报错。
# 而where这个关键字只能跟在from后，所以新的关键字是having
# select count(*) ,department_id from employees where count(*)>2 group by department_id ;

    ##查询每个工种有奖金的员工最高工资》12000
select MAX(salary), job_id from employees where commission_pct is not null group by job_id having MAX(salary)>12000;

    ##查询领导编号》102的每个领导收下员工最低收入》5000的领导编号。
select min(salary), manager_id from employees where manager_id>102 group by manager_id having min(salary)>5000;


##按表达式或函数分组
    ##按员工姓名长度分组，查询每一组的员工个数，筛选员工个数》5的
select count(*),length(last_name)
from employees
group by length(last_name)
having count(*)>5;
##group by 和num都支持别名
select count(*) num,length(last_name) len
from employees
group by len
having num>5;


##按多个字段分组
    #查询每个部门每个工种的员工的平均工资
select AVG(salary), department_id, job_id
from employees
group by department_id, job_id;
    ##按平均工资的高低排序
select AVG(salary), department_id, job_id
from employees
group by department_id, job_id
order by avg(salary) desc ;