/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     12.11.2018 13:13:05                          */
/*==============================================================*/


alter table groups_have_subjects
   drop constraint FK_GROUPS_H_GROUPS_HA_SUBJECT;

alter table groups_have_subjects
   drop constraint FK_GROUPS_H_GROUPS_HA_STUDENT_;

alter table lab
   drop constraint FK_LAB_SUBJ_HAS__SUBJECT;

alter table result
   drop constraint FK_RESULT_LAB_HAS_R_LAB;

alter table result
   drop constraint FK_RESULT_STUDENT_H_STUDENT;

alter table student
   drop constraint FK_STUDENT_BE_STUDEN_USERS;

alter table student
   drop constraint FK_STUDENT_STUDENT_H_STUDENT_;

alter table subject
   drop constraint FK_SUBJECT_TEACHER_H_TEACHER;

alter table teacher
   drop constraint FK_TEACHER_BE_TEACHE_USERS;

drop table groups_have_subjects cascade constraints;

drop table lab cascade constraints;

drop table result cascade constraints;

drop table student cascade constraints;

drop table student_group cascade constraints;

drop index teacher_has_subj_FK;

drop table subject cascade constraints;

drop table teacher cascade constraints;

drop table users cascade constraints;

/*==============================================================*/
/* Table: groups_have_subjects                                  */
/*==============================================================*/
create table groups_have_subjects 
(
   subj_code            INTEGER              not null,
   group_id             VARCHAR2(6)          not null,
   constraint PK_GROUPS_HAVE_SUBJECTS primary key (subj_code, group_id)
);

/*==============================================================*/
/* Table: lab                                                   */
/*==============================================================*/
create table lab 
(
   lab_id               INTEGER              not null,
   subj_code            INTEGER              not null,
   lab_name             CLOB                 not null,
   constraint PK_LAB primary key (lab_id)
);

/*==============================================================*/
/* Table: result                                                */
/*==============================================================*/
create table result 
(
   group_id             VARCHAR2(6),
   user_id_code         INTEGER,
   st_code              VARCHAR2(11),
   lab_id               INTEGER              not null,
   mark                 INTEGER,
   "comment"            CLOB,
   constraint PK_RESULT primary key (lab_id)
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student 
(
   group_id             VARCHAR2(6)          not null,
   user_id_code         INTEGER              not null,
   st_code              VARCHAR2(11)         not null,
   constraint PK_STUDENT primary key (st_code)
);

/*==============================================================*/
/* Table: student_group                                         */
/*==============================================================*/
create table student_group 
(
   group_id             VARCHAR2(6)          not null,
   constraint PK_STUDENT_GROUP primary key (group_id)
);

/*==============================================================*/
/* Table: subject                                               */
/*==============================================================*/
create table subject 
(
   subj_code            INTEGER              not null,
   user_id_code         INTEGER,
   subj_name            CLOB                 not null,
   constraint PK_SUBJECT primary key (subj_code)
);

/*==============================================================*/
/* Index: teacher_has_subj_FK                                   */
/*==============================================================*/
create index teacher_has_subj_FK on subject (
   user_id_code ASC
);

/*==============================================================*/
/* Table: teacher                                               */
/*==============================================================*/
create table teacher 
(
   user_id_code         INTEGER              not null,
   science_degree       CLOB                 not null,
   constraint PK_TEACHER primary key (user_id_code)
);

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users 
(
   user_name            CLOB                 not null,
   user_surname         CLOB                 not null,
   user_second_name     CLOB                 not null,
   user_email           VARCHAR2(20)         not null,
   user_password        VARCHAR2(20)         not null,
   user_id_code         INTEGER              not null,
   constraint PK_USERS primary key (user_id_code)
);

alter table groups_have_subjects
   add constraint FK_GROUPS_H_GROUPS_HA_SUBJECT foreign key (subj_code)
      references subject (subj_code);

alter table groups_have_subjects
   add constraint FK_GROUPS_H_GROUPS_HA_STUDENT_ foreign key (group_id)
      references student_group (group_id);

alter table lab
   add constraint FK_LAB_SUBJ_HAS__SUBJECT foreign key (subj_code)
      references subject (subj_code);

alter table result
   add constraint FK_RESULT_LAB_HAS_R_LAB foreign key (lab_id)
      references lab (lab_id);

alter table result
   add constraint FK_RESULT_STUDENT_H_STUDENT foreign key (st_code)
      references student (st_code);

alter table student
   add constraint FK_STUDENT_BE_STUDEN_USERS foreign key (user_id_code)
      references users (user_id_code);

alter table student
   add constraint FK_STUDENT_STUDENT_H_STUDENT_ foreign key (group_id)
      references student_group (group_id);

alter table subject
   add constraint FK_SUBJECT_TEACHER_H_TEACHER foreign key (user_id_code)
      references teacher (user_id_code);

alter table teacher
   add constraint FK_TEACHER_BE_TEACHE_USERS foreign key (user_id_code)
      references users (user_id_code);

