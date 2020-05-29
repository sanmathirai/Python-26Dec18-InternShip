car=["Alto","Ecosports","Scoda"]
print(car[0])#priting single element
print(car[1])
print(car[2])
del car["Alto"]
print(car)#printing all elements of the list
car[0]="Audi" #modifying list values at the index 0
print(car[0])
for mycar in car:
    print(mycar)

for mycar in range(len(car)):
    print(car[mycar])

print("-----Append---------")
#Append
car.append("Honda")
for mycar in range(len(car)):
    print(car[mycar])
