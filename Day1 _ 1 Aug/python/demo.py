'''
        'ENGINE' : 'django.db.backends.postgresql_psycopg2',
        'NAME' : 'db_demo5',
        'USER' : 'postgres',
        'PASSWORD': 'root',
        'HOST' : 'localhost',
        'PORT' : '5432'
'''

import psycopg2
from psycopg2 import sql

dbname = 'db_study'
user = 'postgres'
password = 'root'
host = 'localhost'
port = '5432'

conn = psycopg2.connect(
	dbname=dbname,
	user=user,
	password=password,
	host=host,
	port=port
)

cur = conn.cursor()


# q1 = 'create table student2(roll int,name varchar(200), percentage float)'

# cur.execute(q1);

conn.commit()

cur.execute('select * from employees');
for row in cur.fetchall():
	print(row)


qv = 'create view myview as select empname,empcontact from employees'

cur.execute(qv)

cur.execute('select * from myview')

for row in cur.fetchall():
	print(row)