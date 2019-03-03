use stackoverflow;
DROP TRIGGER IF EXISTS after_comment_insert;
DROP PROCEDURE IF EXISTS insertComment;
DELIMITER $$
CREATE PROCEDURE `insertComment` (IN id int(11),IN postId int(11),IN userId int(11))
BEGIN
	INSERT INTO comments
	(`Id`, `PostId`, `UserId`)
	VALUES (id, postId, userId);
	CALL denormalizeComments(postId);
END $$
DELIMITER ;
