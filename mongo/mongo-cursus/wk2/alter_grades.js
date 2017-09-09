
var student_scores = db.grades.find({'type' : 'homework'}).sort( {'student_id':1,'score':-1 } );

var prev_result = null;
while(student_scores.hasNext() ) {
	
	var result = student_scores.next();

	if ( prev_result )  {
		if ( prev_result.student_id != result.student_id )  {
			print("Student_id : " + prev_result.student_id + " " + prev_result.score + " Lowest " );
			db.grades.remove( { '_id' : prev_result._id },1 );
		}
	}
	print("Student_id : " + result.student_id + " " + result.score );
	prev_result = result;
}

