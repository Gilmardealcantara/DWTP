use TPDW2;



Drop table reports_2015;
CREATE TABLE reports_2015(
Country VARCHAR(50), 
HappinessRank VARCHAR(50), 
HappinessScore VARCHAR(50), 
Whiskerhigh VARCHAR(50), 
Whiskerlow VARCHAR(50), 
EconomyPerCapita VARCHAR(50), 
Family VARCHAR(50), 
HealthLifeExpectancy VARCHAR(50), 
Freedom VARCHAR(50), 
Generosity VARCHAR(50), 
TrustGovernmentCorruption VARCHAR(50), 
DystopiaResidual VARCHAR(50),
Year Varchar(10)
);

Drop table reports_2016;
CREATE TABLE reports_2016(
Country VARCHAR(50), 
HappinessRank VARCHAR(50), 
HappinessScore VARCHAR(50), 
Whiskerhigh VARCHAR(50), 
Whiskerlow VARCHAR(50), 
EconomyPerCapita VARCHAR(50), 
Family VARCHAR(50), 
HealthLifeExpectancy VARCHAR(50), 
Freedom VARCHAR(50), 
Generosity VARCHAR(50), 
TrustGovernmentCorruption VARCHAR(50), 
DystopiaResidual VARCHAR(50),
Year Varchar(10)
);

Drop table reports_2017;
CREATE TABLE reports_2017(
Country VARCHAR(50), 
HappinessRank VARCHAR(50), 
HappinessScore VARCHAR(50), 
Whiskerhigh VARCHAR(50), 
Whiskerlow VARCHAR(50), 
EconomyPerCapita VARCHAR(50), 
Family VARCHAR(50), 
HealthLifeExpectancy VARCHAR(50), 
Freedom VARCHAR(50), 
Generosity VARCHAR(50), 
TrustGovernmentCorruption VARCHAR(50), 
DystopiaResidual VARCHAR(50),
Year Varchar(10)
);

LOAD DATA LOCAL INFILE '/home/arley/Dropbox/tp/etl/conversao/data/reports/2015.csv' 
INTO TABLE reports_2015
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'  
IGNORE 1 LINES set year="2015";
select * from reports_2015;

LOAD DATA LOCAL INFILE '/home/arley/Dropbox/tp/etl/conversao/data/reports/2016.csv' 
INTO TABLE reports_2016
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'  
IGNORE 1 LINES set year="2016";
select * from reports_2016;

LOAD DATA LOCAL INFILE '/home/arley/Dropbox/tp/etl/conversao/data/reports/2017.csv' 
INTO TABLE reports_2017
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'  
IGNORE 1 LINES set year="2017";
select * from reports_2017;




SET SQL_SAFE_UPDATES = 0;
 -- remove aspas
UPDATE `reports_2017` 
   SET `country` = TRIM(BOTH '"' FROM `country`);

SET SQL_SAFE_UPDATES = 0;
 -- remove aspas
UPDATE `reports_2016` 
   SET `country` = TRIM(BOTH '"' FROM `country`);
SET SQL_SAFE_UPDATES = 0;

-- remove aspas
UPDATE `reports_2015` 
   SET `country` = TRIM(BOTH '"' FROM `country`);



