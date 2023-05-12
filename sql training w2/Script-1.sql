set autocommit=0;

-- Insert untuk 5 record & commited.
insert into employees 
	values
	('2000','Herviana','Ria','x3809','herviana.ria@mail.com','1','1002','VP Sales'),
	('2001','Rachmawati','Nova','x3501','rachmawati.nova@mail.com','1','1002','VP Marketing'),
	('2002','Sumaryani','Nani','x4861','sumaryani.nani@mail.com','3','1143','Sales Rep'),
	('2003','Wijaya','Andi','x2975','wijaya.andi@mail.com','3','1143','Sales Rep'),
	('2004','Makaila','Zihan','x9853','zihan.makaila@mail.com','3','1143','Sales Rep');
	
commit;

select * from employees e;




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