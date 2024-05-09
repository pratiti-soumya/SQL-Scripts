#  For the student with ID 45678, show all class_id and title of all classes taken by the student.

select Class.class_id, Class.title from Takes inner join Class on Takes.class_id = Class.class_id where id = 45678;
