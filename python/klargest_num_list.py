def k_largest(car,k):
    car.sort()
    print(car)
    i=len(car)
    j=i-1
    for j in range(int(j)):
        print(" largest is:",car[j])
        j=j-1


if __name__ == '__main__':
    car=[]
    size=input("Enter size of the list")
    for i in range(int(size)):
        element=int(input("Enetr Element:"))
        car.append(element)
    k = int(input("Enter k th value"))
    print(car)
    k_largest(car,k)
