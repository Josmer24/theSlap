import mysql.connector

# Conexión a la base de datos MySQL
def get_db_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="Josmer", 
        password="GusMer2402",
        database="ChismesDB"
    )
    return connection

# Registrar un nuevo usuario
def register_user(nombre, correo, contrasena):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Usuarios (nombre, correo, contrasena) VALUES (%s, %s, %s)", (nombre, correo, contrasena))
    conn.commit()

    cursor.execute("SELECT id_usuario FROM Usuarios WHERE correo=%s", (correo,))
    nuevo_usuario_id = cursor.fetchone()[0]

    # Conectar nuevo usuario con usuario 1 como ejemplo
    cursor.execute("INSERT INTO Conexiones (id_usuario1, id_usuario2) VALUES (%s, %s)", (nuevo_usuario_id, 1))
    conn.commit()

    cursor.close()
    conn.close()

# Iniciar sesión
def login_user(correo, contrasena):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id_usuario, contrasena FROM Usuarios WHERE correo=%s", (correo,))
    user = cursor.fetchone()
    cursor.close()
    conn.close()
    if user and user[1] == contrasena:
        return user[0]
    return None

# Insertar un chisme
def insert_chisme(id_autor, id_persona, texto):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Chismes (id_autor, id_persona, texto) VALUES (%s, %s, %s)", (id_autor, id_persona, texto))
    conn.commit()
    cursor.close()
    conn.close()

# Obtener todos los chismes
def get_chismes():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id_chisme, id_autor, id_persona, texto, votos FROM Chismes")
    chismes = cursor.fetchall()
    cursor.close()
    conn.close()
    return chismes

# Votar por un chisme
def vote_chisme(id_chisme):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE Chismes SET votos = votos + 1 WHERE id_chisme = %s", (id_chisme,))
    conn.commit()
    cursor.close()
    conn.close()