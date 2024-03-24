from dao.sis_dao import SIS
from entity.enrollment import Enrollment
from entity.payment import Payment


class Main():
    def main():
        obj = SIS()
        while True:
            print("\nMenu: ")
            print("\n1. Enroll in course")
            print("2. Update student information")
            print("3. Make payment")
            print("4. Display student info")
            print("5. Display student enrolled courses")
            print("6. Display All payments")
            print("7. Assign teacher to course")
            print("8. Update course info")
            print("9. Get course info")
            print("10. Get enrolled students in a course")
            print("11. Get teacher of a particular course")
            print("12. Get student associated with the enrollment")
            print("13. Get course associated with the enrollment")
            print("14. Update teacher information")
            print("15. Display teacher info")
            print("16. Display assigned course to teacher")
            print("17. Exit")
            choice =int(input("Enter your choice: "))
            if choice == 1:
                id = int(input("\nEnter enrollment id: "))
                s = int(input("\nEnter student id: "))
                c = int(input("\nEnter Course id: "))
                d = input("\nEnter enrollment date: ")
                Enrollment(enrollment_id=id,student_id=s,course_id=c,enrollment_date=d).EnrollInCourse()
            elif choice == 2:
                sid=int(input("\nEnter student id: "))
                fname=input("\nEnter New firstname: ")
                lname=input("\nEnter New lastname: ")
                dob=input("\nEnter new DOB: ")
                email=input("\nEnter new email: ")
                phoneno=input("\nEnter new phone no: ")
                obj.UpdateStudentInfo(sid,fname,lname,dob,email,phoneno)
            elif choice == 3:
                id=int(input("\nEnter payment id: "))
                sid=int(input("\nEnter student id: "))
                a=float(input("\nEnter amount: "))
                p=input("\nEnter payment date: ")
                Payment(payment_id=id,student_id=sid,amount=a,payment_date=p).MakePayment()
            elif choice == 4:
                id=int(input("\nEnter studentid: "))
                obj.DisplayStudentInfo(id)
            elif choice == 5:
                id=int(input("Enter student id: "))
                enrolled_courses=obj.GetEnrolledCourses(id)
                if enrolled_courses:
                      print("Courses Enrolled:")
                      for course in enrolled_courses:
                           print(f"Course Name: {course[0]}")
                           print()
                else:
                   print("No courses enrolled for this student.")
            elif choice == 6:
               id=int(input("\nEnter studentid: "))
               payment_history=obj.GetPaymentHistory(id)
               if payment_history:
                    print("Payment History:")
                    for payment_record in payment_history:
                        print(f"Amount: {payment_record[0]}")
                        print(f"Payment Date: {payment_record[1]}")
                        print()  # Empty line for separation
               else:
                print("No payment records found for this student.")
            elif choice == 7:
                cid=int(input("\nEnter courseid: "))
                tid=int(input("\nEnter teacherid: "))
                obj.AssignTeacher(cid,tid)
            elif choice == 8:
                cid=int(input("Enter new course id: "))
                cname=input("Enter new course name: ")
                credit=int(input("Enter credits: "))
                tid=input("Enter teacher id: ")
                obj.UpdateCourseInfo(cid,cname,credit,tid)
            elif choice == 9:
                cname=input("\nEnter new course name: ")
                obj.DisplayCourseInfo(cname)
            elif choice == 10:
                cname=input("\nEnter course name: ")
                obj.GetEnrollments(cname)
            elif choice == 11:
                cname=input("\nEnter course name: ")
                obj.GetTeacher(cname)
            elif choice == 12:
                id=int(input("\nEnter enrollment id: "))
                obj.GetStudent(id)
            elif choice == 13:
                id=int(input("\nEnter enrollment id: "))
                obj.GetCourse(id)
            elif choice == 14:
                tid=int(input("\nEnter teacher id: "))
                tfname=input("\nEnter first name: ")
                tlname=input("\nEnter last name: ")
                email=input("\nEnter email: ")
                obj.UpdateTeacherInfo(tid,email,tfname,tlname)
            elif choice == 15:
                tid=int(input("\nEnter teacher id: "))
                obj.DisplayTeacherInfo(tid)
            elif choice == 16:
                tid=int(input("\nEnter teacher id: "))
                obj.GetAssignedCourses(tid)
            elif choice == 17:
                print("\nExiting, Thank you\n")
                break
            else:
                print('\nInvalid Choice\n')

if __name__ == "__main__":
    Main.main()



