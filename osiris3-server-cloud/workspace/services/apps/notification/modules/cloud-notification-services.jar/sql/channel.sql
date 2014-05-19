[findChannel]
SELECT * FROM channel WHERE objid=$P{objid} 

[getChannels]
SELECT * FROM channel WHERE state='ACTIVE' 

[getDisabledChannels]
SELECT c.* 
FROM channel_active a 
	INNER JOIN channel c ON a.objid=c.objid 
WHERE NOT (c.state='ACTIVE') 

[getNewChannels]
SELECT c.* 
FROM channel c 
	LEFT JOIN channel_active a ON c.objid=a.objid 
WHERE 
	c.state='ACTIVE' AND a.objid IS NULL  

[removeActiveChannels]
DELETE FROM channel_active WHERE 1=1 
