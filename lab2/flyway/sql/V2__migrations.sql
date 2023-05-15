INSERT INTO "Students" ("ID", "Birth", "SexTypeName", "RegName", "AreaName", "TerName", "RegTypeName", "TerTypeName", "ClassProfileName", "ClassLangName")
SELECT TRIM("OUTID"), "BIRTH", TRIM("SEXTYPENAME"), TRIM("REGNAME"), TRIM("AREANAME"), TRIM("TERNAME"), TRIM("REGTYPENAME"), TRIM("TERTYPENAME"), TRIM("CLASSPROFILENAME"), TRIM("CLASSLANGNAME")
FROM "Results_ZNO";

INSERT INTO "Subjects" ("ID", "Name")
VALUES ('UML', 'Українська мова і література'),
('Ukr', 'Українська мова'),
('Hist', 'Історія України'),
('Math', 'Математика'),
('MathSt', 'Математика (завдання рівня стандарту)'),
('Phys', 'Фізика'),
('Chem', 'Хімія'),
('Bio', 'Біологія'),
('Geo', 'Географія'),
('Eng', 'Англійська мова'),
('Fr', 'Французька мова'),
('Deu', 'Німецька мова'),
('Sp', 'Іспанська мова');

INSERT INTO "Results_Of_Students" ("StudentID", "SubjectID", "Year", "Lang", "TestStatus", "UkrSubTest", "DPALevel", "Ball100", "Ball12", "Ball", "AdaptScale")
SELECT "OUTID", 
	'UML', 
	"YEAR", 
	NULL,
	"UMLTESTSTATUS", 
	NULL,
	NULL,
	"UMLBALL100", 
	"UMLBALL12", 
	"UMLBALL", 
	"UMLADAPTSCALE"
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'Ukr', 
	"YEAR", 
	NULL, 
	"UKRTESTSTATUS", 
	"UKRSUBTEST",
	NULL, 
	"UKRBALL100", 
	"UKRBALL12", 
	"UKRBALL", 
	"UKRADAPTSCALE"
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'Hist',
	"YEAR",
	"HISTLANG",
	"HISTTESTSTATUS",
	NULL,
	NULL,
	"HISTBALL100",
	"HISTBALL12",
	"HISTBALL",
	NULL
FROM "Results_ZNO"
UNION
SELECT "OUTID",
	'Math',
	"YEAR",
	"MATHLANG",
	"MATHTESTSTATUS",
	NULL,
	"MATHDPALEVEL",
	"MATHBALL100",
	"MATHBALL12",
	"MATHBALL",
	NULL
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'MathSt',
	"YEAR",
	"MATHSTLANG",
	"MATHSTTESTSTATUS",
	NULL,
	NULL,
	NULL,
	"MATHSTBALL12",
	"MATHSTBALL",
	NULL
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'Phys',
	"YEAR",
	"PHYSLANG",
	"PHYSTESTSTATUS",
	NULL,
	NULL,
	"PHYSBALL100",
	"PHYSBALL12",
	"PHYSBALL",
	NULL
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'Chem',
	"YEAR",
	"CHEMLANG",
	"CHEMTESTSTATUS",
	NULL,
	NULL,
	"CHEMBALL100",
	"CHEMBALL12",
	"CHEMBALL",
	NULL
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'Bio',
	"YEAR",
	"BIOLANG",
	"BIOTESTSTATUS",
	NULL,
	NULL,
	"BIOBALL100",
	"BIOBALL12",
	"BIOBALL",
	NULL
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'Geo',
	"YEAR",
	"GEOLANG",
	"GEOTESTSTATUS",
	NULL,
	NULL,
	"GEOBALL100",
	"GEOBALL12",
	"GEOBALL",
	NULL
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'Eng',
	"YEAR",
	NULL,
	"ENGTESTSTATUS",
	NULL,
	"ENGDPALEVEL",
	"ENGBALL100",
	"ENGBALL12",
	"ENGBALL",
	NULL
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'Fr',
	"YEAR",
	NULL,
	"FRATESTSTATUS",
	NULL,
	"FRADPALEVEL",
	"FRABALL100",
	"FRABALL12",
	"FRABALL",
	NULL
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'Deu',
	"YEAR",
	NULL,
	"DEUTESTSTATUS",
	NULL,
	"DEUDPALEVEL",
	"DEUBALL100",
	"DEUBALL12",
	"DEUBALL",
	NULL
