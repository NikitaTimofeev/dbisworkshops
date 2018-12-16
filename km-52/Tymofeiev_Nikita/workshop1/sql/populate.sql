
insert into users_ (user_name,user_surname,user_second_name,user_email,user_password,user_id_code) VALUES ('Nikita','Tymofeiev','Dymytrievich','hik951@gmail.com',1111,5113174919);

insert into users_ (user_name,user_surname,user_second_name,user_email,user_password,user_id_code) VALUES ('Ruslan','Neshta','Olegovich','ruslan@gmail.com',1111,7777774919);

insert into users_ (user_name,user_surname,user_second_name,user_email,user_password,user_id_code) VALUES ('Vlad','Beshta','Olegovich','vlad@gmail.com',1111,6663174666);




insert into users_ (user_name,user_surname,user_second_name,user_email,user_password,user_id_code) VALUES ('Prepod1','Familiya1','Otchestvo1','prepod1@gmail.com',1111,6663174661);

insert into users_ (user_name,user_surname,user_second_name,user_email,user_password,user_id_code) VALUES ('Prepod2','Familiya2','Otchestvo2','prepod2@gmail.com',1111,6663174662);

insert into users_ (user_name,user_surname,user_second_name,user_email,user_password,user_id_code) VALUES ('Prepod3','Familiya3','Otchestvo3','prepod3@gmail.com',1111,6663174663);




insert into student_groups (group_id) VALUES ('KM-51');


insert into student_groups (group_id) VALUES ('KM-52');


insert into student_groups (group_id) VALUES ('KV-81');






insert into student (group_id,user_id_code,st_code) VALUES ('KM-51',7777774919, 10742563 );


insert into student (group_id,user_id_code,st_code) VALUES ('KM-52',5113174919, 10742244 );


insert into student (group_id,user_id_code,st_code) VALUES ('KV-81',6663174666, 10742246 );

insert into teacher (science_degree, user_id_code) VALUES ('Professor',6663174661);

insert into teacher (science_degree, user_id_code) VALUES ('Docent',6663174662);

insert into teacher (science_degree, user_id_code) VALUES ('Laborant',6663174663);

insert into subject (subj_code, subj_name) VALUES (111, 'Mathematical Analyze');
insert into subject (subj_code, subj_name) VALUES (222, 'Lineage algebra');
insert into subject (subj_code, subj_name) VALUES (333, 'Python');

insert into teachers_and_subj (subj_code,user_id_code, date_begin, date_end) VALUES (111,6663174661, DATE '2010-12-17', DATE '2021-12-17');
insert into teachers_and_subj (subj_code,user_id_code, date_begin,date_end) VALUES (222,6663174662,DATE '2017-12-17',null );
insert into teachers_and_subj (subj_code,user_id_code, date_begin,date_end) VALUES (333,6663174663,DATE '2014-12-17',null);

insert into groups_have_subjects (subj_code, group_id) VALUES (111,'KM-51');
insert into groups_have_subjects (subj_code, group_id) VALUES (222,'KM-52');
insert into groups_have_subjects (subj_code, group_id) VALUES (333,'KV-81');

insert into labs (lab_id,subj_code,lab_name) VALUES (1111,111,'Fibonachi');
insert into labs (lab_id,subj_code,lab_name) VALUES (2221,222,'Bernuli');
insert into labs (lab_id,subj_code,lab_name) VALUES (3331,333,'functions');

insert into result_ (mark,comment_,lab_id, st_code, date_of_result) VALUES (10,' xorosho ',1111,10742563,DATE '2018-12-15');
insert into result_ (mark,comment_,lab_id, st_code, date_of_result) VALUES (8,'prekrasno',2221,10742244,DATE '2018-12-15');
insert into result_ (mark,comment_,lab_id, st_code, date_of_result) VALUES (3,'vosxititelno',3331,10742246,DATE '2018-12-15');
