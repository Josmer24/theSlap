import networkx as nx
from models import get_db_connection

# Crear el grafo para los usuarios y sus conexiones
def construir_grafo():
    conn = get_db_connection()
    cursor = conn.cursor()
    G = nx.Graph()
    cursor.execute("SELECT id_usuario1, id_usuario2 FROM Conexiones")
    conexiones = cursor.fetchall()
    for conexion in conexiones:
        G.add_edge(conexion[0], conexion[1])
    cursor.close()
    conn.close()
    return G

# Verificar si un usuario puede ver un chisme
def puede_ver_chisme(usuario_actual, id_autor, id_persona):
    G = construir_grafo()
    if usuario_actual == id_persona:
        return False
    return G.has_edge(usuario_actual, id_autor)