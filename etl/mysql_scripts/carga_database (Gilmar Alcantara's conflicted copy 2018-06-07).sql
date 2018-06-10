use TPDW;

-- localizacao
set @rownum := 0;
insert into DimLocalizacao (continente, pais, idLocalizacao)  
(select distinct continent, country, @rownum := @rownum + 1 as idLocalizacao from meteorites);
select * from DimLocalizacao;

-- eclipse solar
select * from DimEclipse;
insert into DimEclipse (idEclipse, tipo)  
select distinct id, 0 from eclipse_solar;

-- eclipse lunar
select count(*) from eclipse_lunar;
update  eclipse_lunar 
set id = id + 13000;

select * from eclipse_lunar;
select * from DimEclipse where tipo = 1;
insert into DimEclipse (idEclipse, tipo)  
select distinct id, 1 from eclipse_lunar;

-- Fato

select id, country from eclipse_lunar
union all
select id, country from eclipse_solar
;
-- set @rownum := 0;

alter table FatoFelicidade drop foreign key fk_Fato_DimTempo;

select * from FatoFelicidade;
insert into FatoFelicidade  (
	idLocalizacao,
    idEclipse,
	familia, 
	expectativaVida, 
    liberdade, 
    generorisade,
    confiancaGoverno, 
    indiceDeFelicidade,
	numeroMeteoros
)
select
	distinct idLocalizacao,
    e.id as idEclipse,
	Family as familia, 
	HealthLifeExpectancy as expectativaVida, 
    Freedom as liberdade, 
    Generosity as generorisade,
    TrustGovernmentCorruption as confiancaGoverno, 
    HappinessScore as indiceDeFelicidade,
	numeroMeteoros
from reports as r join DimLocalizacao as dl
on r.country = dl.pais 
join (
select id, country from eclipse_solar
union all
select id, country from eclipse_lunar
) as e
on r.country = e.country
join (
select count(*) as numeroMeteoros, country from meteorites group by country
) as m
on r.country = m.country
;

-- ---- --- -- -- 
select * from meteorites;
select count(*) as meteoros, country from meteorites group by country;
select count(*) as eclipse_solar, country from eclipse_solar group by country;
select count(*) as eclipse_lunar, country from eclipse_lunar group by country;

