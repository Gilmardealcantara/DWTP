select * from FatoFelicidade;
insert into FatoFelicidade  (
	idTempo,
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
	distinct 
t.idTempo,	
idLocalizacao,
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
select id, country, CalendarDate from eclipse_solar
union all
select id, country, CalendarDate from eclipse_lunar
) as e
on (r.country = e.country and r.year = substring(e.CalendarDate,1,4))
join (
select count(*) as numeroMeteoros, country, year from meteorites group by country
) as m
on (r.country = m.country and r.year = m.year)
join DimTempo as t
on r.year = t.ano
;
