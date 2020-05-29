def addition(first,second):
    sum=first+second
    print(" Addition of ",first," and ",second," is: ",sum)

def subtraction(first,second):
    difference=first-second
    print("Difference ", first, " and ", second, " is: ", difference)

def multiplication(first,second):
    product=first*second
    print("Product of ", first, " second ", second, " is: ", product)

if __name__ == '__main__':
    print("1. Addition \n 2.subtraction \n 3.Multiplication \n 4.Exit")
    choice = int(input("Enter your choice"))
    number1=int(input("Enter 1st number"))
    number2=int(input("Enter 2nd number"))

    if(choice==1):
        addition(number1,number2)

    elif(choice==2):
        subtraction(number1,number2)

    elif(choice==3):
        multiplication(number1,number2)
    else:
        exit()

