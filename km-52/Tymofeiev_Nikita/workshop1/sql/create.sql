/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     15.12.2018 11:40:46                          */
/*==============================================================*/


alter table "groups_have_subjects"
   drop constraint FK_GROUPS_H_GROUPS_HA_SUBJECT;

alter table "groups_have_subjects"
   drop constraint FK_GROUPS_H_GROUPS_HA_STUDENT_;

alter table "labs"
   drop constraint FK_LABS_SUBJ_HAS__SUBJECT;

alter table "result"
   drop constraint FK_RESULT_LAB_HAS_R_LABS;

alter table "result"
   drop constraint FK_RESULT_STUDENT_H_STUDENT;

alter table "student"
   drop constraint FK_STUDENT_BE_STUDEN_USERS;

alter table "student"
   drop constraint FK_STUDENT_STUDENT_H_STUDENT_;

alter table "teacher"
   drop constraint FK_TEACHER_BE_TEACHE_USERS;

alter table "teachers_and_subj"
   drop constraint FK_TEACHERS_SUBJECTS__SUBJECT;

alter table "teachers_and_subj"
   drop constraint FK_TEACHERS_TEACHERS__TEACHER;

drop index "groups_have_subjects_FK";

drop index "groups_have_subjects2_FK";

drop table "groups_have_subjects" cascade constraints;

drop index "subj_has_labs_FK";

drop table "labs" cascade constraints;

drop index "lab_has_results_FK";

drop index "student_has_results_FK";

drop table "result" cascade constraints;

drop index "student_have_group_FK";

drop index "be_student_FK";

drop table "student" cascade constraints;

drop table "student_groups" cascade constraints;

drop table "subject" cascade constraints;

drop table "teacher" cascade constraints;

drop index "subjects_have_start_date_FK";

drop index "teachers_have_start_date_FK";

drop table "teachers_and_subj" cascade constraints;

drop table "users" cascade constraints;

/*==============================================================*/
/* Table: "groups_have_subjects"                                */
/*==============================================================*/
create table "groups_have_subjects" 
(
   "subj_code"          INTEGER              not null,
   "group_id"           VARCHAR2(6)          not null
);

/*==============================================================*/
/* Index: "groups_have_subjects2_FK"                            */
/*==============================================================*/
create index "groups_have_subjects2_FK" on "groups_have_subjects" (
   "group_id" ASC
);

/*==============================================================*/
/* Index: "groups_have_subjects_FK"                             */
/*==============================================================*/
create index "groups_have_subjects_FK" on "groups_have_subjects" (
   "subj_code" ASC
);

/*==============================================================*/
/* Table: "labs"                                                */
/*==============================================================*/
create table "labs" 
(
   "lab_id"             INTEGER              not null,
   "subj_code"          INTEGER              not null,
   "lab_name"           CLOB                 not null,
   constraint PK_LABS primary key ("lab_id")
);

/*==============================================================*/
/* Index: "subj_has_labs_FK"                                    */
/*==============================================================*/
create index "subj_has_labs_FK" on "labs" (
   "subj_code" ASC
);

/*==============================================================*/
/* Table: "result"                                              */
/*==============================================================*/
create table "result" 
(
   "st_code"            VARCHAR2(11),
   "lab_id"             INTEGER,
   "mark"               INTEGER,
   "comment"            CLOB,
   "date_of_result"     DATE
);

/*==============================================================*/
/* Index: "student_has_results_FK"                              */
/*==============================================================*/
create index "student_has_results_FK" on "result" (
   "st_code" ASC
);

/*==============================================================*/
/* Index: "lab_has_results_FK"                                  */
/*==============================================================*/
create index "lab_has_results_FK" on "result" (
   "lab_id" ASC
);

/*==============================================================*/
/* Table: "student"                                             */
/*==============================================================*/
create table "student" 
(
   "group_id"           VARCHAR2(6)          not null,
   "user_id_code"       INTEGER              not null,
   "st_code"            VARCHAR2(11)         not null,
   constraint PK_STUDENT primary key ("st_code")
);

