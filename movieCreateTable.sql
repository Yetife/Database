Create table Actor(
act_id integer Not null,
act_fname char(20) Not null,
act_lname char(20) Not null,
act_gender char(1) Not null,
constraint Actor_PK primary key(act_id)
);

Create table Director(
dir_id integer Not null,
dir_fname char(20) Not null,
dir_lname char(20) Not null,
constraint Director_PK primary key(dir_id)
);

Create table Movie(
mov_id integer Not null,
mov_title char(50) Not null,
mov_year integer Not null,
mov_time integer Not null,
mov_lang char(50) Not null,
mov_dt_rel date Not null,
mov_rel_country char(5) Not null,
constraint Movie_PK primary key(mov_id)
);


Create table Movie_direction(
dir_id integer Not null,
mov_id integer Not null,
constraint Movie_dirction_PK primary key(mov_id, dir_id),
constraint Movi_FK foreign key(mov_id)
					references Movie(mov_id),
constraint Director_FK foreign key(dir_id)
					references Director(dir_id)
);

Create table Movie_cast(
act_id integer Not null,
mov_id  integer Not null,
`role` char(30) Not null,
constraint Movie_cast_PK primary key(mov_id, act_id),
constraint Mov_FK foreign key(mov_id)
					references Movie(mov_id),
constraint Actor_FK foreign key(act_id)
					references Actor(act_id)
);

Create table Reviewer(
rev_id integer Not null,
rev_name char(30) Not null,
constraint Reviewer_PK primary key(rev_id)
);


Create table Rating(
mov_id integer Not null,
rev_id integer Not null,
rev_stars integer Not null,
num_o_ratings integer Not null,
constraint Rating_PK primary key(mov_id, rev_id),
constraint Movie_FK foreign key(mov_id)
					references Movie(mov_id),
constraint Reviewer_FK foreign key(rev_id)
					references Reviewer(rev_id)
);

Create table Genres(
gen_id integer Not null,
gen_title char(20) Not null,
constraint Genres_PK primary key(gen_id)
);

Create table Movie_genres(
mov_id integer Not null,
gen_id integer Not null,
constraint Movie_genres_PK primary key(mov_id, gen_id),
constraint Move_FK foreign key(mov_id)
					references Movie(mov_id),
constraint Genres_FK foreign key(gen_id)
					references Genres(gen_id)
);