'''
Cahyo Purnomo
3 Nov 2017
Kali pertama saya menggunakan python
Jadi saya berasumsi terhadap soal yg diberikan
'''

from flask import Flask, flash, render_template, redirect, url_for, request, session
from module.database import Database

app = Flask(__name__)
app.secret_key = "r4h4s1a"
db = Database()

@app.route('/')
def index():
    '''
    if not session.get('logged_in'):
        return render_template('login.html')
    else:
    '''
    data = db.getPengguna(None)
    return render_template('index.html', data = data)


@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/dologin', methods = ['POST'])
def dologin():
    data = db.doLogin(request.form);
    
    if len(data) >= 1:
        session['logged_in'] = True
        return render_template('index.html', data = data)
    else:
        flash('error login')
        #return redirect(url_for('login'))
    

@app.route('/add/')
def add():
    return render_template('add.html')

@app.route('/addpengguna', methods = ['POST', 'GET'])
def addpengguna():
    if request.method == 'POST' and request.form['save']:
        if db.addPengguna(request.form):
            flash("User sudah ditambahkan")
        else:
            flash("User tidak bisa ditambahkan")
            
        return redirect(url_for('index'))
    else:
        return redirect(url_for('index'))
      

@app.route('/update/<int:id>/')
def update(id):
    data = db.getPengguna(id);
    
    if len(data) == 0:
        return redirect(url_for('index'))
    else:
        session['update'] = id
        return render_template('update.html', data = data)

@app.route('/updatepengguna', methods = ['POST'])
def updatepengguna():
    if request.method == 'POST' and request.form['update']:
        
        if db.updatePengguna(session['update'], request.form):
            flash('Data User berhasil diperbarui')
           
        else:
            flash('Data User tidak dapat diperbarui')
        
        session.pop('update', None)
        
        return redirect(url_for('index'))
    else:
        return redirect(url_for('index'))
    
@app.route('/delete/<int:id>/')
def delete(id):
    data = db.getPengguna(id);
    
    if len(data) == 0:
        return redirect(url_for('index'))
    else:
        session['delete'] = id
        return render_template('delete.html', data = data)

@app.route('/deletepengguna', methods = ['POST'])
def deletepengguna():
    if request.method == 'POST' and request.form['delete']:
        
        if db.deletePengguna(session['delete']):
            flash('Data user berhasil dihapus')
           
        else:
            flash('Data user tidak dapat dihapus')
        
        session.pop('delete', None)
        
        return redirect(url_for('index'))
    else:
        return redirect(url_for('index'))

@app.errorhandler(404)
def page_not_found(error):
    return render_template('error.html')

if __name__ == '__main__':
    app.run(debug = True, port=9090, host="0.0.0.0")