'''
Cahyo Purnomo
3 Nov 2017
Kali pertama saya menggunakan python
Jadi saya berasumsi terhadap soal yg diberikan
'''

import pymysql, hashlib

class Database:
    def connect(self):
        return pymysql.connect("localhost","root","toor","db_test" )

    def encrypt(self, str):
        hash = hashlib.md5(str).hexdigest()
        return hash
    
    def doLogin(self, data):
        conn = Database.connect(self)
        rec = conn.cursor()

        try:
            rec.execute("SELECT * FROM pengguna WHERE email = %s AND passwd = %s", (data['txtEmail'],self.encrypt(data['txtPasswd']),))
            return rec.fetchall()
        except:
            return ()
        finally:
            conn.close()

    def getPengguna(self, id):
        conn = Database.connect(self)
        rec = conn.cursor()
        
        try: 
            if id == None:
                rec.execute("SELECT * FROM pengguna ORDER BY nama_pengguna ASC")
            else: 
                rec.execute("SELECT * FROM pengguna WHERE idx_pengguna = %s ORDER BY nama_pengguna ASC", (id,))

            return rec.fetchall()
        except:
            return ()
        finally:
            conn.close()
            
    def addPengguna(self,data):
        conn = Database.connect(self)
        rec = conn.cursor()

        try:
            rec.execute("INSERT INTO pengguna(nama_pengguna,email,passwd) VALUES(%s, %s, %s)", (data['txtNama'],data['txtEmail'],self.encrypt(data['txtPasswd']),))
            conn.commit()
            
            return True
        except:
            conn.rollback()
            
            return False
        finally:
            conn.close()
            
    def updatePengguna(self, id, data):
        conn = Database.connect(self)
        rec = conn.cursor()
        
        try:
            rec.execute("UPDATE pengguna SET nama_pengguna = %s, email = %s, passwd = %s WHERE idx_pengguna = %s", (data['txtNama'],data['txtEmail'],self.encrypt(data['txtPasswd']),id,))
            conn.commit()
            
            return True
        except:
            conn.rollback()
            
            return False
        finally:
            conn.close()
        
    def deletePengguna(self, id):
        conn = Database.connect(self)
        rec = conn.cursor()
        
        try:
            rec.execute("DELETE FROM pengguna WHERE idx_pengguna = %s", (id,))
            conn.commit()
            
            return True
        except:
            conn.rollback()
            
            return False
        finally:
            conn.close()
