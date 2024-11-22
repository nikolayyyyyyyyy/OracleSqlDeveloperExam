create table authors(
    "id" number primary key,
    first_name varchar2(50) not null,
    last_name varchar2(50) not null
)

create table pushing_houses(
    "id" number primary key,
    "name" varchar2(50) unique not null
)

create table genres(
    "id" number primary key,
    "name" varchar2(50) unique not null
)

create table positions(
    "id" number primary key,
    "name" varchar2(50) unique not null
)

create table employees(
    "id" number primary key,
    first_name varchar2(50) not null,
    last_name varchar2(50) not null,
    telephone_number varchar(10) not null,
    position_id number not null,
    constraint fk_position_id foreign key (position_id) references positions("id")
)

alter table employees
add constraint ck_employee_telephone_length
check (length(telephone_number) = 10);

create table readers(
    "id" number primary key,
    first_name varchar2(50) not null,
    last_name varchar2(50) not null,
    telephone_number varchar2(10)
)

alter table readers
add constraint ck_reader_telephone_length
check (length(telephone_number) <= 10);

create table books(
    "id" number primary key,
    "name" varchar2(200) unique not null,
    date_of_issue date not null,
    author_id number not null,
    pushing_house_id number not null,
    genre_id number not null,
    constraint fk_genre_id foreign key (genre_id) references genres("id"),
    constraint fk_author_id foreign key (author_id) references authors("id"),
    constraint fk_pushing_house_id foreign key (pushing_house_id) references pushing_houses("id")
)

create table browings(
    "id" number primary key,
    reader_id number not null,
    employee_id number not null,
    constraint fk_reader_id foreign key (reader_id) references readers("id"),
    constraint fk_employee_id foreign key (employee_id) references employees("id")
)

create table books_browings(
    book_id number,
    browing_id number,
    book_loan_date date not null,
    "term" date not null,
    is_returned char(1) not null,
    primary key(book_id,browing_id),
    constraint fk_book_id foreign key (book_id) references books("id"),
    constraint fk_browing_id foreign key (browing_id) references browings("id")
)

create sequence author_seq start with 1 increment by 1 
create sequence pushing_house_seq start with 1 increment by 1 
create sequence genre_seq start with 1 increment by 1 
create sequence position_seq start with 1 increment by 1 
create sequence employee_seq start with 1 increment by 1 
create sequence reader_seq start with 1 increment by 1 
create sequence book_seq start with 1 increment by 1 
create sequence browing_seq start with 1 increment by 1 

insert into authors ("id",first_name,last_name) values (author_seq.nextval,'Николай','Николаев')
insert into authors ("id",first_name,last_name) values (author_seq.nextval,'Атанас','Генчев')
insert into authors ("id",first_name,last_name) values (author_seq.nextval,'Иван','Калимаров')

insert into pushing_houses ("id","name") values (pushing_house_seq.nextval,'Кентавър')
insert into pushing_houses ("id","name") values (pushing_house_seq.nextval,'Арес')
insert into pushing_houses ("id","name") values (pushing_house_seq.nextval,'Леприкон')
insert into pushing_houses ("id","name") values (pushing_house_seq.nextval,'Кронос')

insert into genres ("id","name") values (genre_seq.nextval,'Фентъзи')
insert into genres ("id","name") values (genre_seq.nextval,'Трилър')
insert into genres ("id","name") values (genre_seq.nextval,'Криминалистика')
insert into genres ("id","name") values (genre_seq.nextval,'Романтика')
insert into genres ("id","name") values (genre_seq.nextval,'История')

insert into positions ("id","name") values (position_seq.nextval,'Библиотекар')

insert into employees ("id",first_name,last_name,telephone_number,position_id) values (employee_seq.nextval,'Христо','Николаев','0891233332',1)
insert into employees ("id",first_name,last_name,telephone_number,position_id) values (employee_seq.nextval,'Дияна','Радкева','0891987332',1)
insert into employees ("id",first_name,last_name,telephone_number,position_id) values (employee_seq.nextval,'Иван','Радкев','0891246332',1)
insert into employees ("id",first_name,last_name,telephone_number,position_id) values (employee_seq.nextval,'Радка','Николаева','0891244432',1)

insert into readers ("id",first_name,last_name,telephone_number) values (reader_seq.nextval,'Микаела','Василева','087652234')
insert into readers ("id",first_name,last_name,telephone_number) values (reader_seq.nextval,'Дидия','Генчева','0887653334')
insert into readers ("id",first_name,last_name,telephone_number) values (reader_seq.nextval,'Мирела','Георгиева','0887456234')
insert into readers ("id",first_name,last_name,telephone_number) values (reader_seq.nextval,'Деница','Златева','0887999234')

insert into books ("id","name",date_of_issue,pushing_house_id,author_id,genre_id) 
    values (book_seq.nextval,'Легенди за древния свят','2024-01-03',2,1,1)
insert into books ("id","name",date_of_issue,pushing_house_id,author_id,genre_id) 
    values (book_seq.nextval,'Тъмната мрежа','2024-05-11',1,1,2)
insert into books ("id","name",date_of_issue,pushing_house_id,author_id,genre_id) 
    values (book_seq.nextval,'Под небето на Париж','2024-12-23',2,1,4)
    
insert into books ("id","name",date_of_issue,pushing_house_id,author_id,genre_id) 
    values (book_seq.nextval,'В сенките на революцията','2024-03-03',3,2,5)
