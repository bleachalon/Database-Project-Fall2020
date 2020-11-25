create table if not EXISTS TitleType (
	tType varchar(360) primary key
);

CREATE TABLE if not EXISTS Title (
	tconst varchar(360) primary key,
    titleType varchar(360),
    primaryTitle varchar(360),
    originalTitle varchar(360),
    isAdult boolean,
    startYear int(4),
    endYear int(4),
    runtimeMinutes int,
    foreign key (titleType) references TitleType(tType) 
);

create table if not EXISTS Genre (
	genre varchar(360) primary key
);

create table if not EXISTS Title_Genre (
	tgId int primary key auto_increment,
    tconst varchar(360),
    genre varchar(360),
    foreign key (tconst) references Title(tconst) on delete cascade on update cascade,
	foreign key (genre) references Genre(genre) on delete cascade on update cascade
);

create table if not EXISTS Episode (
	tconst varchar(360) primary key,
    parentTconst varchar(360),
    seasonNumber int,
    episodeNumber int,
    foreign key (parentTconst) references Title(tconst) on delete cascade on update cascade
);

create table if not EXISTS Rating (
	tconst varchar(360) primary key,
    averageRating float(2),
    numVotes bigint,
    foreign key (tconst) references Title(tconst) on delete cascade on update cascade
);

create table if not EXISTS NameBasic (
	nconst varchar(360) primary key,
    primaryName varchar(360) not null,
    birthYear int default 0,
    deathYear int default 0,
    age int,
    numberOfMovie int
);

create table if not EXISTS Name_Title (
	ntId int primary key auto_increment,
    nconst varchar(360),
    tconst varchar(360),
    foreign key (tconst) references Title(tconst),
    foreign key (nconst) references NameBasic(nconst)
);

create table if not EXISTS Profession (
	profession varchar(360) primary key
);

create table if not EXISTS Name_Profession (
	npid int primary key auto_increment,
    nconst varchar(360),
    profession varchar(360),
    foreign key (profession) references Profession(profession) on delete cascade on update cascade,
    foreign key (nconst) references NameBasic(nconst) on delete restrict on update cascade
);