create table users_AUD (
        id int4 not null,
        REV int4 not null,
        REVTYPE int2,
        enabled int4,
        password varchar(255),
        username varchar(255),
        group_id int4,
        primary key (id, REV)
    );
alter table users_AUD
        add constraint FK_e8r4q22dh138c5f4mvlsieff5
        foreign key (REV)
        references REVINFO;