FROM "Results_ZNO"
UNION
SELECT "OUTID", 
	'Sp',
	"YEAR",
	NULL,
	"SPATESTSTATUS",
	NULL,
	"SPADPALEVEL",
	"SPABALL100",
	"SPABALL12",
	"SPABALL",
	NULL
FROM "Results_ZNO";

INSERT INTO "Educational_Institutions" ("Name", "TypeName", "RegName", "AreaName", "TerName", "Parent")
SELECT DISTINCT "EONAME" as "Name",
	"EOTYPENAME" as "TypeName",
	"EOREGNAME" as "RegName",
	"EOAREANAME" as "AreaName",
	"EOTERNAME" as "TerName",
	"EOPARENT" as "Parent"
FROM "Results_ZNO" FULL OUTER JOIN
	(SELECT DISTINCT *
	FROM
		(
			SELECT "UMLPTNAME" as "Name",
			"UMLPTREGNAME" as "RegName",
			"UMLPTAREANAME" as "AreaName",
			"UMLPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "UKRPTNAME" as "Name",
				"UKRPTREGNAME" as "RegName",
				"UKRPTAREANAME" as "AreaName",
				"UKRPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "HISTPTNAME" as "Name",
				"HISTPTREGNAME" as "RegName",
				"HISTPTAREANAME" as "AreaName",
				"HISTPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "MATHPTNAME" as "Name",
				"MATHPTREGNAME" as "RegName",
				"MATHPTAREANAME" as "AreaName",
				"MATHPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "MATHSTPTNAME" as "Name",
				"MATHSTPTREGNAME" as "RegName",
				"MATHSTPTAREANAME" as "AreaName",
				"MATHSTPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "PHYSPTNAME" as "Name",
				"PHYSPTREGNAME" as "RegName",
				"PHYSPTAREANAME" as "AreaName",
				"PHYSPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "CHEMPTNAME" as "Name",
				"CHEMPTREGNAME" as "RegName",
				"CHEMPTAREANAME" as "AreaName",
				"CHEMPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "BIOPTNAME" as "Name",
				"BIOPTREGNAME" as "RegName",
				"BIOPTAREANAME" as "AreaName",
				"BIOPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "GEOPTNAME" as "Name",
				"GEOPTREGNAME" as "RegName",
				"GEOPTAREANAME" as "AreaName",
				"GEOPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "GEOPTNAME" as "Name",
				"GEOPTREGNAME" as "RegName",
				"GEOPTAREANAME" as "AreaName",
				"GEOPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "FRAPTNAME" as "Name",
				"FRAPTREGNAME" as "RegName",
				"FRAPTAREANAME" as "AreaName",
				"FRAPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "DEUPTNAME" as "Name",
				"DEUPTREGNAME" as "RegName",
				"DEUPTAREANAME" as "AreaName",
				"DEUPTTERNAME" as "TerName"
			FROM "Results_ZNO"
			UNION
			SELECT "SPAPTNAME" as "Name",
				"SPAPTREGNAME" as "RegName",
				"SPAPTAREANAME" as "AreaName",
				"SPAPTTERNAME" as "TerName"
			FROM "Results_ZNO"
		) as "TestLocations"
	 ) as "tmp"
	ON "Results_ZNO"."EONAME" = "tmp"."Name" AND
		"Results_ZNO"."EOREGNAME" = "tmp"."RegName" AND
		"Results_ZNO"."EOAREANAME" = "tmp"."AreaName" AND
		"Results_ZNO"."EOTERNAME" = "tmp"."TerName";
		
INSERT INTO "EI_of_Students" ("StudentID", "EIID")
SELECT "RZ"."OUTID", "EI"."ID"
FROM "Results_ZNO" AS "RZ"
JOIN "Educational_Institutions" AS "EI"
ON "RZ"."EONAME" = "EI"."Name";

INSERT INTO "ZNO_Places" ("StudentID", "SubjectID", "InsitutionID")
	SELECT "RZ"."OUTID", 'UML', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."UMLPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Ukr', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."UKRPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Hist', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."HISTPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Math', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."MATHPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'MathSt', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."MATHSTPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Phys', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."PHYSPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Chem', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."CHEMPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Bio', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."BIOPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Geo', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."GEOPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Eng', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."ENGPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Fr', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."FRAPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Deu', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."DEUPTNAME" = "EI"."Name"
	UNION
	SELECT "RZ"."OUTID", 'Sp', "EI"."ID"
	FROM "Results_ZNO" as "RZ"
	JOIN "Educational_Institutions" AS "EI"
	ON "RZ"."SPAPTNAME" = "EI"."Name";