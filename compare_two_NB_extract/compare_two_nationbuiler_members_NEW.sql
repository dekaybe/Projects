\u srgp

delimiter //

DROP PROCEDURE IF EXISTS nb_updates_NEW;

CREATE PROCEDURE nb_updates_NEW()
BEGIN
--
DECLARE done                              INTEGER DEFAULT 0; -- Used to break out of loops
DECLARE v_count                           INTEGER DEFAULT 0;
DECLARE v_column_name                     varchar(64);
DECLARE v_alias_name                      varchar(64);
DECLARE v_first_name                      varchar(50);
DECLARE v_last_name                       varchar(50);
DECLARE v_old_value                       varchar(2000);
DECLARE v_new_value                       varchar(2000);
DECLARE v_nbwe_nationbuilder_id           int(11);
DECLARE v_nbwe_civicrm_id                 varchar(50);
--
--
DECLARE cursor_nationbuilder_new CURSOR FOR
 (
  SELECT   nbwe_nationbuilder_id
  FROM     srgp_NB_weekly_export1
--  WHERE    nbwe_nationbuilder_id IN (43306)
  ORDER BY nbwe_nationbuilder_id
  )
;
--
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
--
SELECT "nbwe_nationbuilder_id,nbwe_twitter_id,nbwe_twitter_login,nbwe_facebook_username,nbwe_meetup_id,nbwe_civicrm_id,nbwe_external_id,nbwe_salesforce_id,nbwe_prefix,nbwe_first_name,nbwe_middle_name,nbwe_last_name,nbwe_suffix,nbwe_full_name,nbwe_legal_name,nbwe_employer,nbwe_occupation,nbwe_sex,nbwe_party,nbwe_religion,nbwe_church,nbwe_ethnicity,nbwe_marital_status,nbwe_website,nbwe_language,nbwe_is_deceased,nbwe_born_at,nbwe_email1,nbwe_email2,nbwe_email3,nbwe_email4,nbwe_email_opt_in,nbwe_phone_number,nbwe_work_phone_number,nbwe_do_not_call,nbwe_do_not_contact,nbwe_federal_donotcall,nbwe_mobile_number,nbwe_mobile_opt_in,nbwe_is_mobile_bad,nbwe_fax_number,nbwe_demo,nbwe_support_level,nbwe_inferred_support_level,nbwe_priority_level,nbwe_availability,nbwe_note,nbwe_parent_id,nbwe_point_person_name_or_email,nbwe_recruiter_id,nbwe_recruiter_name_or_email,nbwe_tag_list,nbwe_created_at,nbwe_unsubscribed_at,nbwe_is_supporter,nbwe_is_prospect,nbwe_signup_type,nbwe_is_volunteer,nbwe_is_donor,nbwe_is_fundraiser,nbwe_is_ignore_donation_limits,nbwe_first_donated_at,nbwe_last_donated_at,nbwe_donations_count,nbwe_donations_amount,nbwe_donations_amount_in_cents,nbwe_donations_raised_count,nbwe_donations_raised_amount,nbwe_donations_raised_amount_in_cents,nbwe_donations_pledged_amount,nbwe_donations_pledged_amount_in_cents,nbwe_donations_count_this_cycle,nbwe_donations_amount_this_cycle,nbwe_donations_amount_this_cycle_in_cents,nbwe_donations_raised_count_this_cycle,nbwe_donations_raised_amount_this_cycle,nbwe_donations_raised_amount_this_cycle_in_cents,nbwe_maximum_donation_possible_this_cycle,nbwe_maximum_donation_possible_this_cycle_in_cents,nbwe_membership_names,nbwe_nbec_guid,nbwe_pf_strat_id,nbwe_state_file_id,nbwe_county_file_id,nbwe_dw_id,nbwe_van_id,nbwe_ngp_id,nbwe_rnc_id,nbwe_rnc_regid,nbwe_datatrust_id,nbwe_previous_party,nbwe_inferred_party,nbwe_supranational_district,nbwe_federal_district,nbwe_state_upper_district,nbwe_state_lower_district,nbwe_county_district,nbwe_city_district,nbwe_city_sub_district,nbwe_village_district,nbwe_judicial_district,nbwe_school_district,nbwe_school_sub_district,nbwe_fire_district,nbwe_precinct_name,nbwe_precinct_code,nbwe_media_market_name,nbwe_support_probability_score,nbwe_turnout_probability_score,nbwe_capital_amount,nbwe_capital_amount_in_cents,nbwe_spent_capital_amount,nbwe_spent_capital_amount_in_cents,nbwe_received_capital_amount,nbwe_received_capital_amount_in_cents,nbwe_email,nbwe_email1_is_bad,nbwe_email2_is_bad,nbwe_email3_is_bad,nbwe_email4_is_bad,nbwe_primary_country_code,nbwe_primary_country,nbwe_primary_state,nbwe_primary_city,nbwe_primary_county,nbwe_primary_zip,nbwe_primary_address1,nbwe_primary_address2,nbwe_primary_address3,nbwe_primary_fips,nbwe_primary_submitted_address,nbwe_primary_geocode_accuracy,nbwe_address_country_code,nbwe_address_country,nbwe_address_state,nbwe_address_city,nbwe_address_county,nbwe_address_zip,nbwe_address_address1,nbwe_address_address2,nbwe_address_address3,nbwe_address_fips,nbwe_address_submitted_address,nbwe_address_geocode_accuracy,nbwe_work_country_code,nbwe_work_country,nbwe_work_state,nbwe_work_city,nbwe_work_county,nbwe_work_zip,nbwe_work_address1,nbwe_work_address2,nbwe_work_address3,nbwe_work_fips,nbwe_work_submitted_address,nbwe_work_geocode_accuracy,nbwe_mailing_country_code,nbwe_mailing_country,nbwe_mailing_state,nbwe_mailing_city,nbwe_mailing_county,nbwe_mailing_zip,nbwe_mailing_address1,nbwe_mailing_address2,nbwe_mailing_address3,nbwe_mailing_fips,nbwe_mailing_submitted_address,nbwe_mailing_geocode_accuracy,nbwe_mailing_street_number,nbwe_mailing_street_prefix,nbwe_mailing_street_name,nbwe_mailing_street_type,nbwe_mailing_street_suffix,nbwe_mailing_unit_number,nbwe_mailing_zip5,nbwe_mailing_zip4,nbwe_mailing_sort_sequence,nbwe_mailing_delivery_point,nbwe_mailing_lot,nbwe_mailing_carrier_route,nbwe_user_submitted_country_code,nbwe_user_submitted_country,nbwe_user_submitted_state,nbwe_user_submitted_city,nbwe_user_submitted_county,nbwe_user_submitted_zip,nbwe_user_submitted_address1,nbwe_user_submitted_address2,nbwe_user_submitted_address3,nbwe_user_submitted_fips,nbwe_user_submitted_submitted_address,nbwe_user_submitted_geocode_accuracy,nbwe_registered_country_code,nbwe_registered_country,nbwe_registered_state,nbwe_registered_city,nbwe_registered_county,nbwe_registered_zip,nbwe_registered_address1,nbwe_registered_address2,nbwe_registered_address3,nbwe_registered_fips,nbwe_registered_submitted_address,nbwe_registered_geocode_accuracy,nbwe_registered_street_number,nbwe_registered_street_prefix,nbwe_registered_street_name,nbwe_registered_street_type,nbwe_registered_street_suffix,nbwe_registered_unit_number,nbwe_registered_zip5,nbwe_registered_zip4,nbwe_registered_sort_sequence,nbwe_registered_delivery_point,nbwe_registered_lot,nbwe_registered_carrier_route,nbwe_party_member";

