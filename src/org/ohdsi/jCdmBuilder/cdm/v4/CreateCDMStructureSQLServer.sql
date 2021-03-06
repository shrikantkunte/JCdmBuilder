CREATE TABLE CONCEPT (
	CONCEPT_ID INT NOT NULL,
	CONCEPT_NAME VARCHAR(256) NOT NULL,
	CONCEPT_LEVEL INT NULL,
	CONCEPT_CLASS VARCHAR(60) NOT NULL,
	VOCABULARY_ID INT NOT NULL,
	CONCEPT_CODE VARCHAR(40) NOT NULL,
	VALID_START_DATE DATE NOT NULL,
	VALID_END_DATE DATE NOT NULL,
	INVALID_REASON CHAR(1) NULL,
	PRIMARY KEY (CONCEPT_ID)
);

CREATE TABLE CONCEPT_ANCESTOR (
	ANCESTOR_CONCEPT_ID INT NOT NULL,
	DESCENDANT_CONCEPT_ID INT NOT NULL,
	MIN_LEVELS_OF_SEPARATION INT NULL,
	MAX_LEVELS_OF_SEPARATION INT NULL,
	PRIMARY KEY (ANCESTOR_CONCEPT_ID,DESCENDANT_CONCEPT_ID)
);

CREATE TABLE CONCEPT_RELATIONSHIP (
	CONCEPT_ID_1 INT NOT NULL,
	CONCEPT_ID_2 INT NOT NULL,
	RELATIONSHIP_ID INT NOT NULL,
	VALID_START_DATE DATE NOT NULL,
	VALID_END_DATE DATE NOT NULL,
	INVALID_REASON CHAR(1) NULL,
	PRIMARY KEY (CONCEPT_ID_1,CONCEPT_ID_2,RELATIONSHIP_ID)
);

CREATE TABLE CONCEPT_SYNONYM (
	CONCEPT_SYNONYM_ID INT NOT NULL,
	CONCEPT_ID INT NOT NULL,
	CONCEPT_SYNONYM_NAME VARCHAR(1000) NOT NULL,
	PRIMARY KEY (CONCEPT_SYNONYM_ID)
);

CREATE TABLE DRUG_STRENGTH (
	DRUG_CONCEPT_ID INT NOT NULL,
	INGREDIENT_CONCEPT_ID INT NOT NULL,
	AMOUNT_VALUE FLOAT NULL,
	AMOUNT_UNIT VARCHAR(60) NULL,
	CONCENTRATION_VALUE FLOAT NULL,
	CONCENTRATION_ENUM_UNIT VARCHAR(60) NULL,
	CONCENTRATION_DENOM_UNIT VARCHAR(60) NULL,
	VALID_START_DATE DATE NOT NULL,
	VALID_END_DATE DATE NOT NULL,
	INVALID_REASON CHAR(1) NULL
);

CREATE TABLE RELATIONSHIP (
	RELATIONSHIP_ID INT NOT NULL,
	RELATIONSHIP_NAME VARCHAR(256) NOT NULL,
	IS_HIERARCHICAL CHAR(1) NOT NULL,
	DEFINES_ANCESTRY CHAR(1) NOT NULL,
	REVERSE_RELATIONSHIP INT NULL,
	PRIMARY KEY (RELATIONSHIP_ID)
);

CREATE TABLE SOURCE_TO_CONCEPT_MAP (
	SOURCE_TO_CONCEPT_MAP_ID INT NOT NULL,
	SOURCE_CODE VARCHAR(40) NOT NULL,
	SOURCE_VOCABULARY_ID INT NOT NULL,
	SOURCE_CODE_DESCRIPTION VARCHAR(256) NULL,
	TARGET_CONCEPT_ID INT NOT NULL,
	TARGET_VOCABULARY_ID INT NOT NULL,
	MAPPING_TYPE VARCHAR(20) NULL,
	PRIMARY_MAP CHAR(1) NULL,
	VALID_START_DATE DATE NOT NULL,
	VALID_END_DATE DATE NOT NULL,
	INVALID_REASON CHAR(1) NULL,
	PRIMARY KEY (SOURCE_TO_CONCEPT_MAP_ID)
);

