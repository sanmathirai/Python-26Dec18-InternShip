class college:
    def __init__(self):
        self.c_name=""
        self.c_add=""
        self.c_pin=""
    def c_initialization(self):
        self.c_name=input("ENter college name")
        self.c_add = input("ENter college adress")
        self.c_pin = input("ENter pin")
class student(college):

    def __init__(self):
        self.s_name=""
        self.s_regno=""

    def s_initialization(self):
        self.s_name=input("Enter name")
        self.s_regno = input("Enter regno")
    def printdetails(self):
        print("Student Name:",self.s_name,"College name:",self.c_name)

if __name__ == '__main__':
    choice=1
    s = student()
    count=0
    std = []
    while(choice):

        count=count+1
        s.c_initialization()
        s.s_initialization()
        s.std.append(s)

        choice=int(input("do u wanna continue"))
    for i in range(count):
        s.std[i].printdetails()
