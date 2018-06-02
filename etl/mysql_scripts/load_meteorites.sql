use TPDW;

Drop Table meteorites;
CREATE TABLE meteorites(
id INT(6) PRIMARY KEY,
name VARCHAR(50),
mid VARCHAR(50),
continent VARCHAR(50),
country VARCHAR(50),
nametype VARCHAR(50),
recclass VARCHAR(50),
mass VARCHAR(50),
fall VARCHAR(50),
year VARCHAR(50),
reclat VARCHAR(50),
reclong VARCHAR(50),
GeoLocation VARCHAR(50)
);

LOAD DATA LOCAL INFILE '/home/gilmar/Dropbox/10_periodo/DataWarehouse/tp/etl/conversao/outputs/output_meteorites_ok.csv' INTO TABLE meteorites FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES;
select * from meteorites;

use TPDW;
select * from FatoFelicidade;
alter table FatoFelicidade add column numeroMeteoros int; 
