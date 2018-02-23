create table admin(
id number(6) primary key,
name varchar2(20),
code varchar2(10) unique,
password varchar(15) not null,
power number(1) default 1,
enroll timestamp
);

create sequence seq_admin_id start with 100000 increment by 1;
insert into admin values(seq_admin_id.nextval,'超级管理员','system','159357',0,sysdate);
insert into admin values(seq_admin_id.nextval,'游客','visitor','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'普通管理员','common','159357',2,sysdate);
insert into admin values(seq_admin_id.nextval,'高级管理员','advance','159357',3,sysdate);
insert into admin values(seq_admin_id.nextval,'李四','lisi','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'张三','zhangsan','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'王五','wangwu','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'赵六','zhaoliu','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'李四','lisi1','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'张三','zhangsan1','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'王五','wangwu1','159357',1,sysdate);
insert into admin values(seq_admin_id.nextval,'赵六','zhaoliu1','159357',1,sysdate);
update admin set name=name||'员' where name not like '%员';

create table product(
id number(6) primary key,
kind number(1) not null,
name varchar2(50),
norm varchar2(50),
people varchar2(50),
enroll Timestamp
);

create sequence seq_product_id start with 100000 increment by 1;
insert into product values(seq_product_id.nextval,'高等数学A(上)','16k 同伴子',1000,22.22,sysdate);
insert into product values(seq_product_id.nextval,'c语言程序设计','32k 同伴子',2000,32.33,sysdate);
insert into product values(seq_product_id.nextval,'大学计算机基础B','32k 同伴子',1500,45.33,sysdate);
insert into product values(seq_product_id.nextval,'军事理论','16k 普通纸',1322,33.33,sysdate);
insert into product values(seq_product_id.nextval,'中国近代史纲要','16k 普通纸',1322,23.33,sysdate);
insert into product values(seq_product_id.nextval,'机械制图及CAD','16k 普通纸',1444,23.33,sysdate);

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

insert into area values(0,'A区',0);
insert into area values(1,'B区',1);
insert into area values(2,'C区',2);
insert into area values(3,'D区',3);
insert into area values(4,'E区',4);


insert into frame values(seq_frame_id.nextval,0,'A区-1');
insert into frame values(seq_frame_id.nextval,0,'A区-2');
insert into frame values(seq_frame_id.nextval,0,'A区-3');
insert into frame values(seq_frame_id.nextval,0,'A区-4');
insert into frame values(seq_frame_id.nextval,0,'A区-5');
insert into frame values(seq_frame_id.nextval,1,'B区-1');
insert into frame values(seq_frame_id.nextval,1,'B区-2');
insert into frame values(seq_frame_id.nextval,1,'B区-3');
insert into frame values(seq_frame_id.nextval,1,'B区-4');
insert into frame values(seq_frame_id.nextval,1,'B区-5');
insert into frame values(seq_frame_id.nextval,2,'C区-1');
insert into frame values(seq_frame_id.nextval,2,'C区-2');
insert into frame values(seq_frame_id.nextval,2,'C区-3');
insert into frame values(seq_frame_id.nextval,2,'C区-4');
insert into frame values(seq_frame_id.nextval,2,'C区-5');
insert into frame values(seq_frame_id.nextval,3,'D区-1');
insert into frame values(seq_frame_id.nextval,3,'D区-2');
insert into frame values(seq_frame_id.nextval,3,'D区-3');
insert into frame values(seq_frame_id.nextval,3,'D区-4');
insert into frame values(seq_frame_id.nextval,3,'D区-5');
insert into frame values(seq_frame_id.nextval,4,'E区-1');
insert into frame values(seq_frame_id.nextval,4,'E区-2');
insert into frame values(seq_frame_id.nextval,4,'E区-3');
insert into frame values(seq_frame_id.nextval,4,'E区-4');
insert into frame values(seq_frame_id.nextval,4,'E区-5');

insert into allocation values(seq_allocation_id.nextval,'A区-101',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-102',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-103',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-104',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-105',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-106',100,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-201',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-202',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-203',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-204',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-205',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-206',101,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-301',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-302',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-303',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-304',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-305',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-306',102,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-401',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-402',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-403',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-404',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-405',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-406',103,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-501',104,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-502',104,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-503',104,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-504',104,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-505',104,0,10000);
insert into allocation values(seq_allocation_id.nextval,'A区-506',104,0,10000);

insert into allocation values(seq_allocation_id.nextval,'B区-101',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-102',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-103',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-104',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-105',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-106',105,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-201',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-202',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-203',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-204',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-205',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-206',106,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-301',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-302',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-303',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-304',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-305',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-306',107,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-401',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-402',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-403',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-404',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-405',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-406',108,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-501',109,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-502',109,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-503',109,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-504',109,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-505',109,0,10000);
insert into allocation values(seq_allocation_id.nextval,'B区-506',109,0,10000);

insert into allocation values(seq_allocation_id.nextval,'C区-101',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-102',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-103',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-104',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-105',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-106',110,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-201',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-202',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-203',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-204',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-205',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-206',111,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-301',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-302',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-303',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-304',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-305',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-306',112,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-401',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-402',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-403',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-404',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-405',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-406',113,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-501',114,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-502',114,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-503',114,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-504',114,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-505',114,0,10000);
insert into allocation values(seq_allocation_id.nextval,'C区-506',114,0,10000);

insert into allocation values(seq_allocation_id.nextval,'D区-101',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-102',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-103',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-104',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-105',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-106',115,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-201',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-202',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-203',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-204',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-205',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-206',116,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-301',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-302',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-303',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-304',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-305',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-306',117,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-401',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-402',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-403',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-404',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-405',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-406',118,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-501',119,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-502',119,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-503',119,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-504',119,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-505',119,0,10000);
insert into allocation values(seq_allocation_id.nextval,'D区-506',119,0,10000);

insert into allocation values(seq_allocation_id.nextval,'E区-101',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-102',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-103',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-104',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-105',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-106',120,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-201',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-202',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-203',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-204',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-205',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-206',121,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-301',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-302',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-303',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-304',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-305',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-306',122,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-401',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-402',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-403',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-404',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-405',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-406',123,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-501',124,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-502',124,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-503',124,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-504',124,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-505',124,0,10000);
insert into allocation values(seq_allocation_id.nextval,'E区-506',124,0,10000);