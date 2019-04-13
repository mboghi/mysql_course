select
	Nota,
    CONVERT(Nota, char) as NotaInt,
    Absolvit,
    CONVERT(Absolvit, char) as AbsolvitChar
from
	dev.studentexamen;
    
select 
	datainscriere,
    CONVERT(datainscriere, date) as datainscriere_data
from 
	student;
    
select 
	datainscriere,
    CAST(datainscriere as char(5)) as datainscriere_char
from 
	student;
    
select
	*
from
	dev.curs
where
	!(DataInceput > '2000-01-01')
    and DataSfarsit is null
    and Nume != 'BD';
    
select
	Nume,
    case Nume
    when 'Marin' then 'Marin2'
    when 'Achim' then 'Achim2'
    else 'UnNume' 
    end as NumeCase
from
	dev.profesor;

select 
	Nume,
    DataSfarsit,
	IFNULL(DataSfarsit,'2099-12-31') as DataFinal
from dev.curs;

select
	concat(Prenume, ' ',upper(Nume)) as NumeFull,
    left(Prenume,1) as InitialaPrenume,
    length(Nume) as NrCaractereNume,
    format(9.53,5) as NotaFormat,
    substr(Prenume from 2) as PrenumeFaraInitiala,
    substr(Prenume from 20) as PrenumeFaraInitialaFail,
    substring(Prenume, 2, length(Prenume) - 2) as MijlocPrenume,
    substring_index('www.doitacademy.ro', '.', 2) as SiteInceput,
    substring_index('www.doitacademy.ro', '.', -2) as SiteSfarsit,
    substring_index('www.doitacademy.ro', '.', -20) as SiteSfarsitFail,
    ltrim(' text') as LeftTrim,
    trim(' string ') as TrimDublu,
    replace(Nume,'escu','blabla') as ReplaceEscu,
    replace(Nume,'ezcu','blabla') as ReplaceEscuFail,
    position('escu' in Nume) as PositionEscu,
    position('ezcu' in Nume) as PositionEscu,
    locate('escu',Nume,6) as LocateEscuDupa6,
    locate('escu',Nume,40) as LocateEscuDupaFail,
    locate('ezcu',Nume,6) as LocateEscuDupaFail2,
    lpad(Prenume, length(prenume) + 7,'Dl/Dna ') as PrenumeCuTitlu,
    rpad(Nume,7,'escu') as EscuLaDreapta
from
	dev.student;

select
	Nota,
    Nota * 3.32456 as NrZecimale,
    Nota % 5 as RestImpLa5,
    ceiling(Nota) as NotaInt,
    power(Nota,3) as NotaPower,
    truncate(Nota * 3.32456,2) as NrZecimaleTruncate,
    round(Nota) as NotaRotunjita,
    round(Nota * 3.32456,2) as NrZecimaleRotunjit2Zecimale,
    round(Nota * 3.32456,-1) as NrZecimaleRotunjit1Zecimale,
    sign(Nota) as SemnNota
from
	dev.studentexamen;

select
	now() as Acum,
	DataOra,
    year(DataOra) as An,
    month(DataOra) as Luna,
    day(DataOra) as Zi,
    hour(DataOra) as Ora,
    minute(DataOra) as Minut,
    second(DataOra) as Secunda,
    quarter(DataOra) as Trimestru,
    last_day(DataOra) as UltimaZiDinLuna,
    week(DataOra) as NumarulSaptamanii,
    week('2020-01-01',2) as NumarulSaptamaniiMod3,
    week('2020-01-01',4) as NumarulSaptamaniiMod4,
    weekday(DataOra) as ZiuaSaptamanii,
    datediff('2019-04-01','2019-03-20') as Diferenta,
    dayname(DataOra) as NumeleZilei,
    dayofweek(DataOra) as ZiuaSaptamanii,
    dayofyear(DataOra) as ZiuaDinAn,
    monthname(DataOra) as NumeleLunii,
    str_to_date('2019.12.02','%Y.%m.%d') as FormatData,
    timestampdiff(year,'2019-01-23','2019-12-05') as DiferentaAni,
    timestampdiff(month,'2019-01-23','2019-12-05') as DiferentaLuni,
    timestampdiff(day,'2019-01-23','2019-12-05') as DiferentaZile,
    timestampdiff(hour,'2019-01-23','2019-12-05') as DiferentaOre
from
	dev.examen;
    
select
	*
from
	dev.studentexamen
where
	nota in (6.5,7.5);