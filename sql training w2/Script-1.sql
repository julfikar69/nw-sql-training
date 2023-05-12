set autocommit=0;

-- query untukk Melakukan Transaction SQL

-- a. Insert untuk 5 record & commited.
insert into employees 
	values
	('2000','Herviana','Ria','x3809','herviana.ria@mail.com','1','1002','VP Sales'),
	('2001','Rachmawati','Nova','x3501','rachmawati.nova@mail.com','1','1002','VP Marketing'),
	('2002','Sumaryani','Nani','x4861','sumaryani.nani@mail.com','3','1143','Sales Rep'),
	('2003','Wijaya','Andi','x2975','wijaya.andi@mail.com','3','1143','Sales Rep'),
	('2004','Makaila','Zihan','x9853','zihan.makaila@mail.com','3','1143','Sales Rep');
	
commit;
select * from employees e;

-- b. Insert/update/delete di 1 sesi dan read table di sesi yg berbeda.

start transaction;

insert into employees
values ('2005','Fadilah','Tasya','x9714','fadilah.tasya@mail.com','6','1056','Sales Manager (APAC)');

update employees set lastName = "Firmansyah", firstName = "Muhammad" where employeeNumber = '2002';

delete from employees where employeeNumber = '2004';

commit;

-- c. Rollback ke savepoint.

start transaction;

update employees set extension = 'x666' where employeeNumber > 2000;

savepoint exampleSavepoint;

delete from employees where employeeNumber > 2000;

rollback to savepoint exampleSavepoint;

commit;



-- query untuk poin soal Eksekusi script sql subquery pada modul training:

-- a. SELECT statement
select * from employees e where officeCode = (select officeCode from offices o where o.city = "Tokyo");

-- b. INSERT statement
insert into employees_tokyo select * from employees e where officeCode = (select officeCode from offices o where o.city = "Tokyo");

-- c. UPDATE statement
update customers c set c.creditLimit = c.creditLimit * 0.15 where c.customerNumber in (select customerNumber from payments p group by customerNumber having count(customerNumber) > 5);

-- d. DELETE statement
delete from employees_backup where officeCode in (select officeCode from offices o where o.city = "Tokyo");

-- f. Query dari Subquery sebagai source data
select firstname from (select * from employees where employeeNumber not in (select reportsTo from employees)) as managers;

-- g. Combine query UNION
select employeeNumber, firstName, jobTitle from employees where officeCode in (select officeCode from offices where city = 'Tokyo')
union
select employeeNumber, firstName, jobTitle from employees where officeCode in (select officeCode from offices where city = 'London');

-- h. Combine query INTERSECT
select products.productLine
from products
where products.productLine in (select productLine from productlines);

-- GOCAR

create table pesanan ( idPesanan varchar(20) not null primary key, tanggal date, namaPemesan varchar(50), noPolisiDriver varchar(10));
desc pesanan;

create table driver (noPolisiDriver varchar(10) not null primary key, namaDriver varchar(50), mobil varchar(20));
desc driver;

create table pembayaran (idPesanan varchar(20), totalBayar int, biayaPerjalanan int, jasaAplikasi int, totalPembayaran int);
desc pembayaran;

create table perjalanan (idPesanan varchar(20), jarak double, waktuPerjalanan int, jamJemput time, lokasiAwal varchar(50), alamatAwal text, jamSampai time, lokasiAkhir varchar(50), alamatAkhir text);
desc perjalanan;

alter table pesanan 
add constraint fk_noPolisiDriver foreign key (noPolisiDriver)
references driver(noPolisiDriver);

alter table pembayaran
add constraint fk_idPesanan foreign key (idPesanan)
references pesanan(idPesanan);

alter table perjalanan 
add constraint fk_idPesanan_perjalanan foreign key (idPesanan)
references pesanan(idPesanan);


insert into driver 
values ('Z 1830 TD', 'Heryawan','Daihatsu Sigra');
select * from driver ;

insert into pesanan 
values ('RB-191274-3068613', '2022-12-21', 'Balqis Rizki Permata','Z 1830 TD');
select * from pesanan;

insert into pembayaran 
values ('RB-191274-3068613', '30000','26000','4000','30000');
select * from pembayaran ;

insert  into perjalanan 
values 
('RB-191274-3068613','3.0','16','17:09','STIKES MUHAMMADIYAH CIAMIS','JL. K. H. Ahmad Dahlan No. 20, Ciamis, Kec. Ciamis Kabupaten Ciamis, Jawa Barat 46216, Indonesia','17:25','Toko Ujang Haji Jana','JL. Otista No. 46, Pawindan, Kec. Ciamis, Kabupaten Ciamis, Jawa Barat 46218, Indonesia');
select * from perjalanan ;


commit;