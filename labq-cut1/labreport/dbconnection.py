import pymysql
conn=pymysql.connect(host='localhost',user='root',password='',database='labq')
def insertdata(qry): 
       
    cursor=conn.cursor()
    sql=qry
    cursor.execute(sql)
    conn.commit()
    

def selectdata(qry):
    cursor=conn.cursor()
    sql=qry
    cursor.execute(sql)
    data=cursor.fetchone()
    #data=cursor
    return data

def selectalldata(qry):
    cursor=conn.cursor()
    sql=qry
    cursor.execute(sql)
    #data=cursor.fetchone()
    data=cursor
    return data

def deletedata(qry): 
       
    cursor=conn.cursor()
    sql=qry
    cursor.execute(sql)
    conn.commit()

def updatedata(qry): 
       
    cursor=conn.cursor()
    sql=qry
    cursor.execute(sql)
    conn.commit()