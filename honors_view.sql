create view chicago_public_schools_view (School_Name,Safety_Rating,Family_Rating,Environment_Rating,Instruction_Rating,Leaders_Rating,Teahers_Rating)
as select Name_Of_School,Safety_Icon,Family_Involvement_Icon,Environment_Icon,Instruction_Icon,Leaders_Icon,Teachers_Icon
from chicago_public_schools;

select * from chicago_public_schools_view;

select school_name, leaders_rating from chicago_public_schools_view;