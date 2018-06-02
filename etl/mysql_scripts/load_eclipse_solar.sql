use TPDW;

Drop table eclipse_solar;
CREATE TABLE eclipse_solar(
id INT(6) PRIMARY KEY,
CatalogNumber VARCHAR(50),
CalendarDate VARCHAR(50),
continent VARCHAR(50),
country VARCHAR(50),
EclipseTime VARCHAR(50),
DeltaTs VARCHAR(50),
LunationNumber VARCHAR(50),
SarosNumber VARCHAR(50),
EclipseType VARCHAR(50),
Gamma VARCHAR(50),
EclipseMagnitude VARCHAR(50),
Latitude VARCHAR(50),
Longitude VARCHAR(50),
SunAltitude VARCHAR(50),
SunAzimuthPath VARCHAR(50),
Widthkm VARCHAR(50),
CentralDuration VARCHAR(50)
);

LOAD DATA LOCAL INFILE '/home/gilmar/Dropbox/10_periodo/DataWarehouse/tp/etl/conversao/outputs/output_lunar_eclipce_ok.csv' INTO TABLE eclipse_solar FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES;
select * from eclipse_solar;


