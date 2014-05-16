[getList]
SELECT e.objid, e.entityno, e.name, e.address, e.type 
FROM entity e 
WHERE e.entityname LIKE $P{searchtext}  
ORDER BY e.entityname 

[getLookup]
SELECT e.objid, e.entityno, e.name, e.address, e.type 
FROM entity e 
WHERE e.entityname LIKE $P{searchtext} 
${filter}
ORDER BY e.entityname 

[findPhoto] 
SELECT ep.* 
FROM entityindividual_physical eip 
	INNER JOIN entity_photo ep ON eip.photo_objid=ep.objid  
WHERE eip.objid=$P{objid}  

[findFingerprint] 
SELECT ep.* 
FROM entityindividual_physical eip 
	INNER JOIN entity_fingerprint ep ON eip.fingerprint_objid=ep.objid  
WHERE eip.objid=$P{objid}  
