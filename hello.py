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