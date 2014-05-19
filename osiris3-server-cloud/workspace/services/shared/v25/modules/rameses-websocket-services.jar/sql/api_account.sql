[findKey]
SELECT t.*, (IFNULL(dtexpiry,NOW()) < NOW()) AS expired 
FROM api_account_key t 
WHERE t.accountid=$P{accountid} AND t.apikey=$P{apikey} 

[getChannels] 
SELECT * FROM api_account_channel WHERE accountid=$P{accountid} 

[findChannel] 
SELECT t.* 
FROM api_account_channel t 
WHERE t.accountid=$P{accountid} AND 
	t.channel=$P{channel} 

[findChannelGroup] 
SELECT t.* 
FROM api_account_channel t 
WHERE t.accountid=$P{accountid} AND 
	t.channel=$P{channel} AND 
	t.group=$P{group} 

[getActiveChannels]
SELECT DISTINCT c.channel 
FROM api_account_channel c 
	INNER JOIN api_account a ON c.accountid=a.name 
WHERE c.state=1 AND a.state=1 
