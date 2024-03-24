class DuplicateEnrollmentException(Exception):
    """Exception raised when a student is already enrolled in a course and tries to enroll again."""

    def __init__(self, message="Student is already enrolled in the course."):
        self.message = message
        super().__init__(self.message)


class CourseNotFoundException(Exception):
    """Exception raised when a course does not exist in the system."""
    def __init__(self, message="Course not found in the system."):
        self.message = message
        super().__init__(self.message)


class StudentNotFoundException(Exception):
    """Exception raised when a student does not exist in the system."""
    def __init__(self, message="Student not found in the system."):
        self.message = message
        super().__init__(self.message)


class TeacherNotFoundException(Exception):
    """Exception raised when a teacher does not exist in the system."""
    def __init__(self, message="Teacher not found in the system."):
        self.message = message
        super().__init__(self.message)


class PaymentValidationException(Exception):
    """Exception raised when there is an issue with payment validation."""
    def __init__(self, message="Payment validation failed."):
        self.message = message
        super().__init__(self.message)


class InvalidStudentDataException(Exception):
    """Exception raised when data provided for creating or updating a student is invalid."""
    def __init__(self, message="Invalid student data provided."):
        self.message = message
        super().__init__(self.message)


class InvalidCourseDataException(Exception):
    """Exception raised when data provided for creating or updating a course is invalid."""
    def __init__(self, message="Invalid course data provided."):
        self.message = message
        super().__init__(self.message)


class InvalidEnrollmentDataException(Exception):
    """Exception raised when data provided for creating an enrollment is invalid."""
    def __init__(self, message="Invalid enrollment data provided."):
        self.message = message
        super().__init__(self.message)


class InvalidTeacherDataException(Exception):
    """Exception raised when data provided for creating or updating a teacher is invalid."""
    def __init__(self, message="Invalid teacher data provided."):
        self.message = message
        super().__init__(self.message)


class InsufficientFundsException(Exception):
    """Exception raised when a student attempts to enroll in a course but does not have enough funds."""
    def __init__(self, message="Insufficient funds for enrollment."):
        self.message = message
        super().__init__(self.message)
