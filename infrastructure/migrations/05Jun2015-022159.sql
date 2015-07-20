-- --------------------------------------------------------------------------------
--  Creation Date:  05Jun2015
-- --------------------------------------------------------------------------------

-- Choose the database.
USE countrybudget;

-- Temporarily turn off foreign keys
SET FOREIGN_KEY_CHECKS = 0;

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE all_users table.
-- ------------------------------------------------------------------
-- SELECT 'all_users' AS "DROP TABLE";
-- DROP TABLE IF EXISTS `all_users`;
-- 
-- SELECT 'all_users' AS "CREATE TABLE";
-- CREATE TABLE `all_users`
-- ( `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
-- , `name`             VARCHAR(30)  NOT NULL
-- , `active`           TINYINT(1)   NOT NULL
-- , `actual_label`     VARCHAR(30)  NOT NULL
-- , `whatif_label`     VARCHAR(30)  NOT NULL
-- , `income_label`     VARCHAR(30)  NOT NULL
-- , `expenses_label`   VARCHAR(30)  NOT NULL
-- , `revenue_label`    VARCHAR(30)  NOT NULL
-- , `assets_label`     VARCHAR(30)  NOT NULL
-- , `gdp_label`        VARCHAR(30)  NOT NULL
-- , `created_by`       INT UNSIGNED NOT NULL
-- , `creation_date`    TIMESTAMP    NOT NULL
-- , `last_updated_by`  INT UNSIGNED NOT NULL
-- , `last_update_date` TIMESTAMP    NOT NULL
-- , KEY all_users_fk1 (`created_by`)
-- , CONSTRAINT all_users_fk1 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
-- , KEY all_users_fk2 (`last_updated_by`)
-- , CONSTRAINT all_users_fk2 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
-- ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE group table.
-- ------------------------------------------------------------------
SELECT 'group' AS "DROP TABLE";
DROP TABLE IF EXISTS `group`;

-- WITHOUT all_users reference
SELECT 'group' AS "CREATE TABLE";
CREATE TABLE `group`
( `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, `name`             VARCHAR(30)  NOT NULL
, `active`           TINYINT(1)   NOT NULL
, `actual_label`     VARCHAR(30)  NOT NULL
, `whatif_label`     VARCHAR(30)  NOT NULL
, `income_label`     VARCHAR(30)  NOT NULL
, `expenses_label`   VARCHAR(30)  NOT NULL
, `revenue_label`    VARCHAR(30)  NOT NULL
, `assets_label`     VARCHAR(30)  NOT NULL
, `gdp_label`        VARCHAR(30)  NOT NULL
, `created_by`       INT UNSIGNED NOT NULL
, `creation_date`    TIMESTAMP    NOT NULL
, `last_updated_by`  INT UNSIGNED NOT NULL
, `last_update_date` TIMESTAMP    NOT NULL
, KEY group_fk1 (`created_by`)
, CONSTRAINT group_fk1 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
, KEY group_fk2 (`last_updated_by`)
, CONSTRAINT group_fk2 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- WITH all_users reference
-- SELECT 'group' AS "CREATE TABLE";
-- CREATE TABLE `group`
-- ( `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
-- , `name`             VARCHAR(30)  NOT NULL
-- , `active`           TINYINT(1)   NOT NULL
-- , `all_users_id`     INT UNSIGNED NOT NULL
-- , `actual_label`     VARCHAR(30)  NOT NULL
-- , `whatif_label`     VARCHAR(30)  NOT NULL
-- , `income_label`     VARCHAR(30)  NOT NULL
-- , `expenses_label`   VARCHAR(30)  NOT NULL
-- , `revenue_label`    VARCHAR(30)  NOT NULL
-- , `assets_label`     VARCHAR(30)  NOT NULL
-- , `gdp_label`        VARCHAR(30)  NOT NULL
-- , `created_by`       INT UNSIGNED NOT NULL
-- , `creation_date`    TIMESTAMP    NOT NULL
-- , `last_updated_by`  INT UNSIGNED NOT NULL
-- , `last_update_date` TIMESTAMP    NOT NULL
-- , KEY group_fk1 (`all_users_id`)
-- , CONSTRAINT group_fk1 FOREIGN KEY (`all_users_id`) REFERENCES `all_users` (`id`)
-- , KEY group_fk2 (`created_by`)
-- , CONSTRAINT group_fk2 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
-- , KEY group_fk3 (`last_updated_by`)
-- , CONSTRAINT group_fk3 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
-- ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

SELECT 'group' AS "INSERT INTO";
INSERT INTO `group`
( `name`
, `active`
, `actual_label`
, `whatif_label`
, `income_label`
, `expenses_label`
, `revenue_label`
, `assets_label`
, `gdp_label`
, `created_by`
, `creation_date`
, `last_updated_by`
, `last_update_date`)
VALUES
( 'Larcadia'
, 1
, 'Actual'
, 'What If'
, 'Income'
, 'Expenses'
, 'Revenue'
, 'Assets'
, 'GDP'
, 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

SELECT 'group' AS "INSERT INTO";
INSERT INTO `group`
( `name`
, `active`
, `actual_label`
, `whatif_label`
, `income_label`
, `expenses_label`
, `revenue_label`
, `assets_label`
, `gdp_label`
, `created_by`
, `creation_date`
, `last_updated_by`
, `last_update_date`)
VALUES
( 'asdf'
, 1
, 'Actual'
, 'What If'
, 'Income'
, 'Expenses'
, 'Revenue'
, 'Assets'
, 'GDP'
, 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE user table.
-- ------------------------------------------------------------------
SELECT 'user' AS "DROP TABLE";
DROP TABLE IF EXISTS `user`;

SELECT 'user' AS "CREATE TABLE";
CREATE TABLE `user`
( `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, `user_name`        VARCHAR(30)
, `email`            VARCHAR(30)  NOT NULL
, `password`         VARCHAR(30)  NOT NULL
, `role_id`          INT UNSIGNED NOT NULL
, `active`           TINYINT(1)   NOT NULL
, `group_id`         INT UNSIGNED NOT NULL
, `created_by`       INT UNSIGNED NOT NULL
, `creation_date`    TIMESTAMP    NOT NULL
, `last_updated_by`  INT UNSIGNED NOT NULL
, `last_update_date` TIMESTAMP    NOT NULL
, KEY user_fk1 (`role_id`)
, CONSTRAINT user_fk1 FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
, KEY user_fk2 (`created_by`)
, CONSTRAINT user_fk2 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
, KEY user_fk3 (`last_updated_by`)
, CONSTRAINT user_fk3 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

SELECT 'user' AS "INSERT INTO";
INSERT INTO `user`
( `user_name`
, `email`
, `password`
, `role_id`
, `active`
, `group_id`
, `created_by`
, `creation_date`
, `last_updated_by`
, `last_update_date`)
VALUES
( 'Cory Larcade'
, 'clarcade@gmail.com'
, 'asdf'
, 1
, 1
, 1
, 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

SELECT 'user' AS "INSERT INTO";
INSERT INTO `user`
( `user_name`
, `email`
, `password`
, `role_id`
, `active`
, `group_id`
, `created_by`
, `creation_date`
, `last_updated_by`
, `last_update_date`)
VALUES
( 'asdf'
, 'asdf@asdf'
, 'asdf'
, 2
, 1
, 2
, 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

-- SELECT 'user' AS "CREATE TABLE";
-- CREATE TABLE `user`
-- ( `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
-- , `first_name`       VARCHAR(30)  NOT NULL
-- , `middle_name`      VARCHAR(30)
-- , `last_name`        VARCHAR(30)  NOT NULL
-- , `email`            VARCHAR(30)  NOT NULL
-- , `password`         VARCHAR(30)  NOT NULL
-- , `role_id`          INT UNSIGNED NOT NULL
-- , `active`           TINYINT(1)   NOT NULL
-- , `group_id`         INT UNSIGNED NOT NULL
-- , `created_by`       INT UNSIGNED NOT NULL
-- , `creation_date`    TIMESTAMP    NOT NULL
-- , `last_updated_by`  INT UNSIGNED NOT NULL
-- , `last_update_date` TIMESTAMP    NOT NULL
-- , KEY user_fk1 (`role_id`)
-- , CONSTRAINT user_fk1 FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
-- , KEY user_fk2 (`created_by`)
-- , CONSTRAINT user_fk2 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
-- , KEY user_fk3 (`last_updated_by`)
-- , CONSTRAINT user_fk3 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
-- ) ENGINE = InnoDB DEFAULT CHARSET = utf8;
--
-- SELECT 'user' AS "INSERT INTO";
-- INSERT INTO `user`
-- ( `first_name`
-- , `last_name`
-- , `email`
-- , `password`
-- , `role_id`
-- , `active`
-- , `group_id`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Cory'
-- , 'Larcade'
-- , 'clarcade@gmail.com'
-- , 'asdf'
-- , 1
-- , 1
-- , 1
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE role table.
-- ------------------------------------------------------------------
SELECT 'role' AS "DROP TABLE";
DROP TABLE IF EXISTS `role`;

SELECT 'role' AS "CREATE TABLE";
CREATE TABLE `role`
( `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, `name`             CHAR(30)     NOT NULL
, `description`      VARCHAR(200) NOT NULL
, `created_by`       INT UNSIGNED NOT NULL
, `creation_date`    TIMESTAMP    NOT NULL
, `last_updated_by`  INT UNSIGNED NOT NULL
, `last_update_date` TIMESTAMP    NOT NULL
, KEY role_fk1 (`created_by`)
, CONSTRAINT role_fk1 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
, KEY role_fk2 (`last_updated_by`)
, CONSTRAINT role_fk2 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

SELECT 'role' AS "INSERT INTO";
INSERT INTO `role`
( `name`
, `description`
, `created_by`
, `creation_date`
, `last_updated_by`
, `last_update_date`)
VALUES
( 'SYSTEM ADMIN'
, 'System Administrators can view and modify ALL data.'
, 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

-- SELECT 'role' AS "INSERT INTO";
-- INSERT INTO role
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'ALL-USERS ADMIN'
-- , 'All-Users Administrators can view and modify their own All-Users\'s data, as well as groups and individuals within their All-Users.'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

SELECT 'role' AS "INSERT INTO";
INSERT INTO role
( `name`
, `description`
, `created_by`
, `creation_date`
, `last_updated_by`
, `last_update_date`)
VALUES
( 'GROUP ADMIN'
, 'Group Administrators can view and modify their own group\'s data, as well as individuals within their group.'
, 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

SELECT 'role' AS "INSERT INTO";
INSERT INTO role
( `name`
, `description`
, `created_by`
, `creation_date`
, `last_updated_by`
, `last_update_date`)
VALUES
( 'INDIVIDUAL'
, 'Individual\'s can only view and modify what their Group Administrator\'s set for them.'
, 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE permission table.
-- ------------------------------------------------------------------
-- SELECT 'permission' AS "DROP TABLE";
-- DROP TABLE IF EXISTS `permission`;
-- 
-- SELECT 'permission' AS "CREATE TABLE";
-- CREATE TABLE `permission`
-- ( `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
-- , `name`             VARCHAR(100) NOT NULL
-- , `description`      VARCHAR(200) NOT NULL
-- , `created_by`       INT UNSIGNED NOT NULL
-- , `creation_date`    TIMESTAMP    NOT NULL
-- , `last_updated_by`  INT UNSIGNED NOT NULL
-- , `last_update_date` TIMESTAMP    NOT NULL
-- , KEY permission_fk1 (`created_by`)
-- , CONSTRAINT permission_fk1 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
-- , KEY permission_fk2 (`last_updated_by`)
-- , CONSTRAINT permission_fk2 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
-- ) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( name
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group Page'
-- , 'Allows for viewing the group page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group Individuals'
-- , 'Allows for viewing other individual\'s data in the group'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group Actual Income'
-- , 'Allows for viewing the group actual income data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Edit Group Actual Income'
-- , 'Allows for viewing and modifying the group actual income data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group Actual Expenses'
-- , 'Allows for viewing the group actual expenses data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Edit Group Actual Expenses'
-- , 'Allows for viewing and modifying the group actual expenses data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( name
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group Actual Revenue'
-- , 'Allows for viewing the group actual revenue data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( name
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group Actual Assets'
-- , 'Allows for viewing the group actual assets data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Edit Group Actual Assets'
-- , 'Allows for viewing and modifying the group actual assets data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group Actual GDP'
-- , 'Allows for viewing the group actual GDP data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group What If Income'
-- , 'Allows for viewing the group What If income data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Edit Group What If Income'
-- , 'Allows for viewing and modifying the group What If income data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group What If Expenses'
-- , 'Allows for viewing the group What If expenses data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Edit Group What If Expenses'
-- , 'Allows for viewing and modifying the group What If expenses data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group What If Revenue'
-- , 'Allows for viewing the group What If revenue data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group What If Assets'
-- , 'Allows for viewing the group What If assets data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Edit Group What If Assets'
-- , 'Allows for viewing and modifying the group What If assets data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Group What If GDP'
-- , 'Allows for viewing the group What If GDP data'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation Page'
-- , 'Allows for viewing the nation page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation Actual Income'
-- , 'Allows for viewing the nation actual income page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation Actual Expenses'
-- , 'Allows for viewing the nation actual expenses page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation Actual Revenue'
-- , 'Allows for viewing the nation actual revenue page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation Actual Assets'
-- , 'Allows for viewing the nation actual assets page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation Actual GDP'
-- , 'Allows for viewing the nation actual GDP page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation What If Income'
-- , 'Allows for viewing the nation What If income page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation What If Expenses'
-- , 'Allows for viewing the nation What If expenses page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation What If Revenue'
-- , 'Allows for viewing the nation What If revenue page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation What If Assets'
-- , 'Allows for viewing the nation What If assets page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'permission' AS "INSERT INTO";
-- INSERT INTO `permission`
-- ( `name`
-- , `description`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'View Nation What If GDP'
-- , 'Allows for viewing the nation What If GDP page'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE label table.
-- ------------------------------------------------------------------
-- SELECT 'label' AS "DROP TABLE";
-- DROP TABLE IF EXISTS `label`;
-- 
-- SELECT 'label' AS "CREATE TABLE";
-- CREATE TABLE `label`
-- ( `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
-- , `name`             VARCHAR(30)  NOT NULL
-- , `created_by`       INT UNSIGNED NOT NULL
-- , `creation_date`    TIMESTAMP    NOT NULL
-- , `last_updated_by`  INT UNSIGNED NOT NULL
-- , `last_update_date` TIMESTAMP    NOT NULL
-- , KEY label_fk1 (`created_by`)
-- , CONSTRAINT label_fk1 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
-- , KEY label_fk2 (`last_updated_by`)
-- , CONSTRAINT label_fk2 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
-- ) ENGINE = InnoDB DEFAULT CHARSET = utf8;
-- 
-- SELECT 'label' AS "INSERT INTO";
-- INSERT INTO `label`
-- ( `name`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'National'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'label' AS "INSERT INTO";
-- INSERT INTO `label`
-- ( `name`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Household'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'label' AS "INSERT INTO";
-- INSERT INTO `label`
-- ( `name`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Individual'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'label' AS "INSERT INTO";
-- INSERT INTO `label`
-- ( `name`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Basic'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'label' AS "INSERT INTO";
-- INSERT INTO `label`
-- ( `name`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Mortgage'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'label' AS "INSERT INTO";
-- INSERT INTO `label`
-- ( `name`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Description'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'label' AS "INSERT INTO";
-- INSERT INTO `label`
-- ( `name`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Amount'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());
-- 
-- SELECT 'label' AS "INSERT INTO";
-- INSERT INTO `label`
-- ( `name`
-- , `created_by`
-- , `creation_date`
-- , `last_updated_by`
-- , `last_update_date`)
-- VALUES
-- ( 'Notes'
-- , 1, UTC_TIMESTAMP(), 1, UTC_TIMESTAMP());

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE asset table.
-- ------------------------------------------------------------------
SELECT 'asset' AS "DROP TABLE";
DROP TABLE IF EXISTS `asset`;

SELECT 'asset' AS "CREATE TABLE";
CREATE TABLE `asset`
( `id`               INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, `name`             INT UNSIGNED NOT NULL
, `value`            INT UNSIGNED NOT NULL
, `notes`            VARCHAR(200)
, `type`             VARCHAR(200) NOT NULL
, `whatif`           TINYINT(1)   NOT NULL    COMMENT '0=Actual, 1=What-If'
, `created_by`       INT UNSIGNED NOT NULL
, `creation_date`    TIMESTAMP    NOT NULL
, `last_updated_by`  INT UNSIGNED NOT NULL
, `last_update_date` TIMESTAMP    NOT NULL
, KEY asset_fk1 (`created_by`)
, CONSTRAINT asset_fk1 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
, KEY asset_fk2 (`last_updated_by`)
, CONSTRAINT asset_fk2 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE user_asset table.
-- ------------------------------------------------------------------
-- SELECT 'user_asset' AS "DROP TABLE";
-- DROP TABLE IF EXISTS `user_asset`;
--
-- SELECT 'user_asset' AS "CREATE TABLE";
-- CREATE TABLE `user_asset`
-- ( `user_id`          INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
-- , `asset_id`         INT UNSIGNED NOT NULL
-- , `created_by`       INT UNSIGNED NOT NULL
-- , `creation_date`    TIMESTAMP    NOT NULL
-- , `last_updated_by`  INT UNSIGNED NOT NULL
-- , `last_update_date` TIMESTAMP    NOT NULL
-- , KEY user_asset_fk1 (`user_id`)
-- , CONSTRAINT user_asset_fk1 FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
-- , KEY user_asset_fk2 (`asset_id`)
-- , CONSTRAINT user_asset_fk2 FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`)
-- , KEY user_asset_fk3 (`created_by`)
-- , CONSTRAINT user_asset_fk3 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
-- , KEY user_asset_fk4 (`last_updated_by`)
-- , CONSTRAINT user_asset_fk4 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
-- ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE group_asset table.
-- ------------------------------------------------------------------
SELECT 'group_asset' AS "DROP TABLE";
DROP TABLE IF EXISTS `group_asset`;

SELECT 'group_asset' AS "CREATE TABLE";
CREATE TABLE `group_asset`
( `group_id`         INT UNSIGNED PRIMARY KEY AUTO_INCREMENT
, `asset_id`         INT UNSIGNED NOT NULL
, `created_by`       INT UNSIGNED NOT NULL
, `creation_date`    TIMESTAMP    NOT NULL
, `last_updated_by`  INT UNSIGNED NOT NULL
, `last_update_date` TIMESTAMP    NOT NULL
, KEY group_asset_fk1 (`group_id`)
, CONSTRAINT group_asset_fk1 FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
, KEY group_asset_fk2 (`asset_id`)
, CONSTRAINT group_asset_fk2 FOREIGN KEY (`asset_id`) REFERENCES `asset` (`id`)
, KEY group_asset_fk3 (`created_by`)
, CONSTRAINT group_asset_fk3 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
, KEY group_asset_fk4 (`last_updated_by`)
, CONSTRAINT group_asset_fk4 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE user_basic_expense table.
-- ------------------------------------------------------------------
-- SELECT 'user_basic_expense' AS "DROP TABLE";
-- DROP TABLE IF EXISTS `user_basic_expense`;
--
-- SELECT 'user_basic_expense' AS "CREATE TABLE";
-- CREATE TABLE `user_basic_expense`
-- ( `id`               INT UNSIGNED   PRIMARY KEY AUTO_INCREMENT
-- , `name`             VARCHAR(200)   NOT NULL
-- , `type`             VARCHAR(200)   NOT NULL
-- , `amount`           DECIMAL(17, 2) NOT NULL
-- , `user_id`          INT UNSIGNED   NOT NULL
-- , `notes`            VARCHAR(200)
-- , `what_if`          TINYINT(1)     NOT NULL    COMMENT '0=Actual, 1=What-If'
-- , `created_by`       INT UNSIGNED   NOT NULL
-- , `creation_date`    TIMESTAMP      NOT NULL
-- , `last_updated_by`  INT UNSIGNED   NOT NULL
-- , `last_update_date` TIMESTAMP      NOT NULL
-- , KEY user_basic_expense_fk1 (`user_id`)
-- , CONSTRAINT user_basic_expense_fk1 FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
-- , KEY user_basic_expense_fk2 (`created_by`)
-- , CONSTRAINT user_basic_expense_fk2 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
-- , KEY user_basic_expense_fk3 (`last_updated_by`)
-- , CONSTRAINT user_basic_expense_fk3 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
-- ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE group_basic_expense table.
-- ------------------------------------------------------------------
SELECT 'group_basic_expense' AS "DROP TABLE";
DROP TABLE IF EXISTS `group_basic_expense`;

SELECT 'group_basic_expense' AS "CREATE TABLE";
CREATE TABLE `group_basic_expense`
( `id`               INT UNSIGNED   PRIMARY KEY AUTO_INCREMENT
, `name`             VARCHAR(200)   NOT NULL
, `type`             VARCHAR(200)   NOT NULL
, `amount`           DECIMAL(17, 2) NOT NULL
, `group_id`         INT UNSIGNED   NOT NULL
, `notes`            VARCHAR(200)
, `what_if`          TINYINT(1)     NOT NULL    COMMENT '0=Actual, 1=What-If'
, `created_by`       INT UNSIGNED   NOT NULL
, `creation_date`    TIMESTAMP      NOT NULL
, `last_updated_by`  INT UNSIGNED   NOT NULL
, `last_update_date` TIMESTAMP      NOT NULL
, KEY group_basic_expense_fk1 (`group_id`)
, CONSTRAINT group_basic_expense_fk1 FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
, KEY group_basic_expense_fk2 (`created_by`)
, CONSTRAINT group_basic_expense_fk2 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
, KEY group_basic_expense_fk3 (`last_updated_by`)
, CONSTRAINT group_basic_expense_fk3 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE user_basic_income table.
-- ------------------------------------------------------------------
-- SELECT 'user_basic_income' AS "DROP TABLE";
-- DROP TABLE IF EXISTS `user_basic_income`;
--
-- SELECT 'user_basic_income' AS "CREATE TABLE";
-- CREATE TABLE `user_basic_income`
-- ( `id`               INT UNSIGNED   PRIMARY KEY AUTO_INCREMENT
-- , `name`             VARCHAR(200)   NOT NULL
-- , `type`             VARCHAR(200)   NOT NULL
-- , `amount`           DECIMAL(17, 2) NOT NULL
-- , `user_id`          INT UNSIGNED   NOT NULL
-- , `notes`            VARCHAR(200)
-- , `what_if`          TINYINT(1)     NOT NULL    COMMENT '0=Actual, 1=What-If'
-- , `created_by`       INT UNSIGNED   NOT NULL
-- , `creation_date`    TIMESTAMP      NOT NULL
-- , `last_updated_by`  INT UNSIGNED   NOT NULL
-- , `last_update_date` TIMESTAMP      NOT NULL
-- , KEY user_basic_income_fk1 (`user_id`)
-- , CONSTRAINT user_basic_income_fk1 FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
-- , KEY user_basic_income_fk2 (`created_by`)
-- , CONSTRAINT user_basic_income_fk2 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
-- , KEY user_basic_income_fk3 (`last_updated_by`)
-- , CONSTRAINT user_basic_income_fk3 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
-- ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- ------------------------------------------------------------------
-- Conditionally DROP and CREATE group_basic_income table.
-- ------------------------------------------------------------------
SELECT 'group_basic_income' AS "DROP TABLE";
DROP TABLE IF EXISTS `group_basic_income`;

SELECT 'group_basic_income' AS "CREATE TABLE";
CREATE TABLE `group_basic_income`
( `id`               INT UNSIGNED   PRIMARY KEY AUTO_INCREMENT
, `name`             VARCHAR(200)   NOT NULL
, `type`             VARCHAR(200)   NOT NULL
, `amount`           DECIMAL(17, 2) NOT NULL
, `group_id`         INT UNSIGNED   NOT NULL
, `notes`            VARCHAR(200)
, `what_if`          TINYINT(1)     NOT NULL    COMMENT '0=Actual, 1=What-If'
, `created_by`       INT UNSIGNED   NOT NULL
, `creation_date`    TIMESTAMP      NOT NULL
, `last_updated_by`  INT UNSIGNED   NOT NULL
, `last_update_date` TIMESTAMP      NOT NULL
, KEY group_basic_income_fk1 (`group_id`)
, CONSTRAINT group_basic_income_fk1 FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
, KEY group_basic_income_fk2 (`created_by`)
, CONSTRAINT group_basic_income_fk2 FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
, KEY group_basic_income_fk3 (`last_updated_by`)
, CONSTRAINT group_basic_income_fk3 FOREIGN KEY (`last_updated_by`) REFERENCES `user` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

-- Turn foreign keys back on
SET FOREIGN_KEY_CHECKS = 1;
