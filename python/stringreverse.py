arr=[]
string1="hello! how"
srtng2=""
for i in string1:
    arr+=i
for i in arr:
    if i=="e" or i=="i":
        arr.remove(i)
arr.reverse()


srtng2=''.join(arr)
print(srtng2)





