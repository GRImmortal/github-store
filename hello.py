# -*- coding: utf-8 -*-
print('Hello, %s, 成绩提升了%s %%' % ('小明',17.1))
r = 2.5
s = 3.14*r**2
print(f'The area of a circle with radius {r} is {s:.2f}') #s:.2f表示取s所代表数字的小数点后两位

print('Hello, %s, 成绩提升了%s %%' % ('小明',(85-72)*100//72))
s1=72
s2=85
r = (s2-s1)*100/s1
print(f'小明的成绩从去年的{s1}分提升到了今年的{s2}分,成绩提升了{r:.1f}%')
age = 3
if age >= 18:
    print('your age is',age)
    print('adult')
else:
    print('your age is',age)
    print('teenger')

height = 1.75
weight = 80.5
bmi = 80.5/1.75**2
if bmi < 18.5:
    print('过轻')
elif 18.5 < bmi < 25:
    print('正常')
elif 25 < bmi <28:
    print('过重')
elif 28 < bmi < 32:
    print('肥胖')
else:
    print('严重肥胖')

height=1.75

weight=80.5

bmi=weight/(height*height)

print('hello,your bmi is:{0:.1f}'.format(bmi))

if bmi<18.5:

    print('您的体重过轻')

elif 18.5<=bmi<=25:

    print('您的体重正常')

elif 25<bmi<28:

    print('您的体重过重')

elif 28<=bmi<=32:

    print('您的体重肥胖')

else:

    print('您的体重严重肥胖')



names = ['1','2','3']
for name in names:
    print(name)


sum = 0
n = 99
while n >= 0:
    sum = sum + n
    n = n - 2


print(sum)
L = ['Bart', 'Lisa', 'Adam']
for x in L:
    print(x)

n = 1
while n <= 100:
    print(n)
    n = n + 1
print('END')

n = 1
while n <= 100:
    if n >= 10:
        break #提前结束循环
    print(n)
    n = n + 1
print('end')

n = 0
while n < 10:
    n = n + 1
    if n % 2 == 0:  #n除以二的余数是零，表示偶数
        continue # 跳过符合前面条件的内容
    print(n)
print('END')


n1 = 255
n2 = 1000
print(hex(n1))#将整数转换为十六进制字符串

def my_abs(x):  #定义函数
    if x >= 0:
        return x
    else:
        return -x
print(my_abs(-9))

def my_abs(x):
    if not isinstance(x,(int,float)):
        raise TypeError('bad operand type') #给自己定义的函数添加报错语句
    if x >= 0:
        return x
    else:
        return -x

import math #导入math包

def move(x,y,step,angle=0):
    nx = x + step*math.cos(angle)
    ny = y - step*math.sin(angle)
    return nx,ny


import math #破费
def quadratic(a,b,c):
    if not(isinstance(a,(float,int))and isinstance(b,(float,int))and isinstance(c,(float,int))):
        raise TypeError('bad operand type')
    d = b**2-4*a*c
    if a == 0:
        x1=-c/b
        x2=-c/b
        return x1,x2 
    elif d >= 0:
        x1 = (-b-math.sqrt(d))/(2*a)
        x2 = (-b+math.sqrt(d))/(2*a)
        return x1,x2
    elif d < 0:
        print('该方程无实数根')
quadratic(3,4,2)#不需要加print，直接调用即可，否则会none

import math
def power(x,n):
    s = 1
    while n > 0:  #while循环，意思是n代表了s与x相乘的次数，加入n是四，s就要与x相乘四次，也就是x的四次方
        n = n-1
        s = s*x
    return s

def calc(numbers):  #求平方和
    sum = 0
    for n in numbers:
        sum = sum + n*n
    return sum

calc([1,2,3,4]) #调用的时候必须用list或者tuple

def calc(*numbers):#加*变成可变参数，在调用时就不用再用list或者tuple
    sum = 0
    for n in numbers:
        sum = sum + n*n
    return sum

#如果已经有一个确定的list
#比如nums=[1,2,3],可以直接套用calc(*nums)加*作为可变参数直接调用


def person(name,age,**kw):
    print('name:',name,'age:',age,'other:',kw)



#在Python中定义函数,参数定义的顺序必须是
# 必选参数，默认参数，可变参数，命名关键字参数和关键字参数
# *args是可变参数，接受的是tuple，**kw是关键字参数，kw接受的是一个dict


def mul(*y):#计算多个数的乘积
    s = 1
    for i in y:
        s = s*i
    return s

def fact(n):#计算阶乘
    if n==1:
        return 1
    else:
        return n*fact(n-1)
fact(5)

def move(n,a,b,c):#汉诺塔挪盘子问题
    if n==1:#如果只有一个盘子则直接移动到c就行了
        print(a,'-->',c)
    else:
        move(n-1,a,c,b)#把上边n-1个盘子看成整体，以c为过度，全部挪到b
        print(a,'-->',c)#把最大的那个先直接挪到c
        move(n-1,b,a,c)#以a为过度，把放在b上的n-1个盘子挪到c上，完成
move(5,'A','B','C')#只需要归化方向，具体的递归交给python

L = []
n = 1
while n <= 99:
    L.append(n)
    n = n+2


L = ['M','Z','D','F','G']
L[0:3]#切片，取前三个元素

L = list(range(100))#取100的前十个数
L[:10]
L[10:20]#取前11-20个数
L[:10:2]#前十个数每两个取一个
L[::5]#所有数每五个取一个

def trim(s):
    if s[:1] ==' ':#如果首位有空格则把空格去掉变成新的s
        s = s[1:]
        return trim(s)
    if s[-1:] ==' ':#如果末尾有空格则把空格去掉变成新的s
        s = s[:-1]
        return trim(s)
    return s    

numbers = [12,37,5,42,8,3]#数字分类程序，理解while的用法
even = []
odd = []
while len(numbers) > 0:#如果numbers的list内仍有数字就继续循环
     number = numbers.pop()#将numbers里的数字一个一个剔除出来
     if(number % 2 == 0):#如果是偶数则分进even
         even.append(number)
     else:
         odd.append(number)#如果是奇数则分进odd


#默认dict迭代的是key，如果要迭代value可以用for value in d.values()
#如果要同时迭代key和value，用for k,v in d.items()

#如何判断一个对象可迭代
from collections.abc import Iterable
isinstance('abc', Iterable) # str是否可迭代
isinstance([1,2,3], Iterable) # list是否可迭代
isinstance(123, Iterable) # 整数是否可迭代



def findMinAndMax(L):
    if len(L) == 0:
        return(None,None)
    else:
        return(min(L),max(L))

#找到list中的最大值和最小值并输出成tuple
def findMinAndMax(L):
    if len(L) == 0:
        x = None
        y = None
    else:
        x = min(L)
        y = max(L)
    return(x,y)




 




    