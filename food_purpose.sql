/*==============================================================*/
/* DBMS name:      PostgreSQL 7.3                               */
/* Created on:     02/03/2017 10:39:28                          */
/*==============================================================*/


drop index CATEGORIE_ALIMENT_FK;

drop index ALIMENT_PK;

drop table ALIMENT;

drop index ALIMENT_COMPOSANT2_FK;

drop index ALIMENT_COMPOSANT_FK;

drop index ALIMENT_COMPOSANT_PK;

drop table ALIMENT_COMPOSANT;

drop index TYPE_PK;

drop table CATEGORIE;

drop index COMPOSANT_PK;

drop table COMPOSANT;

drop index UTILISATEUR_RECHERCHE_FK;

drop index TYPE_RECHERCHE_FK;

drop index RECHERCHE_PK;

drop table RECHERCHE;

drop index SPECIAL_PK;

drop table SPECIAL;

drop index SPECIAL_ALIMENT2_FK;

drop index SPECIAL_ALIMENT_FK;

drop index SPECIAL_ALIMENT_PK;

drop table SPECIAL_ALIMENT;

drop index UTILISATEUR_PK;

drop table UTILISATEUR;

/*==============================================================*/
/* Table: ALIMENT                                               */
/*==============================================================*/
create table ALIMENT (
ALIMENT_ID           SERIAL               not null,
CATEGORIE_ID         INT4                 not null,
DESIGNATION          VARCHAR(50)          null,
DETAILS              VARCHAR(100)         null,
constraint PK_ALIMENT primary key (ALIMENT_ID)
);

/*==============================================================*/
/* Index: ALIMENT_PK                                            */
/*==============================================================*/
create unique index ALIMENT_PK on ALIMENT (
ALIMENT_ID
);

/*==============================================================*/
/* Index: CATEGORIE_ALIMENT_FK                                  */
/*==============================================================*/
create  index CATEGORIE_ALIMENT_FK on ALIMENT (
CATEGORIE_ID
);

/*==============================================================*/
/* Table: ALIMENT_COMPOSANT                                     */
/*==============================================================*/
create table ALIMENT_COMPOSANT (
ALIMENT_ID           INT4                 not null,
COMPOSANT_ID         INT4                 not null,
constraint PK_ALIMENT_COMPOSANT primary key (ALIMENT_ID, COMPOSANT_ID)
);

/*==============================================================*/
/* Index: ALIMENT_COMPOSANT_PK                                  */
/*==============================================================*/
create unique index ALIMENT_COMPOSANT_PK on ALIMENT_COMPOSANT (
ALIMENT_ID,
COMPOSANT_ID
);

/*==============================================================*/
/* Index: ALIMENT_COMPOSANT_FK                                  */
/*==============================================================*/
create  index ALIMENT_COMPOSANT_FK on ALIMENT_COMPOSANT (
ALIMENT_ID
);

/*==============================================================*/
/* Index: ALIMENT_COMPOSANT2_FK                                 */
/*==============================================================*/
create  index ALIMENT_COMPOSANT2_FK on ALIMENT_COMPOSANT (
COMPOSANT_ID
);

/*==============================================================*/
/* Table: CATEGORIE                                             */
/*==============================================================*/
create table CATEGORIE (
CATEGORIE_ID         SERIAL               not null,
DESIGNATION          VARCHAR(50)          null,
DETAILS              VARCHAR(100)         null,
constraint PK_CATEGORIE primary key (CATEGORIE_ID)
);

/*==============================================================*/
/* Index: TYPE_PK                                               */
/*==============================================================*/
create unique index TYPE_PK on CATEGORIE (
CATEGORIE_ID
);

/*==============================================================*/
/* Table: COMPOSANT                                             */
/*==============================================================*/
create table COMPOSANT (
COMPOSANT_ID         SERIAL               not null,
KCAL                 INT2                 null,
GLUCIDE              INT2                 null,
PROTIDE              INT2                 null,
LIPIDE               INT2                 null,
constraint PK_COMPOSANT primary key (COMPOSANT_ID)
);

