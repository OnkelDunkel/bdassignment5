# DB assignment 5

## Ex1

First run below code to create the JSON culumn to the posts table:

	USE *insert_name_of_db*;
	ALTER TABLE posts
	ADD column CommentsJsonArr json;

Below code should add the stored procedure:

DELIMITER //
CREATE PROCEDURE `denormalizeComments` (in postId int(11))
BEGIN

END //
DELIMITER;
