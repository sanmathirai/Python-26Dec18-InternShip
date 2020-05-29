
def magicnum(n):
    power = 1
    ans = 0
    while(n):
        power = power*5
        if ( n & 1 ):
            ans += power
        n=n//2
    print(ans)

class mn :
    magicnum(2)





