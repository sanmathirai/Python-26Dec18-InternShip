def second_largest(car):
    car.sort()
    print(car)
    i=len(car)
    j=i-2
    print("sec largest is:",car[j])


if __name__ == '__main__':
    car=[]
    size=input("Enter size of the list")
    for i in range(int(size)):
        element=int(input("Enetr Element:"))
        car.append(element)
    print(car)
    second_largest(car)

