/* 
==================================================
Group 5:
Ryne Uemura
Yevgeni Kamenski
==================================================*/

USE cs5021team5 ;

DROP TABLE IF EXISTS cs5021team5.employment_address ;
DROP TABLE IF EXISTS cs5021team5.person_address ;
DROP TABLE IF EXISTS cs5021team5.employment ;
DROP TABLE IF EXISTS cs5021team5.person_ethnicity ;
DROP TABLE IF EXISTS cs5021team5.veteran_info ;
DROP TABLE IF EXISTS cs5021team5.veteran_status ;
DROP TABLE IF EXISTS cs5021team5.test_record ;
DROP TABLE IF EXISTS cs5021team5.application ;
DROP TABLE IF EXISTS cs5021team5.major_degree_maps;
DROP TABLE IF EXISTS cs5021team5.term ;
DROP TABLE IF EXISTS cs5021team5.test_type ;
DROP TABLE IF EXISTS cs5021team5.student_type ;
DROP TABLE IF EXISTS cs5021team5.mil_branch ;
DROP TABLE IF EXISTS cs5021team5.major_type ;
DROP TABLE IF EXISTS cs5021team5.address ;
DROP TABLE IF EXISTS cs5021team5.states ;
DROP TABLE IF EXISTS cs5021team5.ethnicity ;
DROP TABLE IF EXISTS cs5021team5.degree_type ;
DROP TABLE IF EXISTS cs5021team5.prior_education ;
DROP TABLE IF EXISTS cs5021team5.person ;
DROP TABLE IF EXISTS cs5021team5.gender ;
DROP TABLE IF EXISTS cs5021team5.college ;

/* Table college 
----------------------------------------------------------
List of colleges at the university. */

