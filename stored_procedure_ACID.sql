--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (IN IN_SCHOOL_ID INTEGER, IN IN_LEADERS_SCORE INTEGER)
LANGUAGE SQL 
MODIFIES SQL DATA 
BEGIN 
	UPDATE CHICAGO_PUBLIC_SCHOOLS 
	SET LEADERS_SCORE = IN_LEADERS_SCORE
	WHERE SCHOOL_ID = IN_SCHOOL_ID;
	
	IF IN_LEADERS_SCORE > 0 AND IN_LEADERS_SCORE < 20 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'Very weak'
		WHERE SCHOOL_ID = IN_SCHOOL_ID;
	ELSEIF IN_LEADERS_SCORE < 40 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'Weak'
		WHERE SCHOOL_ID = IN_SCHOOL_ID;
	ELSEIF IN_LEADERS_SCORE < 60 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'Average'
		WHERE SCHOOL_ID = IN_SCHOOL_ID;
	ELSEIF IN_LEADERS_SCORE < 80 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'Strong'
		WHERE SCHOOL_ID = IN_SCHOOL_ID;	
	ELSEIF IN_LEADERS_SCORE < 100 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'Very strong'
		WHERE SCHOOL_ID = IN_SCHOOL_ID;
	ELSE 
		ROLLBACK WORK;
	END IF;
	
	COMMIT WORK;
END
@
