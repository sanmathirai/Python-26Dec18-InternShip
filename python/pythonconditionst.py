def readinput():
    first=int(input("ENter first number"))
    second=int(input("ENter second number"))

def compare(firstnum,secondnum):
    if(first>second):
        return first
    else:
        return second

def oddeven(firstnum,secondnum):
    if(first%2==0):
        return 0
    else:
        return 1
if __name__ == '__main__':
    first = int(input("ENter first number"))
    second = int(input("ENter second number"))
    resultcompare=compare(first,second)
    print("the greatest number is",resultcompare);
    resultoddeven = oddeven(first, second)
    if(resultoddeven==1):
         print("The  number odd");
    else:
        print("the number is even")
