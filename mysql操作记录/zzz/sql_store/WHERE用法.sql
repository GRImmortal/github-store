SELECT*
FROM customers
#WHERE points > 3000
#WHERE state = 'VA'
#WHERE state <> 'VA'
#WHERE birth_date >'1990-01-01' OR 
	#		(points>1000 AND state = 'VA')
#WHERE NOT (birth_date>'1990-01-01' OR points>1000)
#WHERE state IN ('VA','FL','GA')
#WHERE state NOT IN ('VA','FL','GA')
WHERE points BETWEEN 1000 AND 3000
