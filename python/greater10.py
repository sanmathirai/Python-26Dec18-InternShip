def largest(num):
    if num%2==0:
        flag=1
    else:
        flag=0
    if num>10:
        greater=1
    else:
        greater=0
    if greater==1 and flag==1:
        print(num,"even and greater")
    elif  greater==1 and flag==0:
        print(num,"odd and greater")
    elif greater == 0 and flag == 1:
        print(num, "even and lesser")
    else:
        print(num, "odd and lesser")



if __name__ == '__main__':
    num=int(input("number"))
    largest(num)




