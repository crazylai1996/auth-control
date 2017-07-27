/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017-07-27 ÐÇÆÚËÄ 11:59:34                      */
/*==============================================================*/


drop table if exists auth_permission;

drop table if exists auth_role;

drop table if exists auth_role_permission;

drop table if exists auth_user;

drop table if exists auth_user_role;

/*==============================================================*/
/* Table: auth_permission                                       */
/*==============================================================*/
create table auth_permission
(
   bPermissionId        bigint not null auto_increment,
   vPermissionDesc      varchar(30),
   vUrl                 varchar(30),
   tIsNavi              tinyint default 0,
   vPermissionCode      varchar(30),
   primary key (bPermissionId)
)
auto_increment = 1;

/*==============================================================*/
/* Table: auth_role                                             */
/*==============================================================*/
create table auth_role
(
   bRoleId              bigint not null auto_increment,
   vRoleName            varchar(15),
   vRoleDesc            varchar(30),
   vRoleCode            varchar(15),
   primary key (bRoleId)
)
auto_increment = 1;

/*==============================================================*/
/* Table: auth_role_permission                                  */
/*==============================================================*/
create table auth_role_permission
(
   id                   bigint not null auto_increment,
   bRoleId              bigint,
   bPermissionId        bigint,
   primary key (id)
)
auto_increment = 1;

/*==============================================================*/
/* Table: auth_user                                             */
/*==============================================================*/
create table auth_user
(
   bUserId              bigint not null auto_increment,
   vUserName            varchar(15),
   cPassword            char(32),
   cPasswordSalt        char(32),
   primary key (bUserId)
)
auto_increment = 1;

/*==============================================================*/
/* Table: auth_user_role                                        */
/*==============================================================*/
create table auth_user_role
(
   id                   bigint not null auto_increment,
   bUserId              bigint,
   bRoleId              bigint,
   primary key (id)
)
auto_increment = 1;

alter table auth_role_permission add constraint FK_Reference_3 foreign key (bRoleId)
      references auth_role (bRoleId) on delete restrict on update restrict;

alter table auth_role_permission add constraint FK_Reference_4 foreign key (bPermissionId)
      references auth_permission (bPermissionId) on delete restrict on update restrict;

alter table auth_user_role add constraint FK_Reference_1 foreign key (bUserId)
      references auth_user (bUserId) on delete restrict on update restrict;

alter table auth_user_role add constraint FK_Reference_2 foreign key (bRoleId)
      references auth_role (bRoleId) on delete restrict on update restrict;

