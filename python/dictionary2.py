#to save and display 5 student details

student={1:{"name":"Sanmathi","regno":19,"mob":998},
         2:{"name":"Shyam","regno":19,"mob":998},
         3:{"name":"viki","regno":19,"mob":998},
         4:{"name":"santu","regno":19,"mob":998},
         5:{"name":"sachin","regno":19,"mob":998}
         }
print("name \t    regno \t\t  mob")
print("{:<14}{:<10}{:<10}".format(student[1]["name"],student[1]["regno"],student[1]["mob"]) )
print("{:<14}{:<10}{:<10}".format(student[2]["name"],student[2]["regno"],student[2]["mob"] ))
print("{:<14}{:<10}{:<10}".format(student[3]["name"],student[3]["regno"],student[3]["mob"] ))
print("{:<14}{:<10}{:<10}".format(student[4]["name"],student[4]["regno"],student[4]["mob"] ))
print("{:<14}{:<10}{:<10}".format(student[5]["name"],student[5]["regno"],student[5]["mob"] ))
ls=list()

for i in student.keys():
    ls.append(i)
print(ls)

#print("{:<14}{:<10}{:<10}".format(student[j]["name"],student[j]["regno"],student[j]["mob"]) )



#student={}
#student1={-}
#student1={1:['san',2]}
#print("{:<10}".format(student1[1][0]) )

#output
# options
# 1.add students
# 2.del student
# 3.add mark
# 4.find result
# 5.view result
# 6.delete student
# 7.exit
#
# stud name,reg mob
#
# enter studname, enter mark1m2,


