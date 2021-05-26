drop database if exists muzej;
create database muzej;
use muzej;


create table umijetnik(
id int not null primary key auto_increment,
ime varchar(30) not null,
prezime varchar(30) not null,
srednje_ime varchar(30),
godina_rodjenja datetime,
godina_smrti datetime
);


create table dijelo(
id int not null primary key auto_increment,
naziv varchar(50) not null,
nastalo datetime,
opis varchar(1000),
umijetnik int
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
clan int,
dijelo int
);

create table clan(
id int not null primary key auto_increment,
kustos int not null,
izlozba int not null
);

create table sponzor(
id int not null primary key auto_increment,
ime varchar(50) not null,
email varchar(50) not null,
uplaceno decimal(18,2),
izlozba int
);


alter table dijelo add foreign key (umijetnik) references umijetnik(id);
alter table izlozba add foreign key (dijelo) references dijelo(id);
alter table clan add foreign key (izlozba) references izlozba(id);
alter table clan add foreign key (kustos) references kustos(id);
alter table sponzor add foreign key (izlozba ) references izlozba(id);

insert into umijetnik (ime ,srednje_ime ,prezime ,godina_rodjenja ,godina_smrti ) values
('Leonardo','da ','Vinci','1452-04-15','1519-05-02'),
('Michelangelo ','di Lodovico Buonarrot','Buonarroti','1475-03-06','1564-02-18'),
('Raffaello',' Santi da',' Urbino','1483-04-06','1520-04-06');
#('Donato','di Niccolo di Betto','Bardi','1386-00-00','1466-12-13');