insert into books ("id","name",date_of_issue,pushing_house_id,author_id,genre_id) 
    values (book_seq.nextval,'Летни нощи','2024-04-21',1,2,4)
insert into books ("id","name",date_of_issue,pushing_house_id,author_id,genre_id) 
    values (book_seq.nextval,'Следите на престъплението','2024-01-03',4,2,3)
    
insert into books ("id","name",date_of_issue,pushing_house_id,author_id,genre_id) 
    values (book_seq.nextval,'Последното предателство','2024-09-16',1,3,2)
insert into books ("id","name",date_of_issue,pushing_house_id,author_id,genre_id) 
    values (book_seq.nextval,'Златния дракон','2024-11-04',3,3,1)
insert into books ("id","name",date_of_issue,pushing_house_id,author_id,genre_id) 
    values (book_seq.nextval,'Тайните на магическия лес','2024-03-12',4,3,1)
    
insert into browings ("id",reader_id,employee_id) values (browing_seq.nextval,1,3)
insert into browings ("id",reader_id,employee_id) values (browing_seq.nextval,2,4)
insert into browings ("id",reader_id,employee_id) values (browing_seq.nextval,3,2)
insert into browings ("id",reader_id,employee_id) values (browing_seq.nextval,4,1)

insert into books_browings (book_id,browing_id,book_loan_date,"term",is_returned) values (1,1,'2024-03-12','2024-03-14',0)
insert into books_browings (book_id,browing_id,book_loan_date,"term",is_returned) values (2,2,'2024-04-02','2024-04-05',0)
insert into books_browings (book_id,browing_id,book_loan_date,"term",is_returned) values (3,1,'2024-03-12','2024-03-26',0)

insert into books_browings (book_id,browing_id,book_loan_date,"term",is_returned) values (4,2,'2024-04-02','2024-04-10',0)
insert into books_browings (book_id,browing_id,book_loan_date,"term",is_returned) values (5,2,'2024-04-02','2024-04-22',0)
insert into books_browings (book_id,browing_id,book_loan_date,"term",is_returned) values (6,1,'2024-03-12','2024-04-01',0)

insert into books_browings (book_id,browing_id,book_loan_date,"term",is_returned) values (7,4,'2024-03-12','2024-03-16',0)
insert into books_browings (book_id,browing_id,book_loan_date,"term",is_returned) values (8,3,'2024-07-02','2024-10-23',0)
insert into books_browings (book_id,browing_id,book_loan_date,"term",is_returned) values (9,4,'2024-03-12','2024-03-25',0)


--Книги по автор
select
b."name" as "Име на книга",
p."name" as "Издателство",
g."name" as "Жанр",
a.first_name || ' ' || a.last_name as "Автор"
from books b
join genres g on g."id" = b.genre_id
join pushing_houses p on p."id" = b.pushing_house_id
join authors a on a."id" = b.author_id
where a."id" = 1

--Книга по ключова дума от наименование
select
b."name" as "Име на книга",
p."name" as "Издателство",
g."name" as "Жанр",
a.first_name || ' ' || a.last_name as "Автор"
from books b
join genres g on g."id" = b.genre_id
join pushing_houses p on p."id" = b.pushing_house_id
join authors a on a."id" = b.author_id
where b."name" like '%на%'

--Книга по жанр
select
b."name" as "Име на книга",
p."name" as "Издателство",
g."name" as "Жанр",
a.first_name || ' ' || a.last_name as "Автор"
from books b
join genres g on g."id" = b.genre_id
join pushing_houses p on p."id" = b.pushing_house_id
join authors a on a."id" = b.author_id
where g."name" = 'Трилър'

--Заети книги от читател
select
b."name" as "Име на книга",
a.first_name || ' ' || a.last_name as "Име на автор",
p."name" as "Издателство",
g."name" as "Жанр",
r.first_name || ' ' || r.last_name as "Заемател",
e.first_name || ' ' || e.last_name as "Служител",
bb.book_loan_date as "Дата на заемане",
bb."term" as "Дата на връщане",
bb.is_returned as "Върната"
from books b
join books_browings bb on bb.book_id = b."id"
join browings br on br."id" = bb.browing_id
join authors a on a."id" = b.author_id
join pushing_houses p on p."id" = b.pushing_house_id
join genres g on g."id" = b.genre_id
join readers r on r."id" = br.reader_id
join employees e on e."id" = br.employee_id
where r."id" = 2

--Невърнати книги подредени по дата
select
b."name" as "Име на книга",
a.first_name || ' ' || a.last_name as "Име на автор",
p."name" as "Издателство",
g."name" as "Жанр",
r.first_name || ' ' || r.last_name as "Заемател",
e.first_name || ' ' || e.last_name as "Служител",
bb.book_loan_date as "Дата на заемане",
bb."term" as "Дата на връщане",
bb.is_returned as "Върната"
from books b
join books_browings bb on bb.book_id = b."id"
join browings br on br."id" = bb.browing_id
join authors a on a."id" = b.author_id
join pushing_houses p on p."id" = b.pushing_house_id
join genres g on g."id" = b.genre_id
join readers r on r."id" = br.reader_id
join employees e on e."id" = br.employee_id
where bb.is_returned = 0
order by bb.book_loan_date

--Връщане на книга
update books_browings
    set is_returned = 1
where book_id = 2 and browing_id = 2