OPEN cursor_nationbuilder_new;
--
read_loop: LOOP
  --
  FETCH cursor_nationbuilder_new INTO v_nbwe_nationbuilder_id;
  --
  IF done THEN
    LEAVE read_loop;
  END IF;
  --
  SELECT   COUNT(nbwe_nationbuilder_id) 
  INTO     v_count
  FROM     srgp_NB_weekly_export0
  WHERE    nbwe_nationbuilder_id=v_nbwe_nationbuilder_id
  ;


  IF v_count=0 THEN
    --
    SELECT nbwe_nationbuilder_id,nbwe_twitter_id,nbwe_twitter_login,nbwe_facebook_username,nbwe_meetup_id,nbwe_civicrm_id,
	       nbwe_external_id,nbwe_salesforce_id,nbwe_prefix,nbwe_first_name,nbwe_middle_name,nbwe_last_name,nbwe_suffix,
		   nbwe_full_name,nbwe_legal_name,nbwe_employer,nbwe_occupation,nbwe_sex,nbwe_party,nbwe_religion,nbwe_church,
		   nbwe_ethnicity,nbwe_marital_status,nbwe_website,nbwe_language,nbwe_is_deceased,nbwe_born_at,nbwe_email1,nbwe_email2,
		   nbwe_email3,nbwe_email4,nbwe_email_opt_in,nbwe_phone_number,nbwe_work_phone_number,nbwe_do_not_call,nbwe_do_not_contact,
		   nbwe_federal_donotcall,nbwe_mobile_number,nbwe_mobile_opt_in,nbwe_is_mobile_bad,nbwe_fax_number,nbwe_demo,nbwe_support_level,
		   nbwe_inferred_support_level,nbwe_priority_level,nbwe_availability,nbwe_note,nbwe_parent_id,nbwe_point_person_name_or_email,
		   nbwe_recruiter_id,nbwe_recruiter_name_or_email, 
		   IF(nbwe_tag_list="","",CONCAT("\"",nbwe_tag_list,"\"")) nbwe_tag_list,
		   nbwe_created_at,nbwe_unsubscribed_at,
		   nbwe_is_supporter,nbwe_is_prospect,nbwe_signup_type,nbwe_is_volunteer,nbwe_is_donor,nbwe_is_fundraiser,
		   nbwe_is_ignore_donation_limits,nbwe_first_donated_at,nbwe_last_donated_at,nbwe_donations_count,nbwe_donations_amount,
		   nbwe_donations_amount_in_cents,nbwe_donations_raised_count,nbwe_donations_raised_amount,nbwe_donations_raised_amount_in_cents,
		   nbwe_donations_pledged_amount,nbwe_donations_pledged_amount_in_cents,nbwe_donations_count_this_cycle,nbwe_donations_amount_this_cycle,
		   nbwe_donations_amount_this_cycle_in_cents,nbwe_donations_raised_count_this_cycle,nbwe_donations_raised_amount_this_cycle,
		   nbwe_donations_raised_amount_this_cycle_in_cents,nbwe_maximum_donation_possible_this_cycle,
		   nbwe_maximum_donation_possible_this_cycle_in_cents,nbwe_membership_names,nbwe_nbec_guid,nbwe_pf_strat_id,
		   nbwe_state_file_id,nbwe_county_file_id,nbwe_dw_id,nbwe_van_id,nbwe_ngp_id,nbwe_rnc_id,nbwe_rnc_regid,nbwe_datatrust_id,
		   nbwe_previous_party,nbwe_inferred_party,nbwe_supranational_district,
		   IF(nbwe_federal_district="","",CONCAT("\"",nbwe_federal_district,"\"")) nbwe_federal_district,
		   nbwe_state_upper_district,
		   nbwe_state_lower_district,nbwe_county_district,nbwe_city_district,nbwe_city_sub_district,nbwe_village_district,nbwe_judicial_district,
		   nbwe_school_district,nbwe_school_sub_district,nbwe_fire_district,nbwe_precinct_name,nbwe_precinct_code,nbwe_media_market_name,
		   nbwe_support_probability_score,nbwe_turnout_probability_score,nbwe_capital_amount,nbwe_capital_amount_in_cents,
		   nbwe_spent_capital_amount,nbwe_spent_capital_amount_in_cents,nbwe_received_capital_amount,nbwe_received_capital_amount_in_cents,
		   nbwe_email,nbwe_email1_is_bad,nbwe_email2_is_bad,nbwe_email3_is_bad,nbwe_email4_is_bad,nbwe_primary_country_code,
		   nbwe_primary_country,nbwe_primary_state,nbwe_primary_city,nbwe_primary_county,nbwe_primary_zip,nbwe_primary_address1,
		   nbwe_primary_address2,nbwe_primary_address3,nbwe_primary_fips,
		   IF(nbwe_primary_submitted_address="","",CONCAT("\"",nbwe_primary_submitted_address,"\"")) nbwe_primary_submitted_address,
		   nbwe_primary_geocode_accuracy,
		   nbwe_address_country_code,nbwe_address_country,nbwe_address_state,nbwe_address_city,nbwe_address_county,nbwe_address_zip,
		   nbwe_address_address1,nbwe_address_address2,nbwe_address_address3,nbwe_address_fips,nbwe_address_submitted_address,
		   nbwe_address_geocode_accuracy,nbwe_work_country_code,nbwe_work_country,nbwe_work_state,nbwe_work_city,nbwe_work_county,
		   nbwe_work_zip,nbwe_work_address1,nbwe_work_address2,nbwe_work_address3,nbwe_work_fips,nbwe_work_submitted_address,
		   nbwe_work_geocode_accuracy,nbwe_mailing_country_code,nbwe_mailing_country,nbwe_mailing_state,nbwe_mailing_city,
		   nbwe_mailing_county,nbwe_mailing_zip,nbwe_mailing_address1,nbwe_mailing_address2,nbwe_mailing_address3,nbwe_mailing_fips,
		   nbwe_mailing_submitted_address,nbwe_mailing_geocode_accuracy,nbwe_mailing_street_number,nbwe_mailing_street_prefix,
		   nbwe_mailing_street_name,nbwe_mailing_street_type,nbwe_mailing_street_suffix,nbwe_mailing_unit_number,nbwe_mailing_zip5,
		   nbwe_mailing_zip4,nbwe_mailing_sort_sequence,nbwe_mailing_delivery_point,nbwe_mailing_lot,nbwe_mailing_carrier_route,
		   nbwe_user_submitted_country_code,nbwe_user_submitted_country,nbwe_user_submitted_state,nbwe_user_submitted_city,
		   nbwe_user_submitted_county,nbwe_user_submitted_zip,nbwe_user_submitted_address1,nbwe_user_submitted_address2,
		   nbwe_user_submitted_address3,nbwe_user_submitted_fips,
		   IF(nbwe_user_submitted_submitted_address="","",CONCAT("\"",nbwe_user_submitted_submitted_address,"\"")) nbwe_user_submitted_submitted_address,
		   nbwe_user_submitted_geocode_accuracy,
		   nbwe_registered_country_code,nbwe_registered_country,nbwe_registered_state,nbwe_registered_city,nbwe_registered_county,
		   nbwe_registered_zip,nbwe_registered_address1,nbwe_registered_address2,nbwe_registered_address3,nbwe_registered_fips,
		   nbwe_registered_submitted_address,nbwe_registered_geocode_accuracy,nbwe_registered_street_number,nbwe_registered_street_prefix,
		   nbwe_registered_street_name,nbwe_registered_street_type,nbwe_registered_street_suffix,nbwe_registered_unit_number,
		   nbwe_registered_zip5,nbwe_registered_zip4,nbwe_registered_sort_sequence,nbwe_registered_delivery_point,nbwe_registered_lot,
		   nbwe_registered_carrier_route,nbwe_party_member
    FROM   srgp_NB_weekly_export1
    WHERE  nbwe_nationbuilder_id=v_nbwe_nationbuilder_id
    ;
	--
  END IF;
  --
END LOOP;
--
CLOSE cursor_nationbuilder_new;
--
END//
--
delimiter ;
--
CALL nb_updates_NEW();
--