CREATE TABLE VOCABULARY (
	VOCABULARY_ID INT NOT NULL,
	VOCABULARY_NAME VARCHAR(256) NOT NULL,
	PRIMARY KEY (VOCABULARY_ID)
);

CREATE TABLE CARE_SITE (
	CARE_SITE_ID INT NOT NULL,
	LOCATION_ID INT NULL,
	ORGANIZATION_ID INT NULL,
	PLACE_OF_SERVICE_CONCEPT_ID INT NULL,
	CARE_SITE_SOURCE_VALUE VARCHAR(50) NULL,
	PLACE_OF_SERVICE_SOURCE_VALUE VARCHAR(50) NULL,
	PRIMARY KEY (CARE_SITE_ID)
);

CREATE TABLE COHORT (
	COHORT_ID INT NOT NULL,
	COHORT_CONCEPT_ID INT NOT NULL,
	COHORT_START_DATE DATE NOT NULL,
	COHORT_END_DATE DATE NULL,
	SUBJECT_ID BIGINT NOT NULL,
	STOP_REASON VARCHAR(20) NULL
);

CREATE TABLE CONDITION_ERA (
	CONDITION_ERA_ID BIGINT NOT NULL,
	PERSON_ID BIGINT NOT NULL,
	CONDITION_CONCEPT_ID INT NOT NULL,
	CONDITION_ERA_START_DATE DATE NOT NULL,
	CONDITION_ERA_END_DATE DATE NOT NULL,
	CONDITION_TYPE_CONCEPT_ID INT NOT NULL,
	CONDITION_OCCURRENCE_COUNT INT NULL
);

CREATE TABLE CONDITION_OCCURRENCE (
	CONDITION_OCCURRENCE_ID BIGINT NOT NULL,
	PERSON_ID BIGINT NOT NULL,
	CONDITION_CONCEPT_ID INT NOT NULL,
	CONDITION_START_DATE DATE NOT NULL,
	CONDITION_END_DATE DATE NULL,
	CONDITION_TYPE_CONCEPT_ID INT NOT NULL,
	STOP_REASON VARCHAR(20) NULL,
	ASSOCIATED_PROVIDER_ID INT NULL,
	VISIT_OCCURRENCE_ID BIGINT NULL,
	CONDITION_SOURCE_VALUE VARCHAR(50) NULL
);

CREATE TABLE DEATH (
	PERSON_ID BIGINT NOT NULL,
	DEATH_DATE DATE NOT NULL,
	DEATH_TYPE_CONCEPT_ID INT NOT NULL,
	CAUSE_OF_DEATH_CONCEPT_ID INT NULL,
	CAUSE_OF_DEATH_SOURCE_VALUE VARCHAR(50) NULL
);


CREATE TABLE DRUG_COST (
	DRUG_COST_ID BIGINT NOT NULL,
	DRUG_EXPOSURE_ID BIGINT NOT NULL,
	PAID_COPAY NUMERIC NULL,
	PAID_COINSURANCE NUMERIC NULL,
	PAID_TOWARD_DEDUCTIBLE NUMERIC NULL,
	PAID_BY_PAYER NUMERIC NULL,
	PAID_BY_COORDINATION_BENEFITS NUMERIC NULL,
	TOTAL_OUT_OF_POCKET NUMERIC NULL,
	TOTAL_PAID NUMERIC NULL,
	INGREDIENT_COST NUMERIC NULL,
	DISPENSING_FEE NUMERIC NULL,
	AVERAGE_WHOLESALE_PRICE NUMERIC NULL,
	PAYER_PLAN_PERIOD_ID INT NULL,
	PRIMARY KEY (DRUG_EXPOSURE_ID)
);

CREATE TABLE DRUG_ERA (
	DRUG_ERA_ID BIGINT NOT NULL,
	PERSON_ID BIGINT NOT NULL,
	DRUG_ERA_START_DATE DATE NOT NULL,
	DRUG_ERA_END_DATE DATE NOT NULL,
	DRUG_TYPE_CONCEPT_ID INT NOT NULL,
	DRUG_CONCEPT_ID INT NULL,
	DRUG_EXPOSURE_COUNT INT NOT NULL
);

