
-- -----------------------------------------------------
-- View `ddview_colleges`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_colleges` ;
CREATE VIEW `ddview_colleges` AS
    SELECT 
        `college`.`id` AS `key`, `college`.`name` AS `value`
    FROM
        `college`;

-- -----------------------------------------------------
-- View `ddview_degree_types`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_degree_types` ;
CREATE VIEW `ddview_degree_types` AS
    SELECT 
        `degree_type`.`id` AS `key`, `degree_type`.`name` AS `value`
    FROM
        `degree_type`;

-- -----------------------------------------------------
-- View `ddview_ethnicity`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_ethnicity` ;
CREATE VIEW `ddview_ethnicity` AS
    SELECT 
        `ethnicity`.`id` AS `key`, `ethnicity`.`name` AS `value`
    FROM
        `ethnicity`;

-- -----------------------------------------------------
-- View `ddview_major_type_degree_type_maps`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_major_type_degree_type_maps` ;
CREATE VIEW `ddview_major_type_degree_type_maps` AS
    SELECT 
        `major_degree_maps`.`major_type_id` AS `major_id`,
        `major_degree_maps`.`degree_type_id` AS `degree_id`
    FROM
        `major_degree_maps`;

-- -----------------------------------------------------
-- View `ddview_major_types`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_major_types` ;
CREATE VIEW `ddview_major_types` AS
    SELECT 
        `major_type`.`id` AS `key`,
        `major_type`.`major_name` AS `value`,
        `major_type`.`college_id` AS `college_id`
    FROM
        `major_type`;

-- -----------------------------------------------------
-- View `ddview_mil_branch`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_mil_branch` ;
CREATE VIEW `ddview_mil_branch` AS
    SELECT 
        `mil_branch`.`id` AS `key`, `mil_branch`.`branch` AS `value`
    FROM
        `mil_branch`;

-- -----------------------------------------------------
-- View `ddview_person_ethnicity`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_person_ethnicity` ;
CREATE VIEW `ddview_person_ethnicity` AS
    SELECT 
        `person_ethnicity`.`person_id` AS `person_id`,
        `person_ethnicity`.`enthnicity_id` AS `ethnicity_id`
    FROM
        `person_ethnicity`;

-- -----------------------------------------------------
-- View `ddview_student_types`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_student_types` ;
CREATE VIEW `ddview_student_types` AS
    SELECT 
        `student_type`.`id` AS `key`,
        `student_type`.`name` AS `value`
    FROM
        `student_type`;

-- -----------------------------------------------------
-- View `ddview_terms`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_terms` ;
CREATE VIEW `ddview_terms` AS
    SELECT 
        `term`.`id` AS `key`,
        CONCAT(`term`.`year`, ' - ', `term`.`quarter`) AS `value`
    FROM
        `term`;

-- -----------------------------------------------------
-- View `ddview_veteran_status`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_veteran_status` ;
CREATE VIEW `ddview_veteran_status` AS
    SELECT 
        `veteran_status`.`id` AS `key`,
        `veteran_status`.`status` AS `value`
    FROM
        `veteran_status`;
