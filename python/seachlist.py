def searchele(car,ele):
    flag = 0
    for i in range(len(car)):
        if car[i] == ele:
            flag = flag+1
            index = i
            break
    if flag == 1:
        print("element is found at the position:", index + 1)
    else:
        print("Searching element",ele ,"not found")


if __name__ == '__main__':
    car=[]
    size=input("Enter size of the list")
    for i in range(int(size)):
        element=int(input("Enetr Element:"))
        car.append(element)
    print(car)
    ele=int(input("Enter the searchng elelemnt"))
    searchele(car,ele)