CREATE TABLE DRUG_EXPOSURE (
	DRUG_EXPOSURE_ID BIGINT NOT NULL,
	PERSON_ID BIGINT NOT NULL,
	DRUG_CONCEPT_ID INT NOT NULL,
	DRUG_EXPOSURE_START_DATE DATE NOT NULL,
	DRUG_EXPOSURE_END_DATE DATE NULL,
	DRUG_TYPE_CONCEPT_ID INT NOT NULL,
	STOP_REASON VARCHAR(20) NULL,
	REFILLS INT NULL,
	QUANTITY INT NULL,
	DAYS_SUPPLY INT NULL,
	SIG VARCHAR(500) NULL,
	PRESCRIBING_PROVIDER_ID INT NULL,
	VISIT_OCCURRENCE_ID BIGINT NULL,
	RELEVANT_CONDITION_CONCEPT_ID INT NULL,
	DRUG_SOURCE_VALUE VARCHAR(50) NULL,
	PRIMARY KEY (DRUG_EXPOSURE_ID)
);

CREATE TABLE LOCATION (
	LOCATION_ID INT NOT NULL,
	ADDRESS_1 VARCHAR(50) NULL,
	ADDRESS_2 VARCHAR(50) NULL,
	CITY VARCHAR(50) NULL,
	STATE CHAR(2) NULL,
	ZIP VARCHAR(9) NULL,
	COUNTY VARCHAR(20) NULL,
	LOCATION_SOURCE_VALUE VARCHAR(50) NULL,
	PRIMARY KEY (LOCATION_ID)
);

CREATE TABLE OBSERVATION (
	OBSERVATION_ID BIGINT NOT NULL,
	PERSON_ID BIGINT NOT NULL,
	OBSERVATION_CONCEPT_ID BIGINT NOT NULL,
	OBSERVATION_TYPE_CONCEPT_ID INT NOT NULL,
	OBSERVATION_DATE DATE NOT NULL,
	OBSERVATION_TIME TIME NULL,
	VALUE_AS_NUMBER NUMERIC NULL,
	VALUE_AS_STRING VARCHAR(256) NULL,
	VALUE_AS_CONCEPT_ID INT NULL,
	UNIT_CONCEPT_ID BIGINT NULL,
	RANGE_LOW FLOAT NULL,
	RANGE_HIGH FLOAT NULL,
	ASSOCIATED_PROVIDER_ID INT NULL,
	VISIT_OCCURRENCE_ID BIGINT NULL,
	OBSERVATION_SOURCE_VALUE VARCHAR(256) NULL,
	UNIT_SOURCE_VALUE VARCHAR(256) NULL,
	RELEVANT_CONDITION_CONCEPT_ID INT NULL
);

CREATE TABLE OBSERVATION_PERIOD (
	OBSERVATION_PERIOD_ID BIGINT NOT NULL,
	PERSON_ID BIGINT NOT NULL,
	OBSERVATION_PERIOD_START_DATE DATE NOT NULL,
	OBSERVATION_PERIOD_END_DATE DATE NOT NULL
);


CREATE TABLE ORGANIZATION (
	ORGANIZATION_ID INT NOT NULL,
	PLACE_OF_SERVICE_CONCEPT_ID INT NULL,
	LOCATION_ID INT NULL,
	ORGANIZATION_SOURCE_VALUE VARCHAR(50) NULL,
	PLACE_OF_SERVICE_SOURCE_VALUE VARCHAR(50) NULL,
	PRIMARY KEY (ORGANIZATION_ID)
);

CREATE TABLE PAYER_PLAN_PERIOD (
	PAYER_PLAN_PERIOD_ID BIGINT NOT NULL,
	PERSON_ID BIGINT NOT NULL,
	PAYER_PLAN_PERIOD_START_DATE DATE NOT NULL,
	PAYER_PLAN_PERIOD_END_DATE DATE NOT NULL,
	PAYER_SOURCE_VALUE VARCHAR(50) NULL,
	PLAN_SOURCE_VALUE VARCHAR(50) NULL,
	FAMILY_SOURCE_VALUE VARCHAR(50) NULL
);