/*==============================================================*/
/* Index: "be_student_FK"                                       */
/*==============================================================*/
create index "be_student_FK" on "student" (
   "user_id_code" ASC
);

/*==============================================================*/
/* Index: "student_have_group_FK"                               */
/*==============================================================*/
create index "student_have_group_FK" on "student" (
   "group_id" ASC
);

/*==============================================================*/
/* Table: "student_groups"                                      */
/*==============================================================*/
create table "student_groups" 
(
   "group_id"           VARCHAR2(6)          not null,
   constraint PK_STUDENT_GROUPS primary key ("group_id")
);

/*==============================================================*/
/* Table: "subject"                                             */
/*==============================================================*/
create table "subject" 
(
   "subj_code"          INTEGER              not null,
   "subj_name"          CLOB                 not null,
   constraint PK_SUBJECT primary key ("subj_code")
);

/*==============================================================*/
/* Table: "teacher"                                             */
/*==============================================================*/
create table "teacher" 
(
   "user_id_code"       INTEGER              not null,
   "science_degree"     CLOB                 not null,
   constraint PK_TEACHER primary key ("user_id_code")
);

/*==============================================================*/
/* Table: "teachers_and_subj"                                   */
/*==============================================================*/
create table "teachers_and_subj" 
(
   "subj_code"          INTEGER              not null,
   "user_id_code"       INTEGER              not null,
   "date_begin"         DATE,
   "date_end"           DATE
);

/*==============================================================*/
/* Index: "teachers_have_start_date_FK"                         */
/*==============================================================*/
create index "teachers_have_start_date_FK" on "teachers_and_subj" (
   "user_id_code" ASC
);

/*==============================================================*/
/* Index: "subjects_have_start_date_FK"                         */
/*==============================================================*/
create index "subjects_have_start_date_FK" on "teachers_and_subj" (
   "subj_code" ASC
);

/*==============================================================*/
/* Table: "users"                                               */
/*==============================================================*/
create table "users" 
(
   "user_name"          CLOB                 not null,
   "user_surname"       CLOB                 not null,
   "user_second_name"   CLOB                 not null,
   "user_email"         VARCHAR2(20)         not null,
   "user_password"      VARCHAR2(20)         not null,
   "user_id_code"       INTEGER              not null,
   constraint PK_USERS primary key ("user_id_code")
);

alter table "groups_have_subjects"
   add constraint FK_GROUPS_H_GROUPS_HA_SUBJECT foreign key ("subj_code")
      references "subject" ("subj_code");

alter table "groups_have_subjects"
   add constraint FK_GROUPS_H_GROUPS_HA_STUDENT_ foreign key ("group_id")
      references "student_groups" ("group_id");

alter table "labs"
   add constraint FK_LABS_SUBJ_HAS__SUBJECT foreign key ("subj_code")
      references "subject" ("subj_code");

alter table "result"
   add constraint FK_RESULT_LAB_HAS_R_LABS foreign key ("lab_id")
      references "labs" ("lab_id");

alter table "result"
   add constraint FK_RESULT_STUDENT_H_STUDENT foreign key ("st_code")
      references "student" ("st_code");

alter table "student"
   add constraint FK_STUDENT_BE_STUDEN_USERS foreign key ("user_id_code")
      references "users" ("user_id_code");

alter table "student"
   add constraint FK_STUDENT_STUDENT_H_STUDENT_ foreign key ("group_id")
      references "student_groups" ("group_id");

alter table "teacher"
   add constraint FK_TEACHER_BE_TEACHE_USERS foreign key ("user_id_code")
      references "users" ("user_id_code");

alter table "teachers_and_subj"
   add constraint FK_TEACHERS_SUBJECTS__SUBJECT foreign key ("subj_code")
      references "subject" ("subj_code");

alter table "teachers_and_subj"
   add constraint FK_TEACHERS_TEACHERS__TEACHER foreign key ("user_id_code")
      references "teacher" ("user_id_code");

