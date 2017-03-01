import os
import os.path
import psycopg2

print(os.path.abspath(__file__))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
print(os.getcwd())
DB_NAME = 'tour'
a = input('Create database ' + DB_NAME)

conn = psycopg2.connect("dbname=postgres user=postgres")
cur = conn.cursor()
cur.execute("COMMIT;")
cur.execute("DROP DATABASE IF EXISTS " + DB_NAME + " ;")
a = input('dropped')


cur.execute("CREATE DATABASE " + DB_NAME + ";")
conn.commit()

a = input('created')
conn.close()
conn = psycopg2.connect("dbname=" + DB_NAME + " user=postgres")
cur = conn.cursor()

cur.execute(open(os.path.abspath("tour-db-definition.sql"), "r").read())
conn.commit()
a = input('schema loaded')

cur.execute(open(os.path.abspath("tour-db-functions.sql"), "r").read())
conn.commit()
a = input('functions loaded')