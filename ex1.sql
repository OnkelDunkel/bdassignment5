USE stackoverflow;
DROP PROCEDURE IF EXISTS denormalizeComments;
DELIMITER $$
CREATE PROCEDURE `denormalizeComments` (in postId int(11))
BEGIN
UPDATE posts SET
CommentsJsonArr = (
	SELECT JSON_ARRAYAGG(jsonComments.jsonObj) from (
		SELECT JSON_OBJECT(
			'Id', Id,
			'PostId', PostId,
			'Score', Score,
			'Text', Text,
			'CreationDate', CreationDate,
			'UserId', UserId
		) AS jsonObj
		FROM comments
		WHERE PostId = postId
	) AS jsonComments
)
WHERE ID = postId;
END $$
DELIMITER ;