CREATE DATABASE  IF NOT EXISTS HMS;
USE HMS;

CREATE TABLE role (
  id int NOT NULL AUTO_INCREMENT,
  type varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE sex (
  id int NOT NULL AUTO_INCREMENT,
  type varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE is_active (
  id int NOT NULL AUTO_INCREMENT,
  type varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE appointment_type (
  id int NOT NULL AUTO_INCREMENT,
  type varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE department (
  id int NOT NULL AUTO_INCREMENT,
  type varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE doctor (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  sex_id int NOT NULL,
  birthday date NOT NULL,
  email varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  phone int NOT NULL,
  address text NOT NULL,
  is_active_id int NOT NULL,
  dep_id int NOT NULL,
  rate double NOT NULL,
  role_id int NOT NULL,
  PRIMARY KEY (id),
  INDEX doctor_dep_id_foreign (dep_id ASC) VISIBLE,
  INDEX doctor_sex_id_foreign (sex_id ASC) VISIBLE,
  INDEX doctor_is_active_id_foreign (is_active_id ASC) VISIBLE,
  INDEX doctor_role_id_foreign (role_id ASC) VISIBLE
);

CREATE TABLE dr_edu (
  id int NOT NULL AUTO_INCREMENT,
  dr_id int NOT NULL,
  university varchar(255) NOT NULL,
  Bachelor text NOT NULL,
  graduation_year date NOT NULL,
  PRIMARY KEY (id),
  INDEX dr_edu_dr_id_foreign (dr_id ASC) VISIBLE
);


CREATE TABLE dr_exp (
  id int NOT NULL AUTO_INCREMENT,
  dr_id int NOT NULL,
  hos_name varchar(255) NOT NULL,
  exp_from date NOT NULL,
  exp_to date NOT NULL,
  exp longtext NOT NULL,
  PRIMARY KEY (id),
  INDEX dr_exp_dr_id_foreign (dr_id ASC) VISIBLE
);


CREATE TABLE hospital (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  phone int NOT NULL,
  email varchar(255) NOT NULL,
  rate double NOT NULL,
  address text NOT NULL,
  is_active_id int NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE hos_address (
  id int NOT NULL AUTO_INCREMENT,
  hos_id int NOT NULL,
  city int NOT NULL,
  PRIMARY KEY (id),
  INDEX hos_address_hos_id_foreign (hos_id ASC) VISIBLE
);

CREATE TABLE hos_admin (
  id int NOT NULL AUTO_INCREMENT,
  hos_id int NOT NULL,
  name varchar(255) NOT NULL,
  sex_id int NOT NULL,
  birthday date NOT NULL,
  phone int NOT NULL,
  address text NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  is_active_id int NOT NULL,
  role_id int NOT NULL,
  PRIMARY KEY (id),
  INDEX hos_admin_role_id_foreign (role_id ASC) VISIBLE,
  INDEX hos_admin_sex_id_foreign (sex_id ASC) VISIBLE,
  INDEX hos_admin_is_active_id_foreign (is_active_id ASC) VISIBLE,
  INDEX hos_admin_hos_id_foreign (hos_id ASC) VISIBLE
);

CREATE TABLE hos_dep (
  id int NOT NULL AUTO_INCREMENT,
  dep_id int NOT NULL,
  hos_id int NOT NULL,
  PRIMARY KEY (id),
  INDEX hos_dep_hos_id_foreign (hos_id ASC) VISIBLE,
  INDEX hos_dep_dep_id_foreign (dep_id ASC) VISIBLE
);

CREATE TABLE patient (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  sex_id int NOT NULL,
  birthday date NOT NULL,
  phone int NOT NULL,
  address text NOT NULL,
  email varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  role_id int NOT NULL,
  is_active_id int NOT NULL,
  PRIMARY KEY (id),
  INDEX hos_admin_sex_id_foreign (sex_id ASC) VISIBLE,
  INDEX hos_admin_is_active_id_foreign (is_active_id ASC) VISIBLE,
  INDEX patient_role_id_foreign (role_id ASC) VISIBLE
);

CREATE TABLE invoice_status (
  id int NOT NULL AUTO_INCREMENT,
  type varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE web_admin (
  id int NOT NULL AUTO_INCREMENT,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  role_id int NOT NULL,
  PRIMARY KEY (id),
  INDEX web_admin_role_id_foreign (role_id ASC) VISIBLE
);

CREATE TABLE appointment (
  id int NOT NULL AUTO_INCREMENT,
  pat_id int NOT NULL,
  dr_id int NOT NULL,
  hos_dep_id int NOT NULL,
  date date NOT NULL,
  start_time time NOT NULL,
  end_time time NOT NULL,
  type_id int NOT NULL,
  PRIMARY KEY (id),
  INDEX appointment_dr_id_foreign (dr_id ASC) VISIBLE,
  INDEX appointment_hos_dep_id_foreign (hos_dep_id ASC) VISIBLE,
  INDEX appointment_pat_id_foreign (pat_id ASC) VISIBLE,
  INDEX appointment_type_id_foreign (type_id ASC) VISIBLE
);

CREATE TABLE pat_docs (
  id int NOT NULL AUTO_INCREMENT,
  pat_id int NOT NULL,
  doc_name varchar(255) NOT NULL,
  appointment_id int NOT NULL,
  link text NOT NULL,
  dep_id int NOT NULL,
  PRIMARY KEY (id),
  INDEX pat_docs_pat_id_foreign (pat_id ASC) VISIBLE,
  INDEX pat_docs_appointment_id_foreign (appointment_id ASC) VISIBLE,
  INDEX pat_docs_dep_id_foreign (dep_id ASC) VISIBLE
);

CREATE TABLE invoice (
  id int NOT NULL AUTO_INCREMENT,
  hos_admin_id int NOT NULL,
  amount int NOT NULL,
  paid_on datetime NOT NULL,
  invoice_status_id int NOT NULL,
  appointment_id int NOT NULL,
  PRIMARY KEY (id),
  INDEX invoice_invoice_status_id_foreign (invoice_status_id ASC) VISIBLE,
  INDEX invoice_hos_admin_id_foreign (hos_admin_id ASC) VISIBLE,
  INDEX invoice_appointment_id_foreign (appointment_id ASC) VISIBLE
);

CREATE TABLE calendar (
  id int NOT NULL AUTO_INCREMENT,
  dr_id int NOT NULL,
  hos_id int NOT NULL,
  date date NOT NULL,
  start_time time NOT NULL,
  end_time time NOT NULL,
  PRIMARY KEY (id),
  INDEX calendar_hos_id_foreign (hos_id ASC) VISIBLE,
  INDEX calendar_dr_id_foreign (dr_id ASC) VISIBLE
);

CREATE TABLE social_type (
  id int NOT NULL AUTO_INCREMENT,
  type varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE social (
  id int NOT NULL AUTO_INCREMENT,
  dr_id int,
  hos_id int,
  social_type_id int NOT NULL,
  link varchar(255) NOT NULL,
  PRIMARY KEY (id),
  INDEX social_hos_id_foreign (hos_id ASC) VISIBLE,
  INDEX social_social_type_id_foreign (social_type_id ASC) VISIBLE,
  INDEX social_dr_id_foreign (dr_id ASC) VISIBLE
);








ALTER TABLE
    HMS.doctor ADD CONSTRAINT doctor_dep_id_foreign FOREIGN KEY(dep_id) REFERENCES HMS.department (id);
ALTER TABLE
    HMS. doctor ADD CONSTRAINT doctor_role_id_foreign FOREIGN KEY (role_id) REFERENCES HMS.role (id);
ALTER TABLE
    HMS. dr_edu ADD CONSTRAINT dr_edu_dr_id_foreign FOREIGN KEY (dr_id) REFERENCES HMS.doctor (id);
ALTER TABLE
    HMS. dr_exp ADD CONSTRAINT dr_exp_dr_id_foreign FOREIGN KEY (dr_id) REFERENCES HMS.doctor (id);
ALTER TABLE
    HMS.hos_address ADD CONSTRAINT hos_address_hos_id_foreign FOREIGN KEY (hos_id) REFERENCES HMS.hospital (id);
ALTER TABLE
    HMS.hos_admin ADD CONSTRAINT hos_admin_hos_id_foreign FOREIGN KEY (hos_id) REFERENCES HMS.hospital (id);
ALTER TABLE
    HMS.hos_admin ADD CONSTRAINT hos_admin_role_id_foreign FOREIGN KEY (role_id) REFERENCES HMS.role (id);
ALTER TABLE
    HMS.hos_dep ADD CONSTRAINT hos_dep_dep_id_foreign FOREIGN KEY (dep_id) REFERENCES HMS.department (id);
ALTER TABLE
    HMS.hos_dep ADD CONSTRAINT hos_dep_hos_id_foreign FOREIGN KEY (hos_id) REFERENCES HMS.hospital (id);
ALTER TABLE
    HMS.patient ADD CONSTRAINT patient_role_id_foreign FOREIGN KEY (role_id) REFERENCES HMS.role (id);
ALTER TABLE
    HMS.web_admin ADD CONSTRAINT web_admin_role_id_foreign FOREIGN KEY (role_id) REFERENCES HMS.role (id);
ALTER TABLE
    HMS.appointment ADD CONSTRAINT appointment_dr_id_foreign FOREIGN KEY (dr_id) REFERENCES HMS.doctor (id);
ALTER TABLE
    HMS.appointment ADD CONSTRAINT appointment_hos_dep_id_foreign FOREIGN KEY (hos_dep_id) REFERENCES HMS.hos_dep (id);
ALTER TABLE
    HMS.appointment ADD CONSTRAINT appointment_pat_id_foreign FOREIGN KEY (pat_id) REFERENCES HMS.patient (id);
ALTER TABLE
    HMS.appointment ADD CONSTRAINT appointment_type_id_foreign FOREIGN KEY (type_id) REFERENCES HMS.appointment_type (id);
ALTER TABLE
    HMS.pat_docs ADD CONSTRAINT pat_docs_appointment_id_foreign FOREIGN KEY (appointment_id) REFERENCES HMS.appointment (id);
ALTER TABLE
    HMS.pat_docs ADD CONSTRAINT pat_docs_dep_id_foreign FOREIGN KEY (dep_id) REFERENCES HMS.department (id);
ALTER TABLE
    HMS.pat_docs ADD CONSTRAINT pat_docs_pat_id_foreign FOREIGN KEY (pat_id) REFERENCES HMS.patient (id);
ALTER TABLE
    HMS.invoice ADD CONSTRAINT invoice_appointment_id_foreign FOREIGN KEY (appointment_id) REFERENCES HMS.appointment (id);
ALTER TABLE
    HMS.invoice ADD CONSTRAINT invoice_hos_admin_id_foreign FOREIGN KEY (hos_admin_id) REFERENCES HMS.hos_admin (id);
ALTER TABLE
    HMS.invoice ADD CONSTRAINT invoice_invoice_status_id_foreign FOREIGN KEY (invoice_status_id) REFERENCES HMS.invoice_status (id);
ALTER TABLE
    HMS.calendar ADD CONSTRAINT calendar_dr_id_foreign FOREIGN KEY (dr_id) REFERENCES HMS.doctor (id);
ALTER TABLE
    HMS.calendar ADD CONSTRAINT calendar_hos_id_foreign FOREIGN KEY (hos_id) REFERENCES HMS.hospital (id);
ALTER TABLE
    HMS.social ADD CONSTRAINT social_dr_id_foreign FOREIGN KEY (dr_id) REFERENCES HMS.doctor (id);
ALTER TABLE
    HMS.social ADD CONSTRAINT social_hos_id_foreign FOREIGN KEY (hos_id) REFERENCES HMS.hospital (id);
ALTER TABLE
    HMS.social ADD CONSTRAINT social_social_type_id_foreign FOREIGN KEY (social_type_id) REFERENCES HMS.social_type (id);
ALTER TABLE
    HMS.doctor ADD CONSTRAINT doctor_sex_id_foreign FOREIGN KEY (sex_id) REFERENCES HMS.sex (id);
ALTER TABLE
    HMS.hos_admin ADD CONSTRAINT hos_admin_sex_id_foreign FOREIGN KEY (sex_id) REFERENCES HMS.sex (id);
ALTER TABLE
    HMS.patient ADD CONSTRAINT patient_sex_id_foreign FOREIGN KEY (sex_id) REFERENCES HMS.sex (id);
ALTER TABLE
    HMS.doctor ADD CONSTRAINT doctor_is_active_id_foreign FOREIGN KEY (is_active_id) REFERENCES HMS.is_active (id);
ALTER TABLE
    HMS.hos_admin ADD CONSTRAINT hos_admin_is_active_id_foreign FOREIGN KEY (is_active_id) REFERENCES HMS.is_active (id);
ALTER TABLE
    HMS.patient ADD CONSTRAINT patient_is_active_id_foreign FOREIGN KEY (is_active_id) REFERENCES HMS.is_active (id);
ALTER TABLE
    HMS.hospital ADD CONSTRAINT hospital_is_active_id_foreign FOREIGN KEY (is_active_id) REFERENCES HMS.is_active (id);



