drop database radioteca;

create database radioteca;

use radioteca;

create table Usuarios(
	nick varchar(10) primary key,
    clave varchar(10)
); 

insert into Usuarios(nick,clave) values ('admin','asd');


create table Paises(
	nombre varchar(15) primary key,
    imagen varchar(200)
);

insert into Paises(nombre) values ("Uruguay");

create table Ubicaciones(
	id integer primary key auto_increment,
	localidad varchar(15),
    pais varchar(15),
    unique (localidad, pais),
    foreign key (pais) references Paises(nombre)
);

insert into Ubicaciones(localidad, pais) values ("Montevideo","Uruguay");
insert into Ubicaciones(localidad, pais) values ("Canelones","Uruguay");

create table Medios(
	id integer primary key auto_increment,
    sistema varchar(10)
);

insert into Medios(id,sistema) values 
("http://147.135.11.82:9206/;",0),
("http://173.249.7.231:8076/stream",1),
("http://radios-mp3-uy.cdn.nedmedia.io/sarandi.mp3",2);

create table Contenido(
	id integer primary key auto_increment
);

create table Radios(
	id integer primary key auto_increment,
	nombre varchar(20) not null,
    descripcion varchar(100),
    frecuencia double,
    identificador varchar(7),
    medio integer,
    banda varchar(2),
    localidad integer,
    imagen varchar(400),
    foreign key (localidad) references Ubicaciones(id),
    foreign key (medio) references Medios(id)
);

insert into Radios(nombre,descripcion,frecuencia,identificador,medio,banda,localidad) values 
("Rural","",610,"CX4",1,"AM",1),
("CLÁSICA","",650,"CX6",1,"AM",1),
("SARANDI","",690,"CX8",1,"AM",1),
("CONTINENTE","",730,"CX10",1,"AM",1),
("ORIENTAL","",770,"CX12",1,"AM",1),
("EL ESPECTADOR","",810,"CX14",1,"AM",1),
("CARVE","",850,"CX16",1,"AM",1),
("SPORT 890","",890,"CX18",1,"AM",1),
("MONTECARLO","",910,"CX20",1,"AM",1),
("UNIVERSAL","",970,"CX22",1,"AM",1),
("RADIO 1010 AM","",1010,"CX24",1,"AM",1),
("RADIO URUGUAY","",1050,"CX26",1,"AM",1),
("IMPARCIAL","",1090,"CX28",1,"AM",1),
("NACIONAL","",1130,"CX30",1,"AM",1),
("RADIOMUNDO","",1170,"CX32",1,"AM",1),
("CENTENARIO","",1250,"CX36",1,"AM",1),
("EMISORA DEL SUR","",1290,"CX38",1,"AM",1),
("FENIX","",1330,"CX40",1,"AM",1),
("C. DE MDEO.","",1370,"CX42",1,"AM",1),
("AM LIBRE","",1410,"CX44",1,"AM",1),
("AMERICA","",1450,"CX46",1,"AM",1),
("CRISTAL","",1470,"CX48",1,"AM",1),
("CLARIN","",580,"CX58",1,"AM",1);

create table Programas(
	id integer primary key auto_increment,
    nombre varchar(20) not null,
    descripcion varchar(100),
    imagen varchar(400),
    radio integer not null,
    visitas integer,
    foreign key (radio) references Radios(id)
);

create table Listas(
	id integer primary key auto_increment,
    nombre varchar(20) not null,
    nick varchar(10) not null,
    descripcion varchar(100),
    UNIQUE KEY (nombre, nick)
);

create table ProgramasFavoritos(
	nick varchar(10),
    programa integer,
    lista integer,
    UNIQUE KEY (lista, programa),
    foreign key (lista) references Listas(id),
    foreign key (nick) references Usuarios(nick),
    foreign key (programa) references Radios(id)
);

create table RadiosFavoritas(
	nick varchar(10),
    radio integer,
    lista integer,
    UNIQUE KEY (lista, radio),
    foreign key (lista) references Listas(id),
    foreign key (nick) references Usuarios(nick),
    foreign key (radio) references Radios(id)
);

select * from Radios;
