student={}
def display():
    ls = list()
    print("USN \t\t Name \t\tMobile")
    print("-----------------------------")
    for i in student.keys():
        ls.append(i)
    for i in range(len(ls)):
        print("{:<14}{:<14}{:<14}".format(ls[i], student[ls[i]]["name"], student[ls[i]]["Mobile"]))

#-------------------------------------------------ADDING STUDENTS-------------------------------------------
def add_student():
    num=int(input("\nEnter number of students\n"))
    for i in range(num):
        print("\n----Enter ", i + 1, "student details---\n")
        regno=int(input("\nEnter register number:"))
        if regno in student.keys():
            print("\n!!!!!!!!  Register number already Exists  !!!!!!!!\n")

        else:

            student[regno]={}
            name=input("\nEnter name:")
            student[regno]["name"]=name
            mob_no = input("\nEnter Mobile number:")
            student[regno]["Mobile"] = mob_no
            print("\nStudent succesfully added\n")
            display()
    print("\n")
    print("\n")

#---------------------------------------------ADDING MARKS--------------------------------------------
def addmark():
    ls = list()

    for i in student.keys():
        ls.append(i)
    if (len(ls) > 0):
        regno=int(input("Enter registration number:"))
        if regno in student.keys():
            python=int(input("Enter mark in python:"))
            student[regno]["Python"]=python
            Ajax = int(input("Enter Mark in Ajax:"))
            student[regno]["Ajax"] = Ajax
            student[regno]["result"]=""
            print("Mark succesfully added")
            print("USN \t\t Name \t\tMobile  \t\tPython \t\tAjax    \t\tResult")
            print("---------------------------------------------------------------")
            print("{:<14}{:<14}{:<14}{:<14}{:<14}{:<14}".format(regno, student[regno]["name"], student[regno]["Mobile"],
                                                          student[regno]["Python"], student[regno]["Ajax"],
                                                          student[regno]["result"]))
        else:
            print("\n!!!!!!!! Invalid  Register number  !!!!!!!!\n")
    else:
        print("\n!!!!!!!No Studets added ..Please add students!!!!!!\n")


#---------------------------------------------------------------FIND RESULT--------------------------------------------------------------
def find_result():
    ls = list()

    for i in student.keys():
        ls.append(i)
    if (len(ls) > 0):
        regno=int(input("Enter registration number:"))
        if regno in student.keys():
            python_mark=student[regno]["Python"]
            ajax_mark=student[regno]["Ajax"]
            total=python_mark+ajax_mark
            avg=total/2
            if(avg>=70):
                student[regno]["result"]="Distinction"
            elif(avg>=60):
                student[regno]["result"] = "first class"
            elif(avg>=35):
                student[regno]["result"] = "Pass"
            else:
                student[regno]["result"] = "Fail"
            print("USN \t\t Name \t\tMobile  \t\tPython \t\tAjax    \t\tResult")
            print("---------------------------------------------------------------")
            print("{:<14}{:<14}{:<14}{:<14}{:<14}{:<14}".format(regno,student[regno]["name"], student[regno]["Mobile"],
                                                  student[regno]["Python"], student[regno]["Ajax"],
                                                  student[regno]["result"]))
        else:
            print("\n!!!!!!!! Invalid  Register number  !!!!!!!!\n")
    else:
        print("\n!!!!!!!No Studets added ..Please add students!!!!!!\n")


#--------------------------------------------------------DELETE STUDENT-----------------------------------------------------
def delete_student():
    ls = list()

    for i in student.keys():
        ls.append(i)
    if (len(ls) > 0):
        regno=int(input("Enter registration number to be deleted:"))
        if regno in student.keys():
            del(student[regno])
            print("student deleted successfully")
            print(student)
        else:
            print("Invalid USN")
    else:
        print("\n!!!!!!!No Studets added ..Please add students!!!!!!\n")


#---------------------------------------------VIEW RESULT---------------------------------------------
def view_result():
    ls = list()

    for i in student.keys():
        ls.append(i)
    if (len(ls) > 0):
        regno=int(input("\nEnter student register number:"))
        if regno in student.keys():
            print("Name \t\tMobile  \t\tPython \t\tAjax    \t\tResult")
            print("---------------------------------------------------------------")
            print("{:<14}{:<14}{:<14}{:<14}{:<14}".format(student[regno]["name"],
                                                  student[regno]["Mobile"],
                                                  student[regno]["Python"],
                                                  student[regno]["Ajax"],
                                                  student[regno]["result"]))
        else:
            print("\n!!!Invalid register number!!!!!")
    else:
        print("\n!!!!!!!No Studets added ..Please add students!!!!!!\n")

#---------------------------------------------VIEW ALL STUDENTS DETAILS-----------------------------------------------------
def view_all():
    ls = list()

    for i in student.keys():
        ls.append(i)
    if(len(ls)>0):
        display()
    else:
        print("\n!!!!!!!!!!!!  No student details added !!!!!!!!!!!!!!!\n")




if __name__ == '__main__':
    while(1):

        print("1. Add Student\n\n2. Add Mark\n\n3. Find Result\n\n4. Delete student\n\n5. View Result\n\n6. view all students\n\n7. Exit")
        choice = int(input("\nEnter your choice:"))

        if (choice==1):
            add_student()

        elif (choice==2):
            addmark()

        elif (choice==3):
            find_result()

        elif (choice == 4):
            delete_student()

        elif (choice == 5):
            view_result()

        elif (choice == 6):
            view_all()

        else:
            exit()
