def second_largest(car):
    scar=()
    scar=sorted(car)
    print(scar)
    print(max(scar))
    print("second largest is",max(car)-1)



if __name__ == '__main__':
    car=()
    size=input("Enter size of the tuple")
    for i in range(int(size)):
        element=int(input("Enetr Element:"))
        car=car+(element,)
    print(car)
    second_largest(car)
