SELECT*
FROM customers
WHERE first_name REGEXP 'elka|AMBUR' OR
			last_name REGEXP 'ey$|ON$|^MY|SE|[RU]B' 