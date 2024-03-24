from exception.custom_exception import PaymentValidationException, StudentNotFoundException
from util.database_util import DBConnection

class Payment(DBConnection):
    def __init__(self, payment_id, student_id, amount, payment_date):
        self.payment_id = payment_id
        self.student_id = student_id
        self.amount = amount
        self.payment_date = payment_date

    def MakePayment(self):
        try:
            self.open()
            if not self.is_valid_payment():
                raise PaymentValidationException("Payment validation failed. Invalid amount or date.")
            if not self.is_student_exists(self.student_id):
                raise StudentNotFoundException(f"Student with ID {self.student_id} not found.")
            self.c.execute(
                f"INSERT INTO Payments (payment_id, student_id, amount, payment_date) "
                f"VALUES ('{self.payment_id}', '{self.student_id}', '{self.amount}', '{self.payment_date}')"
            )
            self.mydb.commit()
            print("Recorded payment successfully.")
        except PaymentValidationException as e:
            print("Error while recording payment:", e)
        except StudentNotFoundException as e:
            print("Error while recording payment:", e)
        except Exception as e:
            print("Error while recording payment:", e)

    def is_valid_payment(self):
        return self.amount > 0

    def is_student_exists(self, student_id):
        try:
            self.open()
            self.c.execute(f"SELECT COUNT(*) FROM Students WHERE student_id = '{student_id}'")
            count = self.c.fetchone()[0]
            return count > 0  # If count > 0, student exists; otherwise, student does not exist
        except Exception as e:
            print("Error checking student existence:", e)
            return False  # Assume student does not exist in case of an error