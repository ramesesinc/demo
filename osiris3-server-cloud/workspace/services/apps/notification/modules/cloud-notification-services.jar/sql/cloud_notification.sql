[getList]
SELECT * FROM cloud_notification WHERE groupid=$P{groupid} ORDER BY dtfiled 

[getAttachments]
SELECT * FROM cloud_notification_attachment 
WHERE parentid=${objid} 
ORDER BY indexno 

[getPendingMessages]
SELECT * FROM cloud_notification_pending ORDER BY dtfiled 

[reschedulePending]
UPDATE cloud_notification_pending SET 
	dtretry=$P{dtretry} 
WHERE 
	objid=$P{objid} 

[removePending]
DELETE FROM cloud_notification_pending WHERE objid=$P{objid} 

[removeFailed]
DELETE FROM cloud_notification_failed WHERE refid=$P{refid} 
