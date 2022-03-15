/* Create table garbage*/
CREATE TABLE GARBAGE
(
ref_year VARCHAR(20) NOT NULL,
local_govt VARCHAR(50) NOT NULL,
garbage_type VARCHAR(20) NOT NULL,
tonnes_collected NUMBER(10),
tonnes_recovered NUMBER(10)
);

/* Define the primary key for the table*/
ALTER TABLE PRODUCT ADD CONSTRAINT GARBAGE_PK PRIMARY KEY ( year,local_govt,garbage_type ) ;

/* Create table local_govt*/
CREATE TABLE LOCAl_GOVT
(
local_govt VARCHAR(50) NOT NULL,
WRRG VARCHAR(50),
service_provision_category VARCHAR(50),
metro_type VARCHAR(20)
);

/* Define the primary key for the table*/
ALTER TABLE LOCAl_GOVT ADD CONSTRAINT LOCAl_GOVT_PK PRIMARY KEY ( local_govt ) ;

/* Create table rec_and_cont*/
CREATE TABLE REC_AND_CONT
(
ref_year VARCHAR(20) NOT NULL,
garbage_collected NUMBER(10),
recyclables_collected NUMBER(10),
organics_collected NUMBER(10),
total_collected NUMBER(10),
tonnes_collected_rcy NUMBER(10),
tonnes_recovered_rcy NUMBER(10),
tonnes_to_landfill_rcy NUMBER(10),
tonnes_collected_org NUMBER(10),
tonnes_recovered_org NUMBER(10),
tonnes_to_landfill_org NUMBER(10),
glass_recovered NUMBER(10),
metal_recovered NUMBER(10),
paper_recovered NUMBER(10),
plastic_recovered NUMBER(10),
rubber_recovered NUMBER(10),
total_landfill NUMBER(10),
contamination_rate NUMBER(3,1)
);

/* Define the primary key for the table*/
ALTER TABLE REC_AND_CONT ADD CONSTRAINT REC_AND_CONT_PK PRIMARY KEY ( year ) ;

