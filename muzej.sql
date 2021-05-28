drop database if exists muzej;
create database muzej;
use muzej;


create table umjetnik(
id int not null primary key auto_increment,
ime varchar(30) not null,
prezime varchar(30) not null,
srednje_ime varchar(30),
godina_rodjenja datetime,
godina_smrti datetime
);


create table djelo(
id int not null primary key auto_increment,
naziv varchar(50) not null,
nastalo datetime,
opis varchar(1000),
umjetnik int,
izlozba int
);


create table kustos(
id int not null primary key auto_increment,
ime varchar(30) not null,
prezime varchar(30) not null,
oib char(11) not null,
email varchar(50) not null
);

create table izlozba(
id int not null primary key auto_increment,
naziv varchar(60) not null,
pocetak datetime not null,
zavrsetak datetime not null,
kustos_izlozba int,
sponzor int
);

create table kustos_izlozba(
id int not null primary key auto_increment,
kustos int not null,
izlozba int not null
);

create table sponzor(
id int not null primary key auto_increment,
ime varchar(50) not null,
email varchar(50) not null,
uplaceno decimal(18,2)
);


alter table djelo add foreign key (umjetnik) references umjetnik(id);
alter table djelo add foreign key (izlozba ) references izlozba(id);
alter table kustos_izlozba add foreign key (izlozba) references izlozba(id);
alter table kustos_izlozba add foreign key (kustos) references kustos(id);
alter table izlozba add foreign key (sponzor ) references sponzor(id);

insert into umjetnik (ime ,srednje_ime ,prezime ,godina_rodjenja ,godina_smrti ) values
('Leonardo','da ','Vinci','1452-04-15','1519-05-02'),
('Michelangelo ','di Lodovico Buonarrot','Buonarroti','1475-03-06','1564-02-18'),
('Raffaello',' Santi da',' Urbino','1483-04-06','1520-04-06');
#('Donato','di Niccolo di Betto','Bardi','1386-00-00','1466-12-13');