CREATE TABLE IF NOT EXISTS cs5021team5.college (
    id INT(11) UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB ;


/* Table gender
----------------------------------------------------------
Unique gender labels that a person can choose from. */

CREATE TABLE IF NOT EXISTS cs5021team5.gender (
    label VARCHAR(20) NOT NULL,
    PRIMARY KEY (label)
)  ENGINE=INNODB;


/* Table person
----------------------------------------------------------
Personal information of the applicant.  */

CREATE TABLE IF NOT EXISTS cs5021team5.person (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT ,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    name_preferred VARCHAR(255) NULL,
    gender_label VARCHAR(10) NOT NULL,
    birthdate DATE NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    us_citizen BOOL NOT NULL,
    is_engl_native_lang BOOL NOT NULL,
    is_of_hisp_or_latin_origin BOOL NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_person_gender_label FOREIGN KEY (gender_label)
        REFERENCES cs5021team5.gender (label)
)  ENGINE=INNODB;


CREATE INDEX fk_person_gender_label_idx ON cs5021team5.person (gender_label ASC) ;

/* Table prior_education
----------------------------------------------------------
Prior education of the applicant referenced in the application. */

CREATE TABLE IF NOT EXISTS cs5021team5.prior_education (
    id INT(11) UNSIGNED NOT NULL,
    person_id INT(11) UNSIGNED NOT NULL,
    institution VARCHAR(255) NOT NULL,
    attended_from DATE NOT NULL,
    attended_to DATE NULL,
    degree_earned VARCHAR(255) NULL,
    major VARCHAR(255) NOT NULL,
    degree_received_date DATE NULL,
    PRIMARY KEY (id , person_id),
    CONSTRAINT fk_prior_education_person_id FOREIGN KEY (person_id)
        REFERENCES cs5021team5.person (id)
)  ENGINE=INNODB ;

CREATE INDEX fk_prior_education_person_id_idx ON cs5021team5.prior_education (person_id ASC) ;


/* Table degree_type       
----------------------------------------------------------
 Types of degrees offered at the specific college.*/

CREATE TABLE IF NOT EXISTS cs5021team5.degree_type (
    id INT(11) UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB ;


/* Table ethnicity       
----------------------------------------------------------
 Possible choices of ethnicities that may apply to person.*/

CREATE TABLE IF NOT EXISTS cs5021team5.ethnicity (
    id INT UNSIGNED NOT NULL,
    name VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB ;

CREATE UNIQUE INDEX name_UNIQUE ON cs5021team5.ethnicity (name ASC) ;


/* Table states
----------------------------------------------------------
 Possible choices of U.S. states referenced by the address.*/

CREATE TABLE IF NOT EXISTS cs5021team5.states (
    abbreviation CHAR(5) NOT NULL,
    full_name VARCHAR(45) NULL,
    PRIMARY KEY (abbreviation)
)  ENGINE=INNODB;


/* Table address      
----------------------------------------------------------
 Address entry referenced by the employment history or
 the applicant's personal info table. */

CREATE TABLE IF NOT EXISTS cs5021team5.address (
    id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    line1 VARCHAR(255) NOT NULL,
    line2 VARCHAR(255) NOT NULL,
    city VARCHAR(45) NOT NULL,
    state_abbreviation CHAR(5) NOT NULL,
    zip_code VARCHAR(15) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_state_abbreviation FOREIGN KEY (state_abbreviation)
        REFERENCES cs5021team5.states (abbreviation)
)  ENGINE=INNODB ;

CREATE INDEX fk_state_abbreviation_idx ON cs5021team5.address (state_abbreviation ASC) ;


/* Table major_type
----------------------------------------------------------
 All possible types of majors offered at the university*/

CREATE TABLE IF NOT EXISTS cs5021team5.major_type (
    id INT(11) UNSIGNED NOT NULL,
    major_name VARCHAR(50) NOT NULL,
    college_id INT(11) UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_major_type_college_id FOREIGN KEY (college_id)
        REFERENCES cs5021team5.college (id)
)  ENGINE=INNODB ;

CREATE INDEX fk_major_type_college_id_idx ON cs5021team5.major_type (college_id ASC) ;


/* Table mil_branch       
----------------------------------------------------------
 All possible types of military branches for applicant to 
 choose from.*/

CREATE TABLE IF NOT EXISTS cs5021team5.mil_branch (
    id INT UNSIGNED NOT NULL,
    branch VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB ;


/* Table student_type       
----------------------------------------------------------
 What kind of a student an applicant is, e.g. grad / ug.*/

CREATE TABLE IF NOT EXISTS cs5021team5.student_type (
    id INT UNSIGNED NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB ;


/* Table test_type      
----------------------------------------------------------
 All possible types of tests for applicant to reference
 in an application.*/

CREATE TABLE IF NOT EXISTS cs5021team5.test_type (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB ;

CREATE UNIQUE INDEX name_UNIQUE ON cs5021team5.test_type (name ASC) ;


/* Table term       
----------------------------------------------------------
 Possible choices of the terms, e.g. Fall, Summer..*/


CREATE TABLE IF NOT EXISTS cs5021team5.term (
    id INT UNSIGNED NOT NULL,
    quarter ENUM('Summer', 'Fall') NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB;


/* Table major_degree_maps
----------------------------------------------------------
 Many-to-many relationships of majors and degree types*/

CREATE TABLE IF NOT EXISTS cs5021team5.major_degree_maps (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    major_type_id INT(11) UNSIGNED NOT NULL,
    degree_type_id INT(11) UNSIGNED NOT NULL,
    PRIMARY KEY (id , major_type_id , degree_type_id),
    CONSTRAINT fk_major_degree_maps_major_type_id FOREIGN KEY (major_type_id)
        REFERENCES cs5021team5.degree_type (id),
    CONSTRAINT fk_major_degree_maps_degree_type_id FOREIGN KEY (degree_type_id)
        REFERENCES cs5021team5.major_type (id)
)  ENGINE=INNODB;

CREATE INDEX fk_major_degree_maps_major_type_id_idx ON cs5021team5.major_degree_maps (major_type_id ASC) ;
CREATE INDEX fk_majpr_type_degree_type_major_type1_idx ON cs5021team5.major_degree_maps (degree_type_id ASC) ;

CREATE INDEX major_degree_types_idx ON cs5021team5.major_degree_maps (major_type_id ASC, degree_type_id ASC) ;

CREATE INDEX major_degree_maps_id_idx ON cs5021team5.major_degree_maps (id ASC) ;

/* Table application       
----------------------------------------------------------
 Person's application. One person can have > 1.*/

CREATE TABLE IF NOT EXISTS cs5021team5.application (
    id INT UNSIGNED NOT NULL,
    person_id INT UNSIGNED NOT NULL,
    student_type_id INT UNSIGNED NOT NULL,
    major_degree_maps_id INT UNSIGNED NOT NULL,
    term_id INT UNSIGNED NOT NULL,
    applying_fin_aid BOOL NOT NULL,
    has_empl_tuit_assistance BOOL NOT NULL,
    is_applying_other_programs BOOL NOT NULL,
    is_convicted_felony_misdemeanor BOOL NOT NULL,
    is_placed_probation_susp_dismissed BOOL NOT NULL,
    PRIMARY KEY (id , person_id),
    CONSTRAINT fk_application_student_type_id FOREIGN KEY (student_type_id)
        REFERENCES cs5021team5.student_type (id),
    CONSTRAINT fk_application_term_id FOREIGN KEY (term_id)
        REFERENCES cs5021team5.term (id),
    CONSTRAINT fk_application_person_id FOREIGN KEY (person_id)
        REFERENCES cs5021team5.person (id),
    CONSTRAINT fk_application_major_degree_maps_id FOREIGN KEY (major_degree_maps_id)
        REFERENCES cs5021team5.major_degree_maps (id)
)  ENGINE=INNODB;


CREATE INDEX fk_application_student_type_id_idx ON cs5021team5.application (student_type_id ASC) ;

CREATE INDEX fk_application_term_id_idx ON cs5021team5.application (term_id ASC) ;

CREATE INDEX fk_application_person_id_idx ON cs5021team5.application (person_id ASC) ;

CREATE INDEX fk_application_major_degree_maps_id_idx oN cs5021team5.application (major_degree_maps_id ASC) ;


/* Table test_record       
----------------------------------------------------------
 Test records referenced in a person's application.*/

CREATE TABLE IF NOT EXISTS cs5021team5.test_record (
    id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    application_id INT UNSIGNED NOT NULL,
    test_type_id INT(11) NOT NULL,
    date_taken DATETIME NOT NULL,
    PRIMARY KEY (id , application_id),
    CONSTRAINT fk_test_record_test_type_id FOREIGN KEY (test_type_id)
        REFERENCES cs5021team5.test_type (id),
    CONSTRAINT fk_test_record_application_id FOREIGN KEY (application_id)
        REFERENCES cs5021team5.application (id)
)  ENGINE=INNODB ;

CREATE INDEX fk_test_record_test_type_idx ON cs5021team5.test_record (test_type_id ASC) ;

CREATE INDEX fk_test_record_application_id_idx  ON cs5021team5.test_record (application_id ASC) ;

/* Table veteran_status       
----------------------------------------------------------
 Possible options of the person's veteran status.*/

CREATE TABLE IF NOT EXISTS cs5021team5.veteran_status (
    id INT(11) UNSIGNED NOT NULL,
    status VARCHAR(45) NULL DEFAULT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB ;


/* Table veteran_info       
----------------------------------------------------------
 Stores info on the person's military history, if any.*/

CREATE TABLE IF NOT EXISTS cs5021team5.veteran_info (
    id INT UNSIGNED NOT NULL,
    person_id INT UNSIGNED NOT NULL,
    status_id INT UNSIGNED NOT NULL,
    branch_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id , person_id),
    CONSTRAINT fk_person_id FOREIGN KEY (person_id)
        REFERENCES cs5021team5.person (id),
    CONSTRAINT fk_status_id FOREIGN KEY (status_id)
        REFERENCES cs5021team5.veteran_status (id),
    CONSTRAINT fk_branch_id FOREIGN KEY (branch_id)
        REFERENCES cs5021team5.mil_branch (id)
)  ENGINE=INNODB;


CREATE INDEX fk_person_id_idx ON cs5021team5.veteran_info (person_id ASC) ;

CREATE INDEX fk_status_id_idx ON cs5021team5.veteran_info (status_id ASC) ;

CREATE INDEX fk_branch_id_idx ON cs5021team5.veteran_info (branch_id ASC) ;

/* Table person_ethnicity       
----------------------------------------------------------
 Ethnicities that a person picked on the application.*/

CREATE TABLE IF NOT EXISTS cs5021team5.person_ethnicity (
    person_id INT UNSIGNED NOT NULL,
    enthnicity_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (person_id , enthnicity_id),
    CONSTRAINT fk_person_ethnicity_person_id FOREIGN KEY (person_id)
        REFERENCES cs5021team5.person (id),
    CONSTRAINT fk_person_ethnicity_ethnicity_id FOREIGN KEY (enthnicity_id)
        REFERENCES cs5021team5.ethnicity (id)
)  ENGINE=INNODB;

CREATE INDEX fk_person_ethnicity_ethnicity_id_idx ON cs5021team5.person_ethnicity (enthnicity_id ASC) ;


/* Table employment       
----------------------------------------------------------
 Person's prior employment history.*/

CREATE TABLE IF NOT EXISTS cs5021team5.employment (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    person_id INT UNSIGNED NOT NULL,
    organization_name VARCHAR(255) NOT NULL,
    organization_phone VARCHAR(20) NULL,
    address_id INT UNSIGNED NOT NULL,
    currently_employed BOOL NOT NULL,
    job_title VARCHAR(255) NULL,
    date_start DATE NOT NULL,
    date_end DATE NULL,
    part_or_full_time ENUM('Part-time', 'Full-time') NOT NULL,
    PRIMARY KEY (id , person_id),
    CONSTRAINT fk_employment_person_id FOREIGN KEY (person_id)
        REFERENCES cs5021team5.person (id)
)  ENGINE=INNODB;

CREATE INDEX fk_employment_person_id_idx ON cs5021team5.employment (person_id ASC) ;


/* Table person_address       
----------------------------------------------------------
 Maps a unique address record to a person.*/

CREATE TABLE IF NOT EXISTS cs5021team5.person_address (
    person_id INT UNSIGNED NOT NULL,
    address_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (person_id , address_id),
    CONSTRAINT fk_person_address_person_id FOREIGN KEY (person_id)
        REFERENCES cs5021team5.person (id),
    CONSTRAINT fk_person_address_address_id FOREIGN KEY (address_id)
        REFERENCES cs5021team5.address (id)
)  ENGINE=INNODB;

CREATE INDEX fk_person_address_address_id_idx ON cs5021team5.person_address (address_id ASC) ;


/* Table employment_address
----------------------------------------------------------
 Maps a unique address record to an employment history rec.*/


CREATE TABLE IF NOT EXISTS cs5021team5.employment_address (
    employment_id INT UNSIGNED NOT NULL,
    address_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (employment_id , address_id),
    CONSTRAINT fk_employment_address_employment_id FOREIGN KEY (employment_id)
        REFERENCES cs5021team5.employment (id),
    CONSTRAINT fk_employment_address_address_id FOREIGN KEY (address_id)
        REFERENCES cs5021team5.address (id)
)  ENGINE=INNODB;

CREATE INDEX fk_employment_address_address_id_idx ON cs5021team5.employment_address (address_id ASC) ;





/* Delete any existing data if ran separately fm DLL
============================================================ */

SET SQL_SAFE_UPDATES = 0;

DELETE FROM cs5021team5.employment_address ;
DELETE FROM cs5021team5.person_address ;
DELETE FROM cs5021team5.employment ;
DELETE FROM cs5021team5.person_ethnicity ;
DELETE FROM cs5021team5.veteran_info ;
DELETE FROM cs5021team5.veteran_status ;
DELETE FROM cs5021team5.test_record ;
DELETE FROM cs5021team5.application ;
DELETE FROM cs5021team5.major_degree_maps;
DELETE FROM cs5021team5.term ;
DELETE FROM cs5021team5.test_type ;
DELETE FROM cs5021team5.student_type ;
DELETE FROM cs5021team5.mil_branch ;
DELETE FROM cs5021team5.major_type ;
DELETE FROM cs5021team5.address ;
DELETE FROM cs5021team5.states ;
DELETE FROM cs5021team5.ethnicity ;
DELETE FROM cs5021team5.degree_type ;
DELETE FROM cs5021team5.prior_education ;
DELETE FROM cs5021team5.person ;
DELETE FROM cs5021team5.gender ;
DELETE FROM cs5021team5.college ;


/* Base form data inserts
============================================================ */

INSERT INTO cs5021team5.college (id, name) 
VALUES 
	(1, 'College of Science and Engineering'),
	(2, 'Albers School of Business' ),
	(3, 'College of Arts and Sciences'),
	(4, 'College of Education'),
	(5, 'College of Nursing'),
	(6, 'School of Theology and Ministry');

INSERT INTO cs5021team5.degree_type (id, name) 
VALUES 
	(1, 'Certificates'),
	(2, 'Master\'s');

INSERT INTO cs5021team5.ethnicity (id, name) 
VALUES 
	(1, 'Asian'),
	(2, 'Black / African American'),
	(3, 'Native Hawaiian / Pacific Islander'),
	(4, 'Native American / Native Indian'),
	(5, 'White / Middle Eastern');

INSERT INTO cs5021team5.mil_branch (id, branch) 
VALUES 
	(1, 'Army'),
	(2, 'Marine Corp'),
	(3, 'Navy'),
	(4, 'Air Force'),
	(5, 'Coast Guard');

INSERT INTO cs5021team5.student_type (id, name) 
VALUES 
	(1, 'Graduate'),
	(2, 'Graduate Non-Matriculated'),
	(3, 'Graduate Readmission');

INSERT INTO cs5021team5.veteran_status (id, status) 
VALUES 
	(0, 'Not a veteran'),
	(1, 'Currently serving'),
	(2, 'Previosly served'),
	(3, 'Current dependent');

INSERT INTO cs5021team5.major_type (id, major_name, college_id) 
VALUES 
	(1, 'Certificate in Computer Science Fundamentals', 1),
	(2, 'Certificate in Software Architecture and Design', 1),
	(3, 'Certificate in Software Project Management', 1);

INSERT INTO cs5021team5.term (id, quarter, year) 
VALUES 
	(1, 'Summer', 2016),
	(2, 'Fall', 2016),
	(3, 'Summer', 2017),
	(4, 'Fall', 2017);

INSERT INTO cs5021team5.gender(label) 
VALUES 
	('Male'),
	('Female');

INSERT INTO cs5021team5.test_type (id, name) 
VALUES 
	(1, 'CBEST'),
	(2, 'GMAT'),
	(3, 'GRE General'),
	(4, 'IELTS'),
	(5, 'MAT'),
	(6, 'PRAXIS'),
	(7, 'TOEFL'),
	(8, 'WEST-B'),
	(9, 'WEST-E');


INSERT INTO states (abbreviation, full_name)
VALUES
	('AA' , 'Armed Forces Americas'),
	('AE' , 'Armed Forces Middle East'),
	('AK' , 'Alaska'),
	('AL' , 'Alabama'),
	('AP' , 'Armed Forces Pacific'),
	('AR' , 'Arkansas'),
	('AS' , 'American Samoa'),
	('AZ' , 'Arizona'),
	('CA' , 'California'),
	('CO' , 'Colorado'),
	('CT' , 'Connecticut'),
	('DC' , 'District of Columbia'),
	('DE' , 'Delaware'),
	('FL' , 'Florida'),
	('FM' , 'Federated States of Micronesia'),
	('GA' , 'Georgia'),
	('GU' , 'Guam'),
	('HI' , 'Hawaii'),
	('IA' , 'Iowa'),
	('ID' , 'Idaho'),
	('IL' , 'Illinois'),
	('IN' , 'Indiana'),
	('KS' , 'Kansas'),
	('KY' , 'Kentucky'),
	('LA' , 'Louisiana'),
	('MA' , 'Massachusetts'),
	('MD' , 'Maryland'),
	('ME' , 'Maine'),
	('MH' , 'Marshall Islands'),
	('MI' , 'Michigan'),
	('MN' , 'Minnesota'),
	('MO' , 'Missouri'),
	('MP' , 'Northern Mariana Islands'),
	('MS' , 'Mississippi'),
	('MT' , 'Montana'),
	('NC' , 'North Carolina'),
	('ND' , 'North Dakota'),
	('NE' , 'Nebraska'),
	('NH' , 'New Hampshire'),
	('NJ' , 'New Jersey'),
	('NM' , 'New Mexico'),
	('NV' , 'Nevada'),
	('NY' , 'New York'),
	('OH' , 'Ohio'),
	('OK' , 'Oklahoma'),
	('OR' , 'Oregon'),
	('PA' , 'Pennsylvania'),
	('PR' , 'Puerto Rico'),
	('PW' , 'Palau'),
	('RI' , 'Rhode Island'),
	('SC' , 'South Carolina'),
	('SD' , 'South Dakota'),
	('TN' , 'Tennessee'),
	('TX' , 'Texas'),
	('UT' , 'Utah'),
	('VA' , 'Virginia'),
	('VI' , 'Virgin Islands'),
	('VT' , 'Vermont'),
	('WA' , 'Washington'),
	('WI' , 'Wisconsin'),
	('WV' , 'West Virginia'),
	('WY' , 'Wyoming');



/* Sample applicant data inserts
============================================================ 


INSERT INTO cs5021team5.application 
VALUES 
(1, 1, 1, 1, 1, TRUE, FALSE, FALSE, FALSE, FALSE);
INSERT INTO cs5021team5.person  
VALUES (1, 'Dan', 'Smith', NULL, 'Male', '1993-12-25', 1234567890, TRUE, TRUE, FALSE);
INSERT INTO cs5021team5.person_ethnicity 
VALUES(1, 5);
INSERT INTO cs5021team5.veteran_info 
VALUES(1, 1, 2, 1);
INSERT INTO cs5021team5.employment 
VALUES(1, 1, 'WalMart', NULL, 1, FALSE, NULL, '2010-08-22', NULL, NULL);
INSERT INTO cs5021team5.address 
VALUES (1, '2021 E QWERTY St', 'whatever', 'Seattle', 'WA', '98122');
INSERT INTO cs5021team5.prior_education 
VALUES (1, 1, 'Seattle University', '2009-07-29', NULL, NULL, 'BS Computer Science', NULL);
INSERT INTO cs5021team5.test_record 
VALUES (1, 1, 3, '2013-03-29');
INSERT INTO cs5021team5.major_type 
VALUES (1, 'Certificate in Computer Science Fundamentals', 1);
INSERT INTO major_type_degree_type 
VALUES (1, 1, 1);
*/
