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

import math

def quadratic(a,b,c): #解一元二次方程练习，还可以再优化
    d=b**2-4*a*c
    d=math.sqrt(d)
    x1=(-b+d)/(2*a)
    x2=(-b-d)/(2*a)
    if d<0:
        print("该方程无解。")
    elif d==0:
        print('方程有且仅有一个解x =',-b/(2*a))
    else:
        print('方程有两个不相等的实数根分别是 ：',x1,x2)
print(quadratic(1,2,1))


    