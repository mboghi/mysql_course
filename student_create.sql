create table dev.student(
	Id int auto_increment primary key,
	Cnp varchar(15) unique not null,
	Prenume varchar(255) not null,
	Nume varchar(255) not null,
	Varsta int unsigned not null,
	DataNastere date not null,
	DataInscriere datetime not null default NOW(),
	Facultate varchar(255)
);

create table dev.Adresa(
	Id int auto_increment primary key,
	Judet varchar(255) not null,
	Oras varchar(255) not null,
	Strada varchar(255) not null,
	Numar smallint unsigned not null,
	Bloc varchar(50),
	Scara varchar(50),
	NumarAp varchar(50)
);

create table dev.Profesor(
	Id int auto_increment primary key,
	Prenume varchar(255) not null,
	Nume varchar(255) not null,
   	NumeIntreg varchar(510) generated always as (CONCAT(Prenume,Nume)),
	IdAdresa int,
	foreign key fk_profesor_adresa (IdAdresa) references dev.Adresa(Id)
);

create table dev.Curs(
	Id int auto_increment primary key,
	Nume varchar(255) not null,
    DataInceput date not null,
    DataSfarsit date,
	IdProfesor int,
	foreign key fk_curs_profesor (IdProfesor) references dev.Profesor(Id) on delete set null
);

create table dev.Sesiune(
	Id int auto_increment primary key,
    DataInceput date not null,
    DataSfarsit date not null
);

create table dev.StudentCurs(
	IdStudent int not null,
    IdCurs int not null,
    IdSesiune int not null,
    primary key pk_studentcurs (IdStudent,IdCurs,IdSesiune),
    constraint fk_studentcurs_student foreign key (IdStudent) references dev.Student(Id),
    constraint fk_studentcurs_curs foreign key (IdCurs) references dev.Curs(Id),
    constraint fk_studentcurs_sesiune foreign key (IdSesiune) references dev.Sesiune(Id)
);

create table dev.Examen(
	Id int auto_increment primary key,
    DataOra datetime not null,
    IdCurs int not null,
    constraint fk_examen_curs foreign key (IdCurs) references dev.Curs(Id)
);

create table dev.StudentExamen(
	IdStudent int not null,
    IdExamen int not null,
    IdSesiune int not null,
    Nota decimal not null,
    primary key pk_studentexament (IdStudent, IdExamen, IdSesiune),
    constraint fk_StudentExamen_student foreign key (IdStudent) references dev.Student(Id),
    constraint fk_StudentExamen_examen foreign key (IdExamen) references dev.Examen(Id),
    constraint fk_StudentExamen_sesiune foreign key (IdSesiune) references dev.Sesiune(Id)
);