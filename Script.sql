#querying data
select 
	firstName ,
	lastName ,
	email ,
	jobTitle 
from employees e ;

#sorting data
select 
	firstName ,
	lastName ,
	email ,
	jobTitle 
from employees e 
order by firstName ;

#filtering data
select 
	firstName ,
	lastName ,
	email ,
	jobTitle 
from employees e 
where jobTitle = 'Sales Rep' 
order by firstName 
;

#Join
select
	c.customerName ,
	c.phone ,
	o.orderDate ,
	o.shippedDate ,
	o.status
from
	orders o
inner join customers c 
on
	o.customerNumber = c.customerNumber
order by
	orderDate desc;

#Agregate
select c.customerName ,count(*) as orderTotal 
from orders o 
inner join customers c 
on o.customerNumber = c.customerNumber 
group by c.customerName ;

#create table employees detail
create table employee_details
(
	employeeNumber int, 
	address varchar(50), 
	phone varchar(50), 
	city varchar(50), 
	state varchar(50), 
	postalCode varchar(15)
);

#alter table to add contstaint foreign key
alter table employee_details 
add constraint FK_Employee_Details foreign key (employeeNumber)
references employees(employeeNumber);

#insert to employee details
insert into employee_details 
values 
('1056','jl.binong jati', '084138191704', 'Bandung', 'Jabar', '40256'),
('1076','jl.babakan jati', '084138192384', 'Bandung', 'Jabar', '40253'),
('1088','jl.binong kulon', '084138187684', 'Bandung', 'Jabar', '40250');

#update table employees 
update employees 
set firstName = 'Julfikar', lastName ='Purnawirawan'
where employeeNumber = '1002';

#delete from employee_details
delete from employee_details 
where employeeNumber = '1088';

#Numeric Operation
select 
	p.productName,
	p.buyPrice, 
	p.buyPrice * 0.11 as tax, 
	p.buyPrice * 1.11 as totalPrice
from
	products p ;

#Indexing
create index productVendor on
products(productVendor);

show index from products;



