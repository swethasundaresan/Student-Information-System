from exception.custom_exception import DuplicateEnrollmentException, InvalidEnrollmentDataException, InsufficientFundsException
from util.database_util import DBConnection

class Enrollment(DBConnection):
    def __init__(self, enrollment_id, student_id, course_id, enrollment_date):
        super().__init__()  # Initialize parent class
        self.enrollment_id = enrollment_id
        self.student_id = student_id
        self.course_id = course_id
        self.enrollment_date = enrollment_date
        self.db = DBConnection()

    def EnrollInCourse(self):
        try:
            self.db.open()
            cursor = self.db.c  # Accessing the cursor attribute from DBConnection

            # Check if the student is already enrolled in the course
            query_duplicate_enrollment = f"""
                            SELECT * FROM enrollments
                            WHERE student_id = ? AND course_id = ?
                        """
            cursor.execute(query_duplicate_enrollment, (self.student_id, self.course_id))
            existing_enrollment = cursor.fetchone()
            if existing_enrollment:
                raise DuplicateEnrollmentException("Student is already enrolled in the course.")

            # Proceed with enrolling the student in the course
            query_enroll_student = """
                            INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
                            VALUES (?, ?, ?, ?)
                        """
            cursor.execute(query_enroll_student,
                           (self.enrollment_id, self.student_id, self.course_id, self.enrollment_date))
            self.db.mydb.commit()  # Committing the transaction
            print("Enrolled student in the course successfully.")
        except Exception as e:
            print("Error while enrolling student in course:", e)
        finally:
            self.db.close()

    def is_duplicate_enrollment(self, student_id, course_id):
        try:
            self.open()
            query = f"""
                SELECT COUNT(*)
                FROM enrollments
                WHERE student_id = {student_id} AND course_id = {course_id}
            """

            self.c.execute(query)
            count = self.c.fetchone()[0]

            return count > 0  # If count is greater than 0, duplicate enrollment exists
        except Exception as e:
            print("Error while checking for duplicate enrollment:", e)
            return False  # Return False in case of an error
        finally:
            self.close()



