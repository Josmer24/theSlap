from flask import Flask, render_template, request, redirect, url_for, flash
from models import get_db_connection, register_user, login_user, insert_chisme, get_chismes, vote_chisme
from utils import puede_ver_chisme

app = Flask(__name__)
app.secret_key = "your_secret_key"

# Página de bienvenida
@app.route('/')
def welcome():
    return render_template('welcome.html')

# Ruta para login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        correo = request.form['correo']
        contrasena = request.form['contrasena']
        user_id = login_user(correo, contrasena)
        if user_id:
            flash('Inicio de sesión exitoso.')
            return redirect(url_for('ver_chismes', usuario_actual=user_id))
        else:
            flash('Correo o contraseña incorrectos.')
    return render_template('login.html')

# Ruta para ver los chismes
@app.route('/chismes/<int:usuario_actual>')
def ver_chismes(usuario_actual):
    todos_los_chismes = get_chismes()
    chismes_visibles = [chisme for chisme in todos_los_chismes if puede_ver_chisme(usuario_actual, chisme[1], chisme[2])]
    return render_template('chismes.html', chismes=chismes_visibles, usuario_actual=usuario_actual)

# Ruta para votar por un chisme
@app.route('/votar/<int:id_chisme>', methods=['POST'])
def votar_chisme(id_chisme):
    vote_chisme(id_chisme)
    return redirect(url_for('ver_chismes', usuario_actual=1))  # Cambia 'usuario_actual' por el real

# Ruta para agregar un nuevo chisme
@app.route('/agregar_chisme', methods=['GET', 'POST'])
def agregar_chisme():
    if request.method == 'POST':
        id_autor = 1  # ID del usuario actual, debe ser dinámico
        id_persona = request.form['id_persona']
        texto = request.form['texto']
        insert_chisme(id_autor, id_persona, texto)
        flash('Chisme agregado con éxito.')
        return redirect(url_for('ver_chismes', usuario_actual=id_autor))
    return render_template('agregar_chisme.html')

# Ruta para registro
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        nombre = request.form['nombre']
        correo = request.form['correo']
        contrasena = request.form['contrasena']
        register_user(nombre, correo, contrasena)
        flash('Usuario registrado con éxito y conectado a otros usuarios.')
        return redirect(url_for('login'))
    return render_template('register.html')

if __name__ == '__main__':
    app.run(debug=True)