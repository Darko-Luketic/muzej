drop database if exists muzej;
create database muzej;
use muzej;


create table umijetnik(
id int not null primary key auto_increment,
ime varchar(30),
prezime varchar(30),
srednje_ime varchar(30),
godina_rodjenja datetime,
godina_smrti datetime
);


create table dijelo(
id int not null primary key auto_increment,
naziv varchar(50),
nastalo datetime,
opis varchar(1000),
umijetnik int
);


create table kustos(
id int not null primary key auto_increment,
ime varchar(30),
prezime varchar(30),
oib char(11),
email varchar(50)
);

create table izlozba(
id int not null primary key auto_increment,
naziv varchar(60),
pocetak datetime,
zavrsetak datetime,
clan int,
dijelo int
);

create table clan(
id int not null primary key auto_increment,
kustos int,
izlozba int
);

create table sponzor(
id int not null primary key auto_increment,
ime varchar(50),
email varchar(50),
uplaceno decimal(18,2),
izlozba int
);


alter table dijelo add foreign key (umijetnik) references umijetnik(id);
alter table izlozba add foreign key (dijelo) references dijelo(id);
alter table clan add foreign key (izlozba) references izlozba(id);
alter table clan add foreign key (kustos) references kustos(id);
alter table sponzor add foreign key (izlozba ) references izlozba(id);

