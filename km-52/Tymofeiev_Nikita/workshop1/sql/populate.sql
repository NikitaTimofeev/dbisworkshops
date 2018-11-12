



insert into user_ (user_name,user_surname,user_second_name,user_email,user_password,user_id_code) VALUES ('Nikita','Tymofeiev','Dymytrievich','hik951@gmail.com',1111,5113174919);



insert into user_ (user_name,user_surname,user_second_name,user_email,user_password,user_id_code) VALUES ('Vlad','Neshta','Olegovich','ruslan@gmail.com',2222,7777774919);



insert into user_ (user_name,user_surname,user_second_name,user_email,user_password,user_id_code) VALUES ('Chel','Chelovechek','Chelovechnyi','4elovek@gmail.com',1111,6663174666);



insert into student_group (group_id) VALUES ('KM-51');

insert into student_group (group_id) VALUES ('KM-52');

insert into student_group (group_id) VALUES ('KV-81');






insert into student (group_id,user_id_code,st_code) VALUES ('KM-51',7777774919, 10742563 );

insert into student (group_id,user_id_code,st_code) VALUES ('KM-52',5113174919, 10742244 );

insert into teacher (science_degree, user_id_code) VALUES ('Professor',6663174666);

insert into subject (subj_code, user_id_code,subj_name) VALUES (666,6663174666, 'Mathematical Analyze');

insert into subject (subj_code, user_id_code,subj_name) VALUES (777,6663174666, 'Fizkultura');

insert into groups_have_subjects (subj_code, group_id) VALUES (777,'KM-51');

insert into groups_have_subjects (subj_code, group_id) VALUES (666,'KM-52');

insert into lab (lab_id,subj_code,lab_name) VALUES (6661,666,'Fibonachi');

insert into lab (lab_id,subj_code,lab_name) VALUES (6662,666,'Bernuli');


insert into lab (lab_id,subj_code,lab_name) VALUES (7771,777,'Otzhimanie');


insert into result_ (mark,comment_,lab_id,st_code,user_id_code,group_id) VALUES (10,'O4en` xorosho otzhimaeshsya',7771,10742563,7777774919,'KM-51');


insert into result_ (mark,comment_,lab_id,st_code,user_id_code,group_id) VALUES (100,'O4en` xorosho',6661,10742244,5113174919,'KM-52');
