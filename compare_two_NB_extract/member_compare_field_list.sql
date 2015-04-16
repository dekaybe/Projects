\u srgp
/*
omits =
'expires_on,membership_status,membership_type,mobile_number,phone_number,precinct_name,started_at,tag_list'.split
(
*/

DROP TABLE IF EXISTS srgp_member_compare_field
;

CREATE TABLE srgp_member_compare_field
    ( smcf_id                INTEGER         NOT NULL auto_increment
    , smcf_field             VARCHAR(100)
	, smcf_alias             VARCHAR(100)
    , PRIMARY KEY (smcf_id)
     )   
     ENGINE=InnoDB
     CHARACTER SET=utf8
     COLLATE=utf8_unicode_ci
     COMMENT="Holds the list of fields that 2 Nationbuilder member files are compared on."
;

INSERT INTO srgp_member_compare_field (smcf_field, smcf_alias) VALUES ("nbwe_address_address1","address_address1");
INSERT INTO srgp_member_compare_field (smcf_field, smcf_alias) VALUES ("nbwe_address_address2","address_address2");
INSERT INTO srgp_member_compare_field (smcf_field, smcf_alias) VALUES ("nbwe_address_address3","address_address3");
INSERT INTO srgp_member_compare_field (smcf_field, smcf_alias) VALUES ("nbwe_address_city","address_city");
INSERT INTO srgp_member_compare_field (smcf_field, smcf_alias) VALUES ("nbwe_address_country_code","address_country_code");
INSERT INTO srgp_member_compare_field (smcf_field, smcf_alias) VALUES ("nbwe_address_zip","address_zip");
INSERT INTO srgp_member_compare_field (smcf_field, smcf_alias) VALUES ("nbwe_first_name","first_name");
INSERT INTO srgp_member_compare_field (smcf_field, smcf_alias) VALUES ("nbwe_last_name","last_name");
-- INSERT INTO srgp_member_compare_field (su_field) VALUES ("nbwe_email_opt_in");
-- INSERT INTO srgp_member_compare_field (su_field) VALUES ("nbwe_email1");
-- INSERT INTO srgp_member_compare_field (su_field) VALUES ("nbwe_mobile_number");
-- INSERT INTO srgp_member_compare_field (su_field) VALUES ("nbwe_phone_number");

\q

