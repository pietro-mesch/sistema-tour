import os
import os.path
import psycopg2

print(os.path.abspath(__file__))
os.chdir(os.path.dirname(os.path.abspath(__file__)))
print(os.getcwd())
a = input('pause')


conn = psycopg2.connect("dbname=postgres user=postgres")
cur = conn.cursor()
cur.execute("COMMIT;")
cur.execute("DROP DATABASE IF EXISTS tour ;")
a = input('dropped')


cur.execute("CREATE DATABASE tour;")
conn.commit()

a = input('created')
conn.close()
conn = psycopg2.connect("dbname=tour user=postgres")
cur = conn.cursor()

cur.execute(open(os.path.abspath("tour-db-definition.sql"), "r").read())
conn.commit()
a = input('schema loaded')

cur.execute(open(os.path.abspath("tour-db-functions.sql"), "r").read())
conn.commit()
a = input('functions loaded')