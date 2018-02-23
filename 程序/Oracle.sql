create table admin(
id number(6) primary key,
name varchar2(20),
code varchar2(10) unique,
password varchar(15) not null,
power number(1) default 1,
enroll timestamp
);

create sequence seq_admin_id start with 100000 increment by 1;
insert into admin values(seq_admin_id.nextval,'��������Ա','system','159357',0,sysdate);
insert into admin values(seq_admin_id.nextval,'�ο�','visitor','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'��ͨ����Ա','common','159357',2,sysdate);
insert into admin values(seq_admin_id.nextval,'�߼�����Ա','advance','159357',3,sysdate);
insert into admin values(seq_admin_id.nextval,'����','lisi','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'����','zhangsan','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'����','wangwu','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'����','zhaoliu','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'����','lisi1','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'����','zhangsan1','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'����','wangwu1','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'����','zhaoliu1','159357',1,sysdate);
update admin set name=name||'Ա' where name not like '%Ա';

create table product(
id number(6) primary key,
kind number(1) not null,
name varchar2(50),
norm varchar2(50),
people varchar2(50),
enroll Timestamp
);

create sequence seq_product_id start with 100000 increment by 1;
insert into product values(seq_product_id.nextval,'�ߵ���ѧA(��)','16k ͬ����',1000,22.22,sysdate);
insert into product values(seq_product_id.nextval,'c���Գ������','32k ͬ����',2000,32.33,sysdate);
insert into product values(seq_product_id.nextval,'��ѧ���������B','32k ͬ����',1500,45.33,sysdate);
insert into product values(seq_product_id.nextval,'��������','16k ��ֽͨ',1322,33.33,sysdate);
insert into product values(seq_product_id.nextval,'�й�����ʷ��Ҫ','16k ��ֽͨ',1322,23.33,sysdate);
insert into product values(seq_product_id.nextval,'��е��ͼ��CAD','16k ��ֽͨ',1444,23.33,sysdate);

create table area(
area_id number(1) primary key,
area_name varchar2(20),
kind number(1)
);

create table frame(
frame_id number(6) primary key,
area_id number(6) not null,
frame_name varchar2(20)
);
create sequence seq_frame_id start with 100 increment by 1;
create table allocation(
allocation_id number(6) primary key,
allocation_name varchar2(20),
frame_id number(6) default 0 not null,
product_id number(6),
num number(6) default 0,
remainder number(6) default 10000 check (remainder >= 0)
);

create sequence seq_allocation_id start with 1000 increment by 1;
create table record(
id number(6) primary key,
kind number(1) not null,
product_id number(6) not null,
admin_id number(6),
num number(6),
info varchar2(500),
oname varchar2(500),
enroll timestamp
);
create table apply(
kind number(1) not null,
product_id number(6) not null,
admin_id number(6),
num number(6),
oname varchar2(500),
enroll timestamp,
status number(1) default 0
);
create sequence seq_apply_id start with 1000 increment by 1;

create sequence seq_record_id start with 100000 increment by 1;

insert into area values(0,'A��',0);
insert into area values(1,'B��',1);
insert into area values(2,'C��',2);
insert into area values(3,'D��',3);
insert into area values(4,'E��',4);


insert into frame values(seq_frame_id.nextval,0,'A��-1');
insert into frame values(seq_frame_id.nextval,0,'A��-2');
insert into frame values(seq_frame_id.nextval,0,'A��-3');
insert into frame values(seq_frame_id.nextval,0,'A��-4');
insert into frame values(seq_frame_id.nextval,0,'A��-5');
insert into frame values(seq_frame_id.nextval,1,'B��-1');
insert into frame values(seq_frame_id.nextval,1,'B��-2');
insert into frame values(seq_frame_id.nextval,1,'B��-3');
insert into frame values(seq_frame_id.nextval,1,'B��-4');
insert into frame values(seq_frame_id.nextval,1,'B��-5');
insert into frame values(seq_frame_id.nextval,2,'C��-1');
insert into frame values(seq_frame_id.nextval,2,'C��-2');
insert into frame values(seq_frame_id.nextval,2,'C��-3');
insert into frame values(seq_frame_id.nextval,2,'C��-4');
insert into frame values(seq_frame_id.nextval,2,'C��-5');
insert into frame values(seq_frame_id.nextval,3,'D��-1');
insert into frame values(seq_frame_id.nextval,3,'D��-2');
insert into frame values(seq_frame_id.nextval,3,'D��-3');
insert into frame values(seq_frame_id.nextval,3,'D��-4');
insert into frame values(seq_frame_id.nextval,3,'D��-5');
insert into frame values(seq_frame_id.nextval,4,'E��-1');
insert into frame values(seq_frame_id.nextval,4,'E��-2');
insert into frame values(seq_frame_id.nextval,4,'E��-3');
insert into frame values(seq_frame_id.nextval,4,'E��-4');
insert into frame values(seq_frame_id.nextval,4,'E��-5');

insert into allocation values(seq_allocation_id.nextval,'A��-101',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-102',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-103',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-104',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-105',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-106',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-201',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-202',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-203',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-204',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-205',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-206',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-301',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-302',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-303',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-304',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-305',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-306',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-401',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-402',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-403',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-404',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-405',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-406',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-501',104,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-502',104,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-503',104,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-504',104,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-505',104,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A��-506',104,0,10000);

insert into allocation values(seq_allocation_id.nextval,'B��-101',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-102',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-103',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-104',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-105',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-106',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-201',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-202',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-203',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-204',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-205',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-206',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-301',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-302',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-303',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-304',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-305',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-306',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-401',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-402',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-403',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-404',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-405',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-406',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-501',109,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-502',109,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-503',109,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-504',109,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-505',109,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B��-506',109,0,10000);

insert into allocation values(seq_allocation_id.nextval,'C��-101',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-102',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-103',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-104',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-105',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-106',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-201',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-202',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-203',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-204',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-205',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-206',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-301',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-302',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-303',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-304',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-305',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-306',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-401',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-402',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-403',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-404',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-405',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-406',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-501',114,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-502',114,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-503',114,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-504',114,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-505',114,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C��-506',114,0,10000);

insert into allocation values(seq_allocation_id.nextval,'D��-101',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-102',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-103',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-104',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-105',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-106',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-201',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-202',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-203',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-204',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-205',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-206',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-301',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-302',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-303',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-304',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-305',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-306',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-401',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-402',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-403',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-404',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-405',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-406',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-501',119,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-502',119,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-503',119,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-504',119,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-505',119,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D��-506',119,0,10000);

insert into allocation values(seq_allocation_id.nextval,'E��-101',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-102',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-103',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-104',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-105',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-106',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-201',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-202',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-203',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-204',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-205',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-206',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-301',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-302',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-303',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-304',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-305',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-306',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-401',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-402',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-403',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-404',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-405',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-406',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-501',124,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-502',124,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-503',124,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-504',124,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-505',124,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E��-506',124,0,10000);