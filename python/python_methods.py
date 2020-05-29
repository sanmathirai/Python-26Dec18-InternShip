def addition(first,second):
    sum=first+second
    return  sum

def subtraction(first,second):
    sum=first-second
    return sum

def multiplication(first,second):
    sum=first*second
    return sum


if __name__ == '__main__':
    firstnumber=int(input("Enter first number"))
    secondnumber=int(input("Enter second number"))
    totaladd=addition(firstnumber,secondnumber)
    totalmul = multiplication(firstnumber, secondnumber)
    totalsub = subtraction(firstnumber, secondnumber)
    print("sum of two numbers :", totaladd)
    print("product of two numbers :", totalmul)
    print("Difference of two numbers :", totalsub)
    print(type(firstnumber))