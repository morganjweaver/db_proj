
-- -----------------------------------------------------
-- View `ddview_colleges`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_colleges`;
CREATE VIEW `ddview_colleges` AS
    SELECT 
        `college`.`id` AS `key`, `college`.`name` AS `value`
    FROM
        `college`;

-- -----------------------------------------------------
-- View `ddview_degree_types`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_degree_types`;
CREATE VIEW `ddview_degree_types` AS
    SELECT 
        `id` AS `key`, 
        `name` AS `value`
    FROM
        `degree_type`;

-- -----------------------------------------------------
-- View `ddview_ethnicity`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_ethnicities`;
CREATE VIEW `ddview_ethnicities` AS
    SELECT 
        `id` AS `key`, 
        `name` AS `value`
    FROM
        `ethnicity`;

-- -----------------------------------------------------
-- View `ddview_major_type_degree_type_maps`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_major_type_degree_type_maps`;
CREATE VIEW `ddview_major_type_degree_type_maps` AS
    SELECT 
        `major_type_id` AS `major_id`,
        `degree_type_id` AS `degree_id`
    FROM
        `major_degree_maps`;

-- -----------------------------------------------------
-- View `ddview_major_types`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_major_types`;
CREATE VIEW `ddview_major_types` AS
    SELECT 
        `id` AS `key`,
        `major_name` AS `value`,
        `college_id` AS `college_id`
    FROM
        `major_type`;

-- -----------------------------------------------------
-- View `ddview_mil_branch`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_mil_branches`;
CREATE VIEW `ddview_mil_branches` AS
    SELECT 
        `id` AS `key`, 
        `branch` AS `value`
    FROM
        `mil_branch`;

-- -----------------------------------------------------
-- View `ddview_student_types`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_student_types` ;
CREATE VIEW `ddview_student_types` AS
    SELECT 
        `id` AS `key`,
        `name` AS `value`
    FROM
        `student_type`;

-- -----------------------------------------------------
-- View `ddview_terms`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_terms`;
CREATE VIEW `ddview_terms` AS
    SELECT 
        `term`.`id` AS `key`,
        CONCAT(`term`.`year`, ' - ', `term`.`quarter`) AS `value`
    FROM
        `term`;

-- -----------------------------------------------------
-- View `ddview_veteran_status`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_veteran_statuses`;
CREATE VIEW `ddview_veteran_statuses` AS
    SELECT 
        `id` AS `key`,
        `status` AS `value`
    FROM
        `veteran_status`;
        
-- -----------------------------------------------------
-- View `ddview_states`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_states` ;
CREATE VIEW `ddview_states` AS
    SELECT 
        abbreviation AS `key`, 
        CONCAT(abbreviation, ' - ', full_name) AS `value`
    FROM
        states
	ORDER BY abbreviation ASC;
    
-- -----------------------------------------------------
-- View `ddview_genders`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `ddview_genders` ;
CREATE VIEW `ddview_genders` AS
    SELECT 
        label AS `key`,
        label AS `value`
    FROM
        gender;