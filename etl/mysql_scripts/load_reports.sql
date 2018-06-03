use TPDW;

Drop table reports;
CREATE TABLE reports(
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
DystopiaResidual VARCHAR(50)
);

LOAD DATA LOCAL INFILE '/home/gilmar/Dropbox/10_periodo/DataWarehouse/tp/etl/conversao/data/reports/2017.csv' INTO TABLE reports FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES;
select * from reports;


SET SQL_SAFE_UPDATES = 0;
 -- remove aspas
UPDATE `reports` 
   SET `country` = TRIM(BOTH '"' FROM `country`);

