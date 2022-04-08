SELECT*
FROM customers
#WHERE last_name LIKE '%b%' #%表示任意长度的字符
#WHERE last_name LIKE '%y'
#WHERE last_name LIKE '_y'#表示只有两个字符且第二个是y
#WHERE address LIKE '%trail%' OR address LIKE '%avenue%'	
#WHERE phone LIKE '%9'
#WHERE last_name REGEXP 'field' #正则，寻找名字中包括field的
#WHERE last_name REGEXP '^field' #正则，寻找名字中以field 开头的
#WHERE last_name REGEXP 'field$' #正则，寻找名字中以field 结尾的
#WHERE last_name REGEXP 'field|mac' #正则，寻找名字中包括field或mac的
#WHERE last_name REGEXP '[gim]e' #正则，寻找名字中包括e且前面有g、i、m的
#WHERE last_name REGEXP '[a-h]e' #正则，寻找名字中包括e且前面a至h任意字母
#^ beginning $ end  | logical or 
 

