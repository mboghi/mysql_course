update dev.studentexamen
set 
	Nota = IF(Nota + 2 < 10, Nota + 2, Nota),
    Absolvit = Nota > 6;

update dev.student
set 
	Varsta = TIMESTAMPDIFF(YEAR,STR_TO_DATE(CONCAT('19',SUBSTRING(CNP,2,6)),'%Y%m%d'),SYSDATE()),
	DataNastere = STR_TO_DATE(CONCAT('19',SUBSTRING(CNP,2,6)),'%Y%m%d');