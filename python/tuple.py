car=()

for mycar in range(3):
    name=input("Enter car name")
    car=car+(name,)


print(car)
newlist=list(car)
print("Max ele",max(newlist))

