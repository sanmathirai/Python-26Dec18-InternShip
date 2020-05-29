student={"name":"sanma","regno":19,"address":"Kuppepadav"}
print(student)
student["mob"]=45645
print(student)
print("Mobile",student.get("mob"))
value=student.values()
print("student values",value)
keys=student.keys()
print("student values",keys)

#nested dictionary to store 5 student info
print("\n-----Accessing inputs from keyboard---------")
student1={}
name=input('Enter name:')
regno=input("enter register number")
student1["name"]=name
student1["reg"]=regno
print(student1)
