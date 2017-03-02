/*==============================================================*/
/* DBMS name:      PostgreSQL 7.3                               */
/* Created on:     01/03/2017 21:58:56                          */
/*==============================================================*/


drop index ALIMENT_PK;

drop table ALIMENT;

drop index UTILISATEUR_RECHERCHE_FK;

drop index TYPE_RECHERCHE_FK;

drop index RECHERCHE_PK;

drop table RECHERCHE;

drop index TYPE_PK;

drop table TYPE;

drop index UTILISATEUR_PK;

drop table UTILISATEUR;

/*==============================================================*/
/* Table: ALIMENT                                               */
/*==============================================================*/
create table ALIMENT (
ALIMENT_ID           SERIAL               not null,
DESIGNATION          VARCHAR(50)          null,
KCAL                 INT2                 null,
GLUCIDE              INT2                 null,
PROTIDE              INT2                 null,
LIPIDE               INT2                 null,
BIO                  BOOL                 null,
CHOLESTEROL          BOOL                 null,
constraint PK_ALIMENT primary key (ALIMENT_ID)
);

/*==============================================================*/
/* Index: ALIMENT_PK                                            */
/*==============================================================*/
create unique index ALIMENT_PK on ALIMENT (
ALIMENT_ID
);

/*==============================================================*/
/* Table: RECHERCHE                                             */
/*==============================================================*/
create table RECHERCHE (
RECHERCHE_ID         SERIAL               not null,
USER_ID              INT4                 null,
TYPE_ID              INT4                 null,
DATE_RECHERCHE       DATE                 null,
KCAL                 INT2                 null,
GLUCIDE              INT2                 null,
PROTIDE              INT2                 null,
LIPIDE               INT2                 null,
constraint PK_RECHERCHE primary key (RECHERCHE_ID)
);

/*==============================================================*/
/* Index: RECHERCHE_PK                                          */
/*==============================================================*/
create unique index RECHERCHE_PK on RECHERCHE (
RECHERCHE_ID
);

/*==============================================================*/
/* Index: TYPE_RECHERCHE_FK                                     */
/*==============================================================*/
create  index TYPE_RECHERCHE_FK on RECHERCHE (
TYPE_ID
);

/*==============================================================*/
/* Index: UTILISATEUR_RECHERCHE_FK                              */
/*==============================================================*/
create  index UTILISATEUR_RECHERCHE_FK on RECHERCHE (
USER_ID
);

/*==============================================================*/
/* Table: TYPE                                                  */
/*==============================================================*/
create table TYPE (
TYPE_ID              SERIAL               not null,
KCAL                 INT2                 null,
GLUCIDE              INT2                 null,
PROTIDE              INT2                 null,
LIPIDE               INT2                 null,
constraint PK_TYPE primary key (TYPE_ID)
);

/*==============================================================*/
/* Index: TYPE_PK                                               */
/*==============================================================*/
create unique index TYPE_PK on TYPE (
TYPE_ID
);

/*==============================================================*/
/* Table: UTILISATEUR                                           */
/*==============================================================*/
create table UTILISATEUR (
USER_ID              SERIAL               not null,
NOM                  VARCHAR(50)          null,
PRENOM               VARCHAR(50)          null,
MAIL                 VARCHAR(100)         null,
PASSWORD             VARCHAR(50)          null,
STATUT               INT2                 null,
constraint PK_UTILISATEUR primary key (USER_ID)
);

/*==============================================================*/
/* Index: UTILISATEUR_PK                                        */
/*==============================================================*/
create unique index UTILISATEUR_PK on UTILISATEUR (
USER_ID
);

alter table RECHERCHE
   add constraint FK_RECHERCH_TYPE_RECH_TYPE foreign key (TYPE_ID)
      references TYPE (TYPE_ID)
      on delete restrict on update restrict;

alter table RECHERCHE
   add constraint FK_RECHERCH_UTILISATE_UTILISAT foreign key (USER_ID)
      references UTILISATEUR (USER_ID)
      on delete restrict on update restrict;

