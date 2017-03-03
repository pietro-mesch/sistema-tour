import os
import os.path
import psycopg2

print(os.path.abspath(__file__))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
print(os.getcwd())
DB_NAME = input('Choose DB name: ')

conn = psycopg2.connect("dbname=postgres user=postgres")
cur = conn.cursor()
cur.execute("COMMIT;")
cur.execute("DROP DATABASE IF EXISTS " + DB_NAME + " ;")
a = input(DB_NAME + ' dropped, press RETURN to continue ...')


cur.execute("CREATE DATABASE " + DB_NAME + ";")
conn.commit()

a = input(DB_NAME + ' created, press RETURN to continue ...')
conn.close()
conn = psycopg2.connect("dbname=" + DB_NAME + " user=postgres")
cur = conn.cursor()

cur.execute(open(os.path.abspath("tour-db-definition.sql"), "r").read())
conn.commit()
cur.execute(open(os.path.abspath("tour-db-views.sql"), "r").read())
conn.commit()
a = input('schema loaded, press RETURN to continue ...')

cur.execute(open(os.path.abspath("tour-db-functions.sql"), "r").read())
conn.commit()
a = input('functions loaded, press RETURN to continue ...')

a = input('Load data sequentially? (y/n): ')
if a == 'y':
	print(os.path.abspath('data.sql'))
	with open(os.path.abspath('data.sql')) as fp:
		# conn.close()
		conn = psycopg2.connect("dbname=" + DB_NAME + " user=postgres")
		for line in fp:
			if line != '\n':
				cur = conn.cursor()
				cur.execute(line)
				conn.commit()
	a = input('Data loaded. Press RETURN to close.')
else:
	a = input('Data will not be loaded. Press RETURN to close.')