CREATE TABLE PERSON (
	PERSON_ID BIGINT NOT NULL,
	GENDER_CONCEPT_ID INT NOT NULL,
	YEAR_OF_BIRTH INT NOT NULL,
	MONTH_OF_BIRTH INT NULL,
	DAY_OF_BIRTH INT NULL,
	RACE_CONCEPT_ID INT NULL,
	ETHNICITY_CONCEPT_ID INT NULL,
	LOCATION_ID INT NULL,
	PROVIDER_ID INT NULL,
	CARE_SITE_ID INT NULL,
	PERSON_SOURCE_VALUE VARCHAR(50) NULL,
	GENDER_SOURCE_VALUE VARCHAR(50) NULL,
	RACE_SOURCE_VALUE VARCHAR(50) NULL,
	ETHNICITY_SOURCE_VALUE VARCHAR(50) NULL,
	PRIMARY KEY (PERSON_ID)
);

CREATE TABLE PROCEDURE_COST (
	PROCEDURE_COST_ID BIGINT NOT NULL,
	PROCEDURE_OCCURRENCE_ID BIGINT NOT NULL,
	PAID_COPAY NUMERIC NULL,
	PAID_COINSURANCE NUMERIC NULL,
	PAID_TOWARD_DEDUCTIBLE NUMERIC NULL,
	PAID_BY_PAYER NUMERIC NULL,
	PAID_BY_COORDINATION_BENEFITS NUMERIC NULL,
	TOTAL_OUT_OF_POCKET NUMERIC NULL,
	TOTAL_PAID NUMERIC NULL,
	DISEASE_CLASS_CONCEPT_ID INT NULL,
	REVENUE_CODE_CONCEPT_ID INT NULL,
	PAYER_PLAN_PERIOD_ID BIGINT NULL,
	DISEASE_CLASS_SOURCE_VALUE VARCHAR(50) NULL,
	REVENUE_CODE_SOURCE_VALUE VARCHAR(50) NULL
);

CREATE TABLE PROCEDURE_OCCURRENCE (
	PROCEDURE_OCCURRENCE_ID BIGINT NOT NULL,
	PERSON_ID BIGINT NOT NULL,
	PROCEDURE_TYPE_CONCEPT_ID INT NOT NULL,
	PROCEDURE_DATE DATE NOT NULL,
	PROCEDURE_CONCEPT_ID BIGINT NOT NULL,
	ASSOCIATED_PROVIDER_ID INT NULL,
	PROCEDURE_SOURCE_VALUE VARCHAR(50) NULL,
	VISIT_OCCURRENCE_ID BIGINT NULL,
	RELEVANT_CONDITION_CONCEPT_ID INT NULL,
	PRIMARY KEY (PROCEDURE_OCCURRENCE_ID)
);

CREATE TABLE PROVIDER (
	PROVIDER_ID BIGINT NOT NULL,
	NPI VARCHAR(20) NULL,
	DEA VARCHAR(20) NULL,
	SPECIALTY_CONCEPT_ID INT NULL,
	CARE_SITE_ID INT NULL,
	PROVIDER_SOURCE_VALUE VARCHAR(50) NULL,
	SPECIALTY_SOURCE_VALUE VARCHAR(50) NULL,
	PRIMARY KEY (PROVIDER_ID)
);
CREATE TABLE VISIT_OCCURRENCE (
	VISIT_OCCURRENCE_ID BIGINT NOT NULL,
	PERSON_ID BIGINT NOT NULL,
	PLACE_OF_SERVICE_CONCEPT_ID INT NOT NULL,
	VISIT_START_DATE DATE NOT NULL,
	VISIT_END_DATE DATE NOT NULL,
	PLACE_OF_SERVICE_SOURCE_VALUE VARCHAR(50) NULL,
	CARE_SITE_ID INT NULL
);
