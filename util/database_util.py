import pyodbc

from util.PropertyUtil import PropertyUtil

class DBConnection():
    def __init__(self):
        self.mydb=None
        self.c=None

    def open(self):
        try:
            l = PropertyUtil.getPropertyString()
            conn_str = (
                f"DRIVER={{ODBC Driver 17 for SQL Server}};"
                f"SERVER={l[0]};"
                f"DATABASE={l[1]};"
                f"Trusted_Connection=yes;"
            )
            self.mydb = pyodbc.connect(conn_str)
            self.c = self.mydb.cursor()
        except Exception as e:
            print(e)

    def close(self):
        if self.c:
            self.c.close()
        if self.mydb:
            self.mydb.close()
