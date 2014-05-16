[getList]
SELECT e.*, ei.gender, ei.birthdate 
FROM entity e 
	INNER JOIN entityindividual ei ON e.objid=ei.objid 
WHERE e.entityname LIKE $P{searchtext}  
ORDER BY e.entityname 

[getLookup]
SELECT e.*, ei.gender, ei.birthdate 
FROM entityindividual ei 
INNER JOIN entity e ON e.objid=ei.objid 
WHERE e.entityname LIKE $P{searchtext}  
ORDER BY e.entityname 