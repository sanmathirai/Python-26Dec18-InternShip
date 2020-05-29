class college:
    def __init__(self,college_name,address,pin):
        self.college_name=college_name
        self.address=address
        self.pin=pin

class student(college):


    def __init__(self, name, regno, year,college_name,address,pin):
        super().__init__(college_name,address,pin)
        self.name = name
        self.regno = regno
        self.year = year
    print("Name\t\t Reg no\t\t\tyear\t\tCollege\t\t\tadress\t\t\t\tpin")
    print("------------------------------------------------------------")
    def display_stud(self):
        print("{:<14}{:<14}{:<14}{:14}{:14}{:14}".format(self.name, self.regno, self.year,self.college_name,self.address,self.pin))

if __name__ == '__main__':


    s1=student("sanma",1,2,"SJEC","Vamanjoor",574144)
    s5 = student("sanma", 2, 2, "SJEC", "Vamanjoor", 574144)
    s2 = student("shyam", 3, 2, "SJEC", "Vamanjoor", 574144)
    s3 = student("ksj", 4, 3, "SJEC", "Vamanjoor", 574144)
    s4 = student("iuoi", 5, 2019, "SJEC", "Vamanjoor", 574144)
    s1.display_stud()
    s2.display_stud()
    s3.display_stud()
    s4.display_stud()
    s5.display_stud()
