create database Timetable
use Timetable
go
create table Slot (slotID int primary key, time nvarchar(30))
create table Class(classID int primary key, className nvarchar(30))
create table Room(roomID int primary key, RoomName nvarchar(30))
create table Teacher(teacherID int primary key, teacherName nvarchar(30))
create table Timetable(date date,slotID int ,classID int,teacherID int,roomID int)

insert into  Slot values(1,'7h30'' - 9h')
insert into  Slot values(2,'9h10'' - 10h40''')
insert into  Slot values(3,'10h50'' - 12h20''')
insert into  Slot values(4,'12h50'' - 14h20''')
insert into  Slot values(5, '14h30'' - 16h')
insert into  Slot values(6, '16h10'' - 17h40''')

insert into Class values(1,'SE1429')
insert into Class values(2,'SE1430')
insert into Class values(3,'SE1431')

insert into Teacher values(1,'DuongTB')
insert into Teacher values(2,'TriTD')
insert into Teacher values(3,'ChiLP')

insert into Room values(1,'BE-410')
insert into Room values(2,'BE-310')
insert into Room values(3,'AL-R201')



insert into Timetable values ('2021/06/24',1,3,1,3)
insert into Timetable values ('2021/06/23',2,2,1,3)
insert into Timetable values ('2021/06/25',3,1,1,3)
insert into Timetable values ('2021/06/24',4,3,1,3)
insert into Timetable values ('2021/06/22',5,2,1,3)
insert into Timetable values ('2021/06/21',6,1,1,3)
insert into Timetable values ('2021/06/20',2,3,1,3)
insert into Timetable values ('2021/06/22',1,1,1,3)
insert into Timetable values ('2021/06/26',3,1,2,3)

select a.date,a.slotID,b.time,c.className,d.teacherName,e.RoomName from Timetable a 
join Slot b on a.slotID = b.slotID 
join Class c on a.classID = c.classID
join Teacher d  on a.teacherID = d.teacherID
join Room e   on a.roomID = e.roomID
where a.date between '2021-06-10' and '2021-06-24'

select * from Teacher where teacherName = 'DuongTB'
select * from Timetable where date='2021/06/26'and slotID='3' and teacherID = 2
select * from Timetable where date='2021/06/20' and slotID='1' and roomID = 3

select * from Timetable
select * from Class
select * from Slot
select * from Teacher