/*==============================================================*/
/* Index: COMPOSANT_PK                                          */
/*==============================================================*/
create unique index COMPOSANT_PK on COMPOSANT (
COMPOSANT_ID
);

/*==============================================================*/
/* Table: RECHERCHE                                             */
/*==============================================================*/
create table RECHERCHE (
RECHERCHE_ID         SERIAL               not null,
USER_ID              INT4                 null,
CATEGORIE_ID         INT4                 null,
DATE_RECHERCHE       DATE                 null,
DETAILS              VARCHAR(100)         null,
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
CATEGORIE_ID
);

/*==============================================================*/
/* Index: UTILISATEUR_RECHERCHE_FK                              */
/*==============================================================*/
create  index UTILISATEUR_RECHERCHE_FK on RECHERCHE (
USER_ID
);

/*==============================================================*/
/* Table: SPECIAL                                               */
/*==============================================================*/
create table SPECIAL (
SPECIAL_ID           SERIAL               not null,
BIO                  BOOL                 null,
CHOLESTEROL          BOOL                 null,
constraint PK_SPECIAL primary key (SPECIAL_ID)
);

/*==============================================================*/
/* Index: SPECIAL_PK                                            */
/*==============================================================*/
create unique index SPECIAL_PK on SPECIAL (
SPECIAL_ID
);

/*==============================================================*/
/* Table: SPECIAL_ALIMENT                                       */
/*==============================================================*/
create table SPECIAL_ALIMENT (
ALIMENT_ID           INT4                 not null,
SPECIAL_ID           INT4                 not null,
constraint PK_SPECIAL_ALIMENT primary key (ALIMENT_ID, SPECIAL_ID)
);

/*==============================================================*/
/* Index: SPECIAL_ALIMENT_PK                                    */
/*==============================================================*/
create unique index SPECIAL_ALIMENT_PK on SPECIAL_ALIMENT (
ALIMENT_ID,
SPECIAL_ID
);

/*==============================================================*/
/* Index: SPECIAL_ALIMENT_FK                                    */
/*==============================================================*/
create  index SPECIAL_ALIMENT_FK on SPECIAL_ALIMENT (
ALIMENT_ID
);

/*==============================================================*/
/* Index: SPECIAL_ALIMENT2_FK                                   */
/*==============================================================*/
create  index SPECIAL_ALIMENT2_FK on SPECIAL_ALIMENT (
SPECIAL_ID
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

alter table ALIMENT
   add constraint FK_ALIMENT_CATEGORIE_CATEGORI foreign key (CATEGORIE_ID)
      references CATEGORIE (CATEGORIE_ID)
      on delete restrict on update restrict;

alter table ALIMENT_COMPOSANT
   add constraint FK_ALIMENT__ALIMENT_C_ALIMENT foreign key (ALIMENT_ID)
      references ALIMENT (ALIMENT_ID)
      on delete restrict on update restrict;

alter table ALIMENT_COMPOSANT
   add constraint FK_ALIMENT__ALIMENT_C_COMPOSAN foreign key (COMPOSANT_ID)
      references COMPOSANT (COMPOSANT_ID)
      on delete restrict on update restrict;

alter table RECHERCHE
   add constraint FK_RECHERCH_RECHERCHE_CATEGORI foreign key (CATEGORIE_ID)
      references CATEGORIE (CATEGORIE_ID)
      on delete restrict on update restrict;

alter table RECHERCHE
   add constraint FK_RECHERCH_UTILISATE_UTILISAT foreign key (USER_ID)
      references UTILISATEUR (USER_ID)
      on delete restrict on update restrict;

alter table SPECIAL_ALIMENT
   add constraint FK_SPECIAL__SPECIAL_A_ALIMENT foreign key (ALIMENT_ID)
      references ALIMENT (ALIMENT_ID)
      on delete restrict on update restrict;

alter table SPECIAL_ALIMENT
   add constraint FK_SPECIAL__SPECIAL_A_SPECIAL foreign key (SPECIAL_ID)
      references SPECIAL (SPECIAL_ID)
      on delete restrict on update restrict;

