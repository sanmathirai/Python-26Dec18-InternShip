class student:
    'student class'
    slist=[]
    college_name="SJEC"
    count=0
    def __init__(self, name, regno,year):
        self.name=name;
        self.regno=regno
        self.year=year
        # self.python=python
        # self.ajax=ajax
        student.count+=1
    def display(self):
        print("{:<14}{:<14}{:<14}{:<14}".format(self.name,self.regno,self.year,self.college_name))
    #def display_count(self):
# print("Total number of students: ",student.count)



def add_student():

    sum=input("\nEnter number of students:")
    for i in range(int(sum)):
        name = input("\nENter name:")
        regno =int( input("\nENter reg no:"))
        year = int(input("\nENter year:"))
        student.slist.append(student(name,regno,year))
    for i in range(int(sum)):
        student.slist[i].display()



    print("\n\nTotal number of students :\n",student.count)

# def add_mark():
#
#     sum=input("\nEnter registration no:")
#     python = input("\nPython:")
#     ajax =input("\nAJAX:")
#     student.slist.append(student(python,ajax))
#     for i in range(int(sum)):
#         student.slist[i].display()

if __name__ == '__main__':
    print("Documentation:",student.__doc__)
    print("class name: ",student.__name__)
    print("baseclass: ",student.__bases__)
    print("dictionary:",student.__dict__)
    print("dictionary:", student.__module__)
    while (1):

        print("1. Add Student\n\n2. Add Mark\n\n3. Find Result\n\n4. Delete student\n\n5. View Result\n\n6. view all students\n\n7. Exit")
        choice = int(input("\nEnter your choice:"))
        if (choice == 1):
            add_student()


        # elif (choice == 2):
        #     addmark()
        #
        # elif (choice == 3):
        #     find_result()
        #
        # elif (choice == 4):
        #     delete_student()
        #
        # elif (choice == 5):
        #     view_result()
        #
        # elif (choice == 6):
        #     view_all()

        else:
            exit